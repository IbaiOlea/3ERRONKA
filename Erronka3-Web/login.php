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
<br><br><br><br>
    <div class="login-container">
        <div class="texto">
        <h2 style="font-size=40px;">Saioa Hasi</h2>
        <form action="main.php" method="POST"><br><br>
            <input type="text" name="username" placeholder="Erabiltzailea" required style="font-size: 18px; padding: 10px; width: 250px;"><br><br><br>
            <input type="password" name="password" placeholder="Pasahitza" required style="font-size: 18px; padding: 10px; width: 250px;"><br><br><br><br><br><br>
            <button type="submit" style="font-size: 20px; padding: 15px 40px; width: 220px; height: 60px; border-radius: 10px; background-color: #4CAF50; color: white; border: none; cursor: pointer;">Sartu</button>
        </form>
        <br>
        <a href="gonbidatu.php" style="font-size: 18px; text-decoration: none; color: #4CAF50;">Gonbidatu bezala sartu</a>
    </div>
    </div>
<br><br><br><br><br><br><br><br><br><br><br><br>
    <footer>    
        © 2025 Medical Solutions Network - Eskubide guztiak erreserbatuta
    </footer>

</body>
</html>
