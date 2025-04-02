<?php
session_start();
include 'dbKonexioa.php'; // Archivo de conexión a la base de datos

// Consulta para obtener todos los productos
$sql = "SELECT ID, Izena, Kategoria, Prezioa, Stock, Argazkia FROM produktuak";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Medical Solutions Network - Productos</title>
    <link rel="stylesheet" href="styles.css">
    <?php require_once("head.php"); ?>
    <style>
       .product-list {
    display: flex;
    flex-wrap: wrap; /* Permite que los elementos se ajusten a la siguiente fila si no caben */
    gap: 20px; /* Espaciado entre los elementos */
    justify-content: center; /* Centra los productos horizontalmente */
}

.product-item {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 15px;
    margin: 10px;
    width: 250px; /* Ancho fijo para cada producto */
    text-align: center;
    background-color: #f9f9f9;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Sombra para un diseño más atractivo */
}

.product-item img {
    max-width: 200px;
    max-height: 200px;
    margin-bottom: 10px; /* Espaciado debajo de la imagen */
}

.product-buttons {
    margin-top: 10px;
}

.buy-button, .add-to-cart-button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 5px;
    margin: 5px;
    width: 100%; /* Hace que los botones ocupen todo el ancho del contenedor */
}

.buy-button:hover {
    background-color: #45a049;
}

.add-to-cart-button {
    background-color: #008CBA;
}

.add-to-cart-button:hover {
    background-color: #007bb5;
}
    </style>
</head>
<body>

<header>
<a href="main.php" class="logout-button">Orri printzipalara joan</a>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        
    
        <a href="cesta.php" class="cart-button">Carrito (<?php echo array_sum($_SESSION['cesta']); ?>)</a>
    <?php elseif (isset($_SESSION['invitado'])): ?>
        
       
        <a href="cesta.php" class="cart-button">Carrito (<?php echo array_sum($_SESSION['cesta']); ?>)</a>
    <?php endif; ?>
</header>


<main>
    <h1>Produktuak</h1>
    <div class="product-list">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product-item">';
                echo '<h2>' . htmlspecialchars($row['Izena']) . '</h2>';
                echo '<p>Kategoria: ' . htmlspecialchars($row['Kategoria']) . '</p>';
                echo '<p>Prezioa: ' . htmlspecialchars($row['Prezioa']) . ' €</p>';
                echo '<p>Stock: ' . htmlspecialchars($row['Stock']) . '</p>';
                // Verificar si la imagen está definida y no está vacía
                if (!empty($row['Argazkia'])) {
                    echo '<img src="' . htmlspecialchars($row['Argazkia']) . '" alt="' . htmlspecialchars($row['Izena']) . '" style="max-width: 200px;">';
                } else {
                    echo '<p>Irudia ez dago eskuragarri.</p>';
                }
                // Botón de añadir a la cesta
                echo '<div class="product-buttons">';
                echo '<form action="cesta.php" method="POST" style="display: inline;">';
                echo '<input type="hidden" name="product_id" value="' . htmlspecialchars($row['ID']) . '">';
                echo '<button type="submit" class="add-to-cart-button">Gehitu saskira</button>';
                echo '</form>';
                echo '</div>'; // Cierra product-buttons
                echo '</div>'; // Cierra product-item
            }
        } else {
            echo '<p>Ez dago produkturik datu-basean.</p>';
        }
        ?>
    </div>
</main>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>

</body>
</html>