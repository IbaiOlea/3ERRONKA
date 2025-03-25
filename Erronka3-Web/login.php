<?php
session_start();
include 'dbKonexioa.php';
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Medical Solutions Network</title>
    <!-- Enlazamos el archivo CSS externo -->
    <link rel="stylesheet" href="styles.css">
    <?php require_once("head.php"); ?>
</head>
<body>

    <header>
        Medical Solutions Network
        <img src="M.S.N Logo-BG.png" alt="M.S.N Logo">
        <button class="logout-button">Pagina printzipalara joan</button>
    </header>

    <!-- Contenedor para el login, al que puedes añadir estilos adicionales en tu archivo CSS -->
    <div class="login-container">
        <div class="texto">
            <h2>Saioa Hasi</h2>
            <form action="main.php" method="POST">
                <input type="text" name="username" placeholder="Usuario" required>
                <input type="password" name="password" placeholder="Contraseña" required>
                <button type="submit">Sartu</button>
            </form>
        </div>
    </div>

    <footer>
        © 2025 Medical Solutions Network - Eskubide guztiak erreserbatuta
    </footer>

</body>
</html>
