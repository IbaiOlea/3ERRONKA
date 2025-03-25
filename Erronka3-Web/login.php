<?php
session_start();
include 'dbKonexioa.php';
?>

<title>Medical Solutions Network</title>
<?php 
    require_once("head.php");
    ?>
</head>
<body>

    <header>
        Medical Solutions Network
    </header>

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

