<?php
session_start();

// Destruir completamente la sesión
$_SESSION = [];
session_destroy();

// Redirigir a login.php
header("Location: login.php");
exit();
?>