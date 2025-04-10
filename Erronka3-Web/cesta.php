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

// Inicializa el carrito si no existe
if (!isset($_SESSION['cesta']) || !is_array($_SESSION['cesta'])) {
    $_SESSION['cesta'] = [];
}

// Procesar la compra
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['buy'])) {
    if (!empty($_SESSION['cesta'])) {
        foreach ($_SESSION['cesta'] as $product_id => $cantidad) {
            // Consulta para obtener el precio y el stock del producto
            $sql = "SELECT Prezioa, Stock FROM produktuak WHERE ID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result && $result->num_rows > 0) {
                $product = $result->fetch_assoc();
                $prezioa = $product['Prezioa'];
                $stock_actual = $product['Stock'];

                // Verificar si hay suficiente stock
                if ($stock_actual >= $cantidad) {
                    // Insertar en la tabla fakturak
                    $sql_insert = "INSERT INTO fakturak (ErabiltzaileID, ProduktuaID, Erosketa_data, Kantitatea, Prezioa)
                                   VALUES (?, ?, NOW(), ?, ?)";
                    $stmt_insert = $conn->prepare($sql_insert);
                    $stmt_insert->bind_param("iiid", $_SESSION['user_id'], $product_id, $cantidad, $prezioa);
                    $stmt_insert->execute();

                    // Reducir el stock del producto
                    $nuevo_stock = $stock_actual - $cantidad;
                    $sql_update_stock = "UPDATE produktuak SET Stock = ? WHERE ID = ?";
                    $stmt_update_stock = $conn->prepare($sql_update_stock);
                    $stmt_update_stock->bind_param("ii", $nuevo_stock, $product_id);
                    $stmt_update_stock->execute();
                } else {
                    // Mostrar mensaje de error si no hay suficiente stock
                    echo "<p>" . t('notEnoughStock') . ": " . htmlspecialchars($product['Izena']) . "</p>";
                }
            }
        }

        // Vaciar el carrito después de la compra
        $_SESSION['cesta'] = [];

        // Mostrar mensaje de confirmación
        $compra_realizada = true;
    }
}

// Verifica si se envió un producto por POST para añadir al carrito
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['product_id'])) {
    $product_id = intval($_POST['product_id']);

    // Si el producto ya está en el carrito, incrementa la cantidad
    if (isset($_SESSION['cesta'][$product_id])) {
        $_SESSION['cesta'][$product_id]++;
    } else {
        // Si no está, agrégalo con cantidad 1
        $_SESSION['cesta'][$product_id] = 1;
    }

    // Redirige de vuelta a la página de productos
    header("Location: produktuak.php");
    exit();
}

// Verifica si se envió un producto por POST para eliminar del carrito
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['remove_product_id'])) {
    $remove_product_id = intval($_POST['remove_product_id']);
    if (isset($_SESSION['cesta'][$remove_product_id])) {
        unset($_SESSION['cesta'][$remove_product_id]); // Eliminar el producto del carrito
    }
    // Redirige para evitar reenvío del formulario
    header("Location: cesta.php");
    exit();
}

?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title><?= t('cart') ?></title>
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
        <a href="produktuak.php"><?= t('yourProducts') ?></a>
        <a href="konfigurazioa.php"><?= t('configuration') ?></a>
        <a href="logout.php"><?= t('logout') ?></a>
        <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
        <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
    </div>

    <div class="language-selector">
        <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
        <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
    </div>

    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <a href="produktuak.php" class="product-link"><?= t('yourProducts') ?></a>
        <a href="logout.php" class="logout-button"><?= t('logout') ?></a>
        <a href="konfigurazioa.php" class="config-button"><?= t('configuration') ?></a>
    <?php elseif (isset($_SESSION['invitado'])): ?>
        <a href="login.php" class="logout-button"><?= t('login') ?></a>
        <a href="productInvitedList.php" class="product-link"><?= t('products') ?></a>
        <a href="konfigurazioa.php" class="config-button"><?= t('configuration') ?></a>
    <?php endif; ?>
</header>

<div class="form-container">
    <h1><?= t('cart') ?></h1>
    <div class="form-section">
        <?php
        if (!empty($_SESSION['cesta'])) {
            echo '<ul>';
            foreach ($_SESSION['cesta'] as $product_id => $cantidad) {
                $sql = "SELECT Izena, Argazkia FROM produktuak WHERE ID = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $product_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result && $result->num_rows > 0) {
                    $product = $result->fetch_assoc();
                    echo '<li>';
                    if (!empty($product['Argazkia'])) {
                        echo '<img src="' . htmlspecialchars($product['Argazkia']) . '" alt="' . htmlspecialchars($product['Izena']) . '" class="product-image">';
                    }
                    echo htmlspecialchars($product['Izena']) . ' - ' . t('quantity') . ': ' . $cantidad;
                    echo '<form action="cesta.php" method="POST" style="display: inline;">';
                    echo '<input type="hidden" name="remove_product_id" value="' . htmlspecialchars($product_id) . '">';
                    echo '<button type="submit" class="remove-button">' . t('remove') . '</button>';
                    echo '</form>';
                    echo '</li>';
                }
            }
            echo '</ul>';
        } else {
            echo '<p>' . t('emptyCart') . '</p>';
        }
        ?>
    </div>
    <?php if (!empty($_SESSION['cesta'])): ?>
        <form action="cesta.php" method="POST">
            <input type="hidden" name="buy" value="1">
            <button type="submit" class="buy-button"><?= t('buy') ?></button>
        </form>
    <?php endif; ?>
    <?php if (isset($compra_realizada) && $compra_realizada): ?>
        <p><?= t('purchaseCompleted') ?></p>
    <?php endif; ?>
</div>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - <?= t('allRightsReserved') ?>
</footer>
<script src="hamburger.js"></script>
</body>
</html>