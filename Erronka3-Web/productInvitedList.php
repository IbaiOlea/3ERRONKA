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
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <a href="main.php" class="logout-button">Pagina printzipalara joan</a>
   
</header>

<main>
    <h1>Produktuak</h1>
    <div class="product-list">
        <?php
        if ($result && $result->num_rows > 0) {
            // Iterar sobre los productos y mostrarlos
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product-item">';
                echo '<h2>' . htmlspecialchars($row['Izena']) . '</h2>';
                echo '<p>Kategoria: ' . htmlspecialchars($row['Kategoria']) . '</p>';
                echo '<p>Prezioa: ' . htmlspecialchars($row['Prezioa']) . ' €</p>';
                echo '<p>Stock: ' . htmlspecialchars($row['Stock']) . '</p>';
                if (!empty($row['Argazkia'])) {
                    echo '<img src="' . htmlspecialchars($row['Argazkia']) . '" alt="' . htmlspecialchars($row['Izena']) . '" style="max-width: 200px; max-height: 200px;">';
                } else {
                    echo '<p>Irudia ez dago eskuragarri.</p>';
                }
                echo '</div>';
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