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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recoge los datos del formulario
    $izena = $_POST['izena'];
    $abizena = $_POST['abizena'];
    $email = $_POST['email'];
    $password = $_POST['password']; // Contraseña sin encriptar

    // Inserta los datos en la base de datos
    $sql = "INSERT INTO erabiltzaileak (Izena, Abizena, Posta_elektronikoa, Pasahitza) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $izena, $abizena, $email, $password);

    if ($stmt->execute()) {
        // Guarda el ID del usuario en la sesión
        $_SESSION['user_id'] = $stmt->insert_id;
        $_SESSION['email'] = $email;

        // Redirige al usuario a la página principal después del registro exitoso
        header("Location: main.php");
        exit();
    } else {
        $error_message = t('errorSavingData') . ": " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <title><?= t('registerTitle') ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <a href="main.php" class="logout-button"><?= t('goToMain') ?></a>
    
    <div class="language-selector">
    <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
    <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
</div>
</header>

<div class="login-container">
    <div class="texto">
        <h2><?= t('registerTitle') ?></h2>
        <?php
        if (isset($error_message)) {
            echo '<div class="error-message">'.htmlspecialchars($error_message).'</div>';
        }
        ?>
        <form action="" method="POST">
            <input type="text" name="izena" placeholder="<?= t('name') ?>" required>
            <input type="text" name="abizena" placeholder="<?= t('surname') ?>" required>
            <input type="email" name="email" placeholder="<?= t('email') ?>" required>
            <input type="password" name="password" placeholder="<?= t('password') ?>" required>
            <button type="submit"><?= t('register') ?></button>
        </form>
    </div>
</div>

<footer>
© 2025 Medical Solutions Network (M.S.N) - <?= t('allRightsReserved') ?>
</footer>

</body>
</html>