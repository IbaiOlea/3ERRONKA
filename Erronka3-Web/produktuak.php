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
        $egoera_text = t("underweight");
        $categorias = ["Zerealak", "AzukreArtzainak", "Esnekiak", "Haragiak"];
    } elseif ($imc >= 18.5 && $imc < 25) {
        $egoera_text = t("normalWeight");
        $categorias = ["Frutak", "Barazkiak", "Edariak", "Legumeak", "Ogitartekoa"];
    } else {
        $egoera_text = t("overweight");
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
    echo '<p>' . t('userDataError') . '</p>';
    exit();
}
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <title><?= t('yourProducts') ?></title>
    <link rel="stylesheet" href="styles.css">
    <script>
        // Cargar colores desde conf.xml y localStorage al cargar la página
        document.addEventListener('DOMContentLoaded', () => {
            const mainColor = localStorage.getItem('--main-color') || '<?= htmlspecialchars(simplexml_load_file('conf.xml')->mainColor) ?>';
            const footerColor = localStorage.getItem('--footer-color') || '<?= htmlspecialchars(simplexml_load_file('conf.xml')->footerColor) ?>';
            document.documentElement.style.setProperty('--main-color', mainColor);
            document.documentElement.style.setProperty('--footer-color', footerColor);
        });
    </script>
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
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 400px; /* Altura fija para todas las tarjetas */
        }

        .product-box img {
            max-width: 100px;
            max-height: 100px;
            margin: 0 auto 10px auto; /* Centra la imagen horizontalmente */
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
        }

        .add-to-cart-button:hover {
            background-color: #007bb5;
        }
    </style>
        
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    
    <div class="menu-toggle">☰</div>
    <div class="dropdown-menu">
        <a href="main.php"><?= t('goToMain') ?></a>
        <a href="cesta.php"><?= t('cart') ?></a>
        <a href="konfigurazioa.php"><?= t('configuration') ?></a>
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
        <a href="konfigurazioa.php" class="config-button"><?= t('configuration') ?></a>
    <?php endif; ?>
</header>

<main>
    <h1><?= t('yourProducts') ?></h1>
    
    <div class="product-container">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product-box">';
                echo '<h2>' . htmlspecialchars($row['Izena']) . '</h2>';
                echo '<p><strong>' . t('category') . ':</strong> ' . htmlspecialchars($row['Kategoria']) . '</p>';
                echo '<p><strong>' . t('price') . ':</strong> ' . htmlspecialchars($row['Prezioa']) . ' €</p>';
                echo '<p><strong>' . t('stock') . ':</strong> ' . htmlspecialchars($row['Stock']) . '</p>';
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