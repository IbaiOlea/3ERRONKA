<?php 
$servername = "localhost";
$username = "root";
$password = "1MG2024";
$dbname = "erronka3";

$user_data = [];
$jaiotze_data = '';
$imc = null;
$egoera_text = '';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

session_start();

// Inicializa el carrito si no existe
if (!isset($_SESSION['cesta'])) {
    $_SESSION['cesta'] = [];
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

if (isset($_GET['invitado']) && $_GET['invitado'] == 1) {
    $_SESSION['invitado'] = true;
    $_SESSION['user_id'] = 0;
}

if (!isset($_SESSION['user_id']) && !isset($_SESSION['invitado'])) {
    header("Location: login.php");
    exit();
}

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM erabiltzaileak WHERE ID = $user_id";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $user_data = $result->fetch_assoc();
        if (!empty($user_data['Jaiotze_data'])) {
            $jaiotze_data = (new DateTime($user_data['Jaiotze_data']))->format('Y-m-d');
        }
        if (!empty($user_data['Pisua']) && !empty($user_data['Altuera'])) {
            $altura_metros = $user_data['Altuera'] / 100;
            $imc = $user_data['Pisua'] / ($altura_metros * $altura_metros);
            $imc_rounded = round($imc, 1);

            if ($imc >= 17 && $imc < 18.5) {
                $egoera_text = "Desnutrizioa";
            } elseif ($imc >= 18.5 && $imc < 25) {
                $egoera_text = "Pisu normala";
            } elseif ($imc >= 25 && $imc < 30) {
                $egoera_text = "Sobrepisua";
            } elseif ($imc >= 30 && $imc < 35);
        }
    }
}
?>
<!DOCTYPE html>
<html lang="eu">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Carrito</title>
    <style>
        .buy-button {
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            border: none;
            cursor: pointer;
        }

        .buy-button:hover {
            background-color: #45a049;
        }

        .remove-button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            font-size: 12px;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 10px;
        }

        .remove-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <a href="produktuak.php" class="product-link">Zure produktuak</a>
        <a href="logout.php" class="logout-button">Saioa itxi</a>
    <?php elseif (isset($_SESSION['invitado'])): ?>
        <a href="login.php" class="logout-button">Saioa hasi</a>
        <a href="productInvitedList.php" class="logout-button">Produktu zerrenda</a>
    <?php endif; ?>
</header>

<div class="form-container">
    <h1>Carrito</h1>
    <div class="form-section">
        <?php
        if (!empty($_SESSION['cesta'])) {
            echo '<ul>';
            foreach ($_SESSION['cesta'] as $product_id => $cantidad) {
                // Consulta para obtener el nombre del producto
                $sql = "SELECT Izena FROM produktuak WHERE ID = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $product_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result && $result->num_rows > 0) {
                    $product = $result->fetch_assoc();
                    echo '<li>';
                    echo htmlspecialchars($product['Izena']) . ' - Kantitatea: ' . $cantidad;
                    // Botón para eliminar el producto del carrito
                    echo '<form action="cesta.php" method="POST" style="display: inline;">';
                    echo '<input type="hidden" name="remove_product_id" value="' . htmlspecialchars($product_id) . '">';
                    echo '<button type="submit" class="remove-button">Kendu</button>';
                    echo '</form>';
                    echo '</li>';
                } else {
                    echo '<li>Producto desconocido (ID: ' . $product_id . ') - Cantidad: ' . $cantidad . '</li>';
                }
            }
            echo '</ul>';
        } else {
            echo '<p>El carrito está vacío.</p>';
        }
        ?>
    </div>
    <?php if (!empty($_SESSION['cesta'])): ?>
        <form action="comprar.php" method="POST">
            <button type="submit" class="buy-button">Erosi</button>
        </form>
    <?php endif; ?>
</div>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>

<?php if (!isset($_SESSION['user_id'])) {
    echo '<div class="logout-message"><p><a href="login.php" class="login-link">Hasi saioa</a></p></div>';
} ?>
</body>
</html>