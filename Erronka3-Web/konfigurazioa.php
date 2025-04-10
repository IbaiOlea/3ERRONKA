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

// Verificar si las traducciones se cargaron correctamente
if (!$translations) {
    die('Error: No se pudieron cargar las traducciones.');
}

// Función para obtener una traducción
function t($key) {
    global $translations, $lang;
    return $translations[$lang][$key] ?? $key;
}

// Procesar el formulario para guardar los colores en conf.xml
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mainColor = $_POST['mainColor'] ?? '#808080';
    $footerColor = $_POST['footerColor'] ?? '#808080';

    // Cargar el archivo XML
    $xml = simplexml_load_file('conf.xml');

    // Actualizar los valores
    $xml->mainColor = $mainColor;
    $xml->footerColor = $footerColor;

    // Guardar los cambios en el archivo XML
    $xml->asXML('conf.xml');

    // Actualizar los colores en la página y en localStorage
    echo "<script>
        localStorage.setItem('--main-color', '$mainColor');
        localStorage.setItem('--footer-color', '$footerColor');
        document.documentElement.style.setProperty('--main-color', '$mainColor');
        document.documentElement.style.setProperty('--footer-color', '$footerColor');
    </script>";
}
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title><?= t('configurationTitle') ?></title>
    <script>
        // Cargar colores desde conf.xml y localStorage al cargar la página
        document.addEventListener('DOMContentLoaded', () => {
            const mainColor = localStorage.getItem('--main-color') || '<?= htmlspecialchars(simplexml_load_file('conf.xml')->mainColor) ?>';
            const footerColor = localStorage.getItem('--footer-color') || '<?= htmlspecialchars(simplexml_load_file('conf.xml')->footerColor) ?>';
            document.documentElement.style.setProperty('--main-color', mainColor);
            document.documentElement.style.setProperty('--footer-color', footerColor);
            document.getElementById('mainColor').value = mainColor;
            document.getElementById('footerColor').value = footerColor;
        });
    </script>
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    
    <div class="menu-toggle">☰</div>
    <div class="dropdown-menu">
        <a href="main.php"><?= t('goToMain') ?></a>
        <a href="cesta.php"><?= t('cart') ?></a>
        <a href="produktuak.php"><?= t('yourProducts') ?></a>
        <a href="logout.php"><?= t('logout') ?></a>
        <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
        <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
    </div>

    <div class="language-selector">
        <a href="?lang=eu" class="language-button"><img src="eu.png" alt="<?= t('languageEU') ?>"></a>
        <a href="?lang=en" class="language-button"><img src="en.png" alt="<?= t('languageEN') ?>"></a>
    </div>

    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <a href="main.php" class="logout-button"><?= t('goToMain') ?></a>
        <a href="cesta.php" class="cart-button"><?= t('cart') ?> (<?php echo array_sum($_SESSION['cesta']); ?>)</a>
        <a href="produktuak.php" class="product-link"><?= t('yourProducts') ?></a>
    <?php endif; ?>
</header>

<div class="form-container">
    <h1><?= t('configurationTitle') ?></h1>
    <form method="POST" action="">
        <div class="form-section">
            <div>
                <label for="mainColor"><?= t('headerColor') ?>:</label>
            </div>
            <div>
                <input type="color" id="mainColor" name="mainColor" />
            </div>
            <br>
            <div>
                <label for="footerColor"><?= t('footerColor') ?>:</label>
            </div>
            <div>
                <input type="color" id="footerColor" name="footerColor" />
            </div>
            <br>
        </div>
        <div class="form-section">
            <button type="submit" class="button"><?= t('saveColors') ?></button>
            <br>
            <button type="button" onclick="setDefaultColors()" class="button"><?= t('resetToDefaultColors') ?></button>
        </div>
    </form>
</div>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - <?= t('allRightsReserved') ?>
</footer>
<script src="hamburger.js"></script>
<script>
    // Cambiar el color dinámicamente y guardar en localStorage
    function updateColor(variable, value) {
        document.documentElement.style.setProperty(variable, value);
        localStorage.setItem(variable, value); // Guardar en localStorage
    }

    // Restablecer colores predeterminados
    function setDefaultColors() {
        const defaultMainColor = '#808080'; // Color predeterminado del header
        const defaultFooterColor = '#808080'; // Color predeterminado del footer
        document.getElementById('mainColor').value = defaultMainColor;
        document.getElementById('footerColor').value = defaultFooterColor;
        updateColor('--main-color', defaultMainColor);
        updateColor('--footer-color', defaultFooterColor);
    }
</script>
</body>
</html>