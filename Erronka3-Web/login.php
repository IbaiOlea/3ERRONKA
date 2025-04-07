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
?>
<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <title><?= t('loginTitle') ?></title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
    <a href="main.php" class="logout-button"><?= t('goToMain') ?></a>
    <a href="main.php?invitado=1" class="guest-button"><?= t('loginAsGuest') ?></a>
    
    <div class="language-selector">
    <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
    <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
</div>
</header>

<div class="login-container">
    <div class="texto">
        <h2><?= t('loginTitle') ?></h2>
        <?php
        if (isset($error_message)) {
            echo '<div class="error-message">'.htmlspecialchars($error_message).'</div>';
        }
        ?>
        <form action="" method="POST">
            <input type="email" name="email" placeholder="<?= t('email') ?>" required>
            <input type="password" name="password" placeholder="<?= t('password') ?>" required>
            <button type="submit"><?= t('submit') ?></button>
        </form>
        <br>
        <a class="registbutton" href="register.php"><?= t('register') ?></a>
    </div>
</div>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_POST['email']) || !isset($_POST['password'])) {
        $error_message = t('emailPasswordRequired');
    } else {
        $email = trim($_POST['email']);
        $password = trim($_POST['password']);

        if (empty($email) || empty($password)) {
            $error_message = t('emailPasswordEmpty');
        } else {
            if (!$conn) {
                $error_message = t('dbConnectionError');
            } else {
                $stmt = $conn->prepare("SELECT ID, Izena, Pasahitza FROM erabiltzaileak WHERE Posta_elektronikoa = ?");
                if (!$stmt) {
                    $error_message = t('queryError') . ": " . $conn->error;
                } else {
                    $stmt->bind_param("s", $email);
                    $stmt->execute();
                    $result = $stmt->get_result();

                    if ($result->num_rows === 1) {
                        $row = $result->fetch_assoc();
                        if ($password === $row['Pasahitza']) {
                            $_SESSION['user_id'] = $row['ID'];
                            $_SESSION['user_name'] = $row['Izena'];
                            $_SESSION['user_type'] = 'langilea';
                            header("Location: main.php");
                            exit();
                        } else {
                            $error_message = t('wrongPassword');
                        }
                    } else {
                        $error_message = t('userNotFound');
                    }
                }
            }
        }
    }
}
?>

<?php if (!empty($error_message)): ?>
    <div class="error-message"><?= htmlspecialchars($error_message) ?></div>
<?php endif; ?>

<footer>
    © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
</footer>

</body>
</html>