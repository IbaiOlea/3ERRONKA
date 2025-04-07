<?php 
session_start();
include 'dbKonexioa.php';

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

$user_data = [];
$imc = null;
$egoera_text = '';

if (isset($_GET['invitado']) && $_GET['invitado'] == 1) {
    $_SESSION['invitado'] = true;
    $_SESSION['user_id'] = 0;
}

if (!isset($_SESSION['cesta'])) {
    $_SESSION['cesta'] = [];
}

if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0) {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM erabiltzaileak WHERE ID = $user_id";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $user_data = $result->fetch_assoc();
    }

    if (!empty($user_data['Pisua']) && !empty($user_data['Altuera'])) {
        $altura_metros = $user_data['Altuera'] / 100;
        $imc = round($user_data['Pisua'] / ($altura_metros * $altura_metros), 2);
    } else {
        $imc = t('Datos incompletos');
    }

    if ($imc !== t('Datos incompletos')) {
        if ($imc < 18.5) {
            $egoera_text = t('Desnutrizioa');
        } elseif ($imc >= 18.5 && $imc <= 24.9) {
            $egoera_text = t('Pisu normala');
        } elseif ($imc >= 25 && $imc <= 29.9) {
            $egoera_text = t('Sobrepisua');
        } else {
            $egoera_text = t('Obesitatea');
        }
    } 
}
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title><?= t('pageTitle') ?></title>
</head>
<body>
<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">

    <div class="language-selector">
    <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
    <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
</div>

    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <a href="produktuak.php" class="product-link"><?= t('yourProducts') ?></a>
        <a href="logout.php" class="logout-button"><?= t('logout') ?></a>
        <a href="cesta.php" class="cart-button"><?= t('cart') ?> (<?php echo array_sum($_SESSION['cesta']); ?>)</a>
    <?php elseif (isset($_SESSION['invitado']) && $_SESSION['invitado']): ?>
        <a href="login.php" class="logout-button"><?= t('login') ?></a>
        <a href="productInvitedList.php" class="product-link"><?= t('products') ?></a>
        <a href="cesta.php" class="cart-button"><?= t('cart') ?> (<?php echo array_sum($_SESSION['cesta']); ?>)</a>
    <?php else: ?>
        <a href="login.php" class="logout-button"><?= t('login') ?></a>
    <?php endif; ?>
</header>

<div class="form-container">
    <h1><?= t('pageTitle') ?></h1>
    <div class="form-section">
        <div class="form-group">
            <label for="izena"><?= t('name') ?>:</label>
            <input type="text" id="izena" value="<?php echo !empty($user_data['Izena']) ? htmlspecialchars($user_data['Izena']) : ''; ?>" readonly>
        </div>
        <div class="form-group">
            <label for="abizena"><?= t('surname') ?>:</label>
            <input type="text" id="abizena" value="<?php echo !empty($user_data['Abizena']) ? htmlspecialchars($user_data['Abizena']) : ''; ?>" readonly>
        </div>
        <div class="form-group">
            <label for="Jaiotze_data"><?= t('birthDate') ?>:</label>
            <input type="date" id="Jaiotze_data" value="<?php echo !empty($user_data['Jaiotze_data']) ? htmlspecialchars($user_data['Jaiotze_data']) : ''; ?>" readonly>
        </div>
        <div class="form-group">
            <label for="sexua"><?= t('gender') ?>:</label>
            <input type="text" id="sexua" value="<?php echo !empty($user_data['Sexua']) ? htmlspecialchars($user_data['Sexua']) : ''; ?>" readonly>
        </div>
    </div>
    <hr>
    <h2><?= t('physicalStatus') ?></h2>
    <div class="form-section">
        <div class="form-group">
            <label for="egoera"><?= t('status') ?>:</label>
            <input type="text" id="egoera" value="<?php echo $egoera_text; ?>" readonly>
        </div>
    </div>
    <hr>
    <h2><?= t('imcTitle') ?></h2>
    <div class="form-section">
        <div class="form-group">
            <label for="pisua"><?= t('weight') ?>:</label>
            <input type="number" id="pisua" value="<?= $user_data['Pisua'] ?? '' ?>" step="0.1" readonly> kg
        </div>
        <div class="form-group">
            <label for="altuera"><?= t('height') ?>:</label>
            <input type="number" id="altuera" value="<?= $user_data['Altuera'] ?? '' ?>" readonly> cm
        </div>
        <div class="form-group">
            <label for="imc">IMC:</label>
            <input type="text" id="imc" value="<?= htmlspecialchars($imc) ?>" readonly>
        </div>
    </div>
</div>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>

</body>
</html>