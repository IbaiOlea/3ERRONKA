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
    <link rel="stylesheet" href=".css">
    <title>Datu Pertsonalak</title>
</head>
<body>
<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <a href="logout.php" class="logout-button">Saioa itxi</a>
        <a href="produktuak.php" class="product-link">Zure produktuak</a>
    <?php elseif (isset($_SESSION['invitado'])): ?>
        <a href="login.php" class="login-link">Saioa hasi</a>
        <a href="productInvitedList.php" class="product-link">Produktu zerrenda</a>
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
            <label for="jaiotze_data">Jaiotze data:</label>
            <input type="date" id="jaiotze_data" value="<?php echo $jaiotze_data; ?>" readonly>
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
    <h2>Gorputz-masaren indizea (IMC)</h2>
    <div class="form-section">
        <div class="form-group">
            <label for="pisua">Pisua:</label>
            <input type="number" id="pisua" step="0.1" value="<?php echo isset($user_data['Pisua']) ? htmlspecialchars($user_data['Pisua']) : ''; ?>" readonly> kg
        </div>
        <div class="form-group">
            <label for="altuera">Altuera:</label>
            <input type="number" id="altuera" value="<?php echo isset($user_data['Altuera']) ? htmlspecialchars($user_data['Altuera']) : ''; ?>" readonly> cm
        </div>
        <div class="form-group">
            <label for="imc">IMC:</label>
            <input type="text" id="imc" value="<?php echo $imc ? round($imc, 2) : ''; ?>" readonly>
        </div>
    </div>
</div>
<footer>
© 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>
<?php
if (!isset($_SESSION['user_id'])) {
    echo '<div class="logout-message"><p><a href="login.php" class="login-link">Hasi saioa</a></p></div>';
}
?>
</body>
</html>