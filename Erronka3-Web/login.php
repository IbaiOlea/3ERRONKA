<?php
session_start();
include 'dbKonexioa.php';
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
        <a href="main.php?invitado=1" class="guest-button">Gonbidatu bezala sartu</a>
    </header>

    <div class="login-container">
        <div class="texto">
            <h2>Saioa Hasi</h2>
            <?php
            if (isset($error_message)) {
                echo '<div class="error-message">'.$error_message.'</div>';
            }
            ?>
            <form action="" method="POST">
                <input type="email" name="email" placeholder="Posta elektronikoa" required>
                <input type="password" name="password" placeholder="Pasahitza" required>
                <button type="submit">Sartu</button>
            </form>
            <br>
            <a class="registbutton" href="register.php">Erregistratu</a>
        </div>
    </div>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_POST['email']) || !isset($_POST['password'])) {
        $error_message = "Posta elektronikoa eta pasahitza beharrezkoak dira.";
    } else {
        $email = trim($_POST['email']);
        $password = trim($_POST['password']);

        if (empty($email) || empty($password)) {
            $error_message = "Posta elektronikoa eta pasahitza ezin dira hutsik egon.";
        } else {
            if (!$conn) {
                $error_message = "Datu-basearekin konexio arazoak daude.";
            } else {
                
                $stmt = $conn->prepare("SELECT ID, Izena, Pasahitza FROM erabiltzaileak WHERE Posta_elektronikoa = ?");
                if (!$stmt) {
                    $error_message = "Errorea kontsulta prestatzerakoan: " . $conn->error;
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
                            $error_message = "Pasahitza okerra.";
                        }
                    } else {
                        $error_message = "Langilerik ez da aurkitu posta elektroniko horrekin.";
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