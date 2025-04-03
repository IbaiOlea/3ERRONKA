<?php 
session_start();
include 'dbKonexioa.php'; // Archivo de conexión a la base de datos

$user_data = [];
$imc = null;
$egoera_text = '';

// Configurar sesión para invitados
if (isset($_GET['invitado']) && $_GET['invitado'] == 1) {
    $_SESSION['invitado'] = true;
    $_SESSION['user_id'] = 0;
}

// Inicializar el carrito si no existe
if (!isset($_SESSION['cesta'])) {
    $_SESSION['cesta'] = [];
}

// Obtener datos del usuario si está registrado
if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0) {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM erabiltzaileak WHERE ID = $user_id";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $user_data = $result->fetch_assoc();
    }

    // Calcular IMC solo si los datos de peso y altura están disponibles
    if (!empty($user_data['Pisua']) && !empty($user_data['Altuera'])) {
        $altura_metros = $user_data['Altuera'] / 100; // Convertir cm a metros
        $imc = round($user_data['Pisua'] / ($altura_metros * $altura_metros), 2); // Fórmula del IMC
    } else {
        $imc = 'Datos incompletos'; // Si no hay datos completos para el cálculo
    }

    // Determinar la "egoera" basándose en el IMC
    if ($imc !== 'Datos incompletos') {
        if ($imc < 18.5) {
            $egoera_text = 'Desnutrizioa';
        } elseif ($imc >= 18.5 && $imc <= 24.9) {
            $egoera_text = 'Pisu normala';
        } elseif ($imc >= 25 && $imc <= 29.9) {
            $egoera_text = 'Sobrepisua';
        } else {
            $egoera_text = 'Obesitatea';
        }
    } 
}
?>
<!DOCTYPE html>
<html lang="eu">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Datu Pertsonalak</title>
</head>
<body>
<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">

    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <!-- Usuario REGISTRADO (oculta "Saioa Hasi") -->
        <a href="produktuak.php" class="product-link">Zure produktuak</a>
        <a href="logout.php" class="logout-button">Saioa itxi</a>
        <a href="cesta.php" class="cart-button">Carrito (<?php echo array_sum($_SESSION['cesta']); ?>)</a>

    <?php elseif (isset($_SESSION['invitado']) && $_SESSION['invitado']): ?>
        <!-- Modo INVITADO (muestra "Saioa Hasi" + carrito) -->
        <a href="login.php" class="logout-button">Saioa hasi</a>
        <a href="productInvitedList.php" class="product-link">Produktu zerrenda</a>
        <a href="cesta.php" class="cart-button">Carrito (<?php echo array_sum($_SESSION['cesta']); ?>)</a>

    <?php else: ?>
        <!-- Sin sesión (solo "Saioa Hasi") -->
        <a href="login.php" class="logout-button">Saioa hasi</a>
    <?php endif; ?>
</header>

<div class="form-container">
    <h1>Datu Pertsonalak</h1>
    <div class="form-section">
        <div class="form-group">
            <label for="izena">Izena:</label>
            <input type="text" id="izena" value="<?php echo !empty($user_data['Izena']) ? htmlspecialchars($user_data['Izena']) : ''; ?>" readonly>
        </div>
        <div class="form-group">
            <label for="abizena">Abizena:</label>
            <input type="text" id="abizena" value="<?php echo !empty($user_data['Abizena']) ? htmlspecialchars($user_data['Abizena']) : ''; ?>" readonly>
        </div>
        <div class="form-group">
            <label for="Jaiotze_data">Jaiotze data:</label>
            <input type="date" id="Jaiotze_data" value="<?php echo !empty($user_data['Jaiotze_data']) ? htmlspecialchars($user_data['Jaiotze_data']) : ''; ?>" readonly>
        </div>
        <div class="form-group">
            <label for="sexua">Sexua:</label>
            <input type="text" id="sexua" value="<?php echo !empty($user_data['Sexua']) ? htmlspecialchars($user_data['Sexua']) : ''; ?>" readonly>
        </div>
    </div>
    <hr>
    <h2>Egoera Fisikoa</h2>
    <div class="form-section">
        <div class="form-group">
            <label for="egoera">Egoera:</label>
            <input type="text" id="egoera" value="<?php echo $egoera_text; ?>" readonly>
        </div>
    </div>
    <hr>
    <!-- Sección 3: IMC -->
    <h2>Gorputz-masaren indizea (IMC)</h2>
    <div class="form-section">
        <div class="form-group">
            <label for="pisua">Pisua:</label>
            <input type="number" id="pisua" value="<?= $user_data['Pisua'] ?? '' ?>" step="0.1" readonly> kg
        </div>
        <div class="form-group">
            <label for="altuera">Altuera:</label>
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
