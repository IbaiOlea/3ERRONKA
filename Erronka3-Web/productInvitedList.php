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
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <a href="main.php" class="logout-button"><?= t('goToMain') ?></a>
    
    <div class="menu-toggle" aria-expanded="false">
    <span class="icon-menu">☰</span>
    <span class="icon-close">✖</span>
</div>
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
    <div class="product-container">
    <?php
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo '<div class="product-box">';
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