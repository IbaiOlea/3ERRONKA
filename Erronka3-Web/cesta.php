<?php 
include 'dbKonexioa.php'; // Archivo de conexión a la base de datos
session_start();

// Inicializa el carrito si no existe
if (!isset($_SESSION['cesta']) || !is_array($_SESSION['cesta'])) {
    $_SESSION['cesta'] = [];
}

// Procesar la compra
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['buy'])) {
    if (!empty($_SESSION['cesta'])) {
        foreach ($_SESSION['cesta'] as $product_id => $cantidad) {
            // Consulta para obtener el precio del producto
            $sql = "SELECT Prezioa FROM produktuak WHERE ID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result && $result->num_rows > 0) {
                $product = $result->fetch_assoc();
                $prezioa = $product['Prezioa'];

                // Insertar en la tabla fakturak
                $sql_insert = "INSERT INTO fakturak (ErabiltzaileID, ProduktuaID, Erosketa_data, Kantitatea, Prezioa)
                               VALUES (?, ?, NOW(), ?, ?)";
                $stmt_insert = $conn->prepare($sql_insert);
                $stmt_insert->bind_param("iiid", $_SESSION['user_id'], $product_id, $cantidad, $prezioa);
                $stmt_insert->execute();
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
            echo '<p>Saskia hutsik dago.</p>';
        }
        ?>
    </div>
    <?php if (!empty($_SESSION['cesta'])): ?>
        <form action="cesta.php" method="POST">
            <input type="hidden" name="buy" value="1">
            <button type="submit" class="buy-button">Erosi</button>
        </form>
    <?php endif; ?>
    <?php if (isset($compra_realizada) && $compra_realizada): ?>
        <p>Erosketa ondo egin da.</p>
    <?php endif; ?>
</div>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>
</body>
</html>
