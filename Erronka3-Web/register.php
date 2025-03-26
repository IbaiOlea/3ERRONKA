<?php
session_start();
include 'dbKonexioa.php'; // Asegúrate de que este archivo contiene la conexión a la base de datos.

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recoge los datos del formulario
    $email = $_POST['email'];
    $password = $_POST['password']; // Almacena la contraseña tal cual (sin encriptar)

    // Inserta los datos en la base de datos
    $sql = "INSERT INTO erabiltzaileak (Posta_elektronikoa, Pasahitza) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);

    if ($stmt->execute()) {
        // Redirige al usuario a la página principal después del registro exitoso
        header("Location: main.php");
        exit();
    } else {
        $error_message = "Errorea datuak gordetzean: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Medical Solutions Network</title>
    <link rel="stylesheet" href="styles.css">
    <?php require_once("head.php"); ?>
</head>
<body>

    <header>
        <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
        <a href="main.php" class="logout-button">Pagina printzipalara joan</a>
    </header>

    <div class="login-container">
        <div class="texto">
            <h2>Erregistratu</h2>
            <?php
            if (isset($error_message)) {
                echo '<div class="error-message">'.$error_message.'</div>';
            }
            ?>
            <form action="" method="POST">
                <input type="email" name="email" placeholder="Posta elektronikoa" required>
                <input type="password" name="password" placeholder="Pasahitza" required>
                <button type="submit">Erregistratu</button>
            </form>
        </div>
    </div>

    <footer>
        © 2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta
    </footer>

</body>
</html>