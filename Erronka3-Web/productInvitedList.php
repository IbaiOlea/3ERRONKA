<?php
session_start();
include 'dbKonexioa.php';
include 'functions.php'; // Incluir el archivo con la función del header

// Determinar el idioma (por defecto "eu")
if (isset($_GET['lang']) && in_array($_GET['lang'], ['eu', 'en'])) {
    $_SESSION['lang'] = $_GET['lang'];
}
$lang = $_SESSION['lang'] ?? 'eu';

// Cargar traducciones desde el archivo JSON
$translations = json_decode(file_get_contents('itzulpenak.json'), true);

// Función para obtener una traducción
function t($key) {
    global $translations, $lang;
    return $translations[$lang][$key] ?? $key;
}

// Consulta para obtener los productos
$sql = "SELECT ID, Izena, Kategoria, Prezioa, Stock, Argazkia FROM produktuak";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <title><?= t('products') ?></title>
    <link rel="stylesheet" href="styles.css">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const mainColor = localStorage.getItem('--main-color');
            const footerColor = localStorage.getItem('--footer-color');
            if (mainColor) document.documentElement.style.setProperty('--main-color', mainColor);
            if (footerColor) document.documentElement.style.setProperty('--footer-color', footerColor);
        });
    </script>
    <style>
        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .product-item {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            width: 250px;
            text-align: center;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 400px; /* Altura fija para todas las tarjetas */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Sombra para las tarjetas */
        }

        .product-item img {
            width: 100%; /* Ancho completo del contenedor */
            height: 150px; /* Alto fijo para todas las imágenes */
            object-fit: cover; /* Ajusta la imagen para que llene el espacio sin deformarse */
            margin-bottom: 10px; /* Espaciado inferior */
            border-radius: 5px; /* Bordes redondeados para las imágenes */
        }

        .product-buttons {
            margin-top: auto; /* Empuja el botón hacia la parte inferior */
        }

        .add-to-cart-button {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            transition: background-color 0.3s ease; /* Transición suave para el hover */
        }

        .add-to-cart-button:hover {
            background-color: #007bb5;
        }

        .language-selector {
            margin-top: 10px;
            text-align: right;
        }

        .language-button img {
            width: 40px;
            height: 40px;
            vertical-align: middle;
            border-radius: 50%; /* Hace que las imágenes sean circulares */
            border: 1px solid #ccc; /* Añade un borde */
            padding: 2px; /* Espaciado interno */
        }

        .language-button img:hover {
            border-color: #007BFF; /* Cambia el color del borde al pasar el ratón */
        }
    </style>
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <a href="main.php" class="logout-button"><?= t('goToMain') ?></a>
    
    <div class="menu-toggle">☰</div>
    <div class="dropdown-menu">
        <a href="main.php"><?= t('goToMain') ?></a>
        <a href="login.php"><?= t('login') ?></a>
        <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
        <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
    </div>

    <div class="language-selector">
        <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
        <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
    </div>

    <?php if (isset($_SESSION['invitado'])): ?>
        <a href="cesta.php" class="cart-button"><?= t('cart') ?> (<?php echo array_sum($_SESSION['cesta']); ?>)</a>
        <a href="konfigurazioa.php" class="config-button"><?= t('configuration') ?></a>
    <?php endif; ?>
</header>

<main>
    <h1><?= t('products') ?></h1>
    <div class="product-list">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product-item">';
                echo '<h2>' . htmlspecialchars($row['Izena']) . '</h2>';
                echo '<p>' . t('category') . ': ' . htmlspecialchars($row['Kategoria']) . '</p>';
                echo '<p>' . t('price') . ': ' . htmlspecialchars($row['Prezioa']) . ' €</p>';
                echo '<p>' . t('stock') . ': ' . htmlspecialchars($row['Stock']) . '</p>';
                if (!empty($row['Argazkia'])) {
                    echo '<img src="' . htmlspecialchars($row['Argazkia']) . '" alt="' . htmlspecialchars($row['Izena']) . '">';
                } else {
                    echo '<p>' . t('noImageAvailable') . '</p>';
                }
                echo '<div class="product-buttons">';
                echo '<form action="cesta.php" method="POST" style="display: inline;">';
                echo '<input type="hidden" name="product_id" value="' . htmlspecialchars($row['ID']) . '">';
                echo '<button type="submit" class="add-to-cart-button">' . t('addToCart') . '</button>';
                echo '</form>';
                echo '</div>';
                echo '</div>';
            }
        } else {
            echo '<p>' . t('noProducts') . '</p>';
        }
        ?>
    </div>
</main>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - <?= t('allRightsReserved') ?>
</footer>
<script src="hamburger.js"></script>
</body>
</html>