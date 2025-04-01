<?php
session_start();
include 'dbKonexioa.php'; // Archivo de conexión a la base de datos

// Verifica si el usuario ha iniciado sesión
if (!isset($_SESSION['user_id']) || $_SESSION['user_id'] == 0) {
    header("Location: login.php");
    exit();
}

// Obtén el IMC del usuario
$user_id = $_SESSION['user_id'];
$sql_user = "SELECT Pisua, Altuera FROM erabiltzaileak WHERE ID = ?";
$stmt_user = $conn->prepare($sql_user);
$stmt_user->bind_param("i", $user_id);
$stmt_user->execute();
$result_user = $stmt_user->get_result();

if ($result_user->num_rows > 0) {
    $user_data = $result_user->fetch_assoc();
    $altura_metros = $user_data['Altuera'] / 100;
    $imc = $user_data['Pisua'] / ($altura_metros * $altura_metros);
    $imc_rounded = round($imc, 1);

    // Asignar categoría de productos según el IMC
    if ($imc < 18.5) {
        $egoera_text = "Desnutrizioa";
        $categorias = ["Zerealak", "AzukreArtzainak", "Esnekiak", "Haragiak"];
    } elseif ($imc >= 18.5 && $imc < 25) {
        $egoera_text = "Pisu normala";
        $categorias = ["Frutak", "Barazkiak", "Edariak", "Legumeak", "Ogitartekoa"];
    } else {
        $egoera_text = "Sobrepisua";
        $categorias = ["Olioak", "Fruituek", "Landareko Proteinak"];
    }

    // Consulta para obtener productos según la categoría
    $placeholders = implode(',', array_fill(0, count($categorias), '?'));
    $sql = "SELECT ID, Izena, Kategoria, Prezioa, Stock, Argazkia FROM produktuak WHERE Kategoria IN ($placeholders)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param(str_repeat("s", count($categorias)), ...$categorias);
    $stmt->execute();
    $result = $stmt->get_result();
} else {
    echo '<p>Errorea erabiltzailearen datuak lortzean.</p>';
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Medical Solutions Network - Productos</title>
    <link rel="stylesheet" href="styles.css">
    <?php require_once("head.php"); ?>
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .product-box {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            width: 250px;
            text-align: center;
            background-color: #f9f9f9;
        }
        .product-box img {
            max-width: 100px;
            max-height: 100px;
            margin-bottom: 10px;
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
            width: 100%;
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
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <a href="main.php" class="logout-button">Orri printzipalara joan</a>
</header>

<main>
    <h1>Zure produktuak</h1>
    
    <div class="product-container">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product-box">';
                echo '<h2>' . htmlspecialchars($row['Izena']) . '</h2>';
                echo '<p><strong>Kategoria:</strong> ' . htmlspecialchars($row['Kategoria']) . '</p>';
                echo '<p><strong>Prezioa:</strong> ' . htmlspecialchars($row['Prezioa']) . ' €</p>';
                echo '<p><strong>Stock:</strong> ' . htmlspecialchars($row['Stock']) . '</p>';
                if (!empty($row['Argazkia'])) {
                    echo '<img src="' . htmlspecialchars($row['Argazkia']) . '" alt="' . htmlspecialchars($row['Izena']) . '">';
                } else {
                    echo '<p>Irudia ez dago eskuragarri.</p>';
                }
                // Botones de comprar y añadir a la cesta
                echo '<div class="product-buttons">';
                echo '<form action="comprar.php" method="GET" style="display: inline;">';
                echo '<input type="hidden" name="product_id" value="' . htmlspecialchars($row['ID']) . '">';
                echo '<button type="submit" class="buy-button">Erosi</button>';
                echo '</form>';
                echo '<form action="cesta.php" method="POST" style="display: inline;">';
                echo '<input type="hidden" name="product_id" value="' . htmlspecialchars($row['ID']) . '">';
                echo '<button type="submit" class="add-to-cart-button">Gehitu saskira</button>';
                echo '</form>';
                echo '</div>';
                echo '</div>';
            }
        } else {
            echo '<p>Ez dago produkturik zure IMC-rako.</p>';
        }
        ?>
    </div>
</main>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>

</body>
</html>