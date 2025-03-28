<?php
session_start();
session_destroy();
header("Location: main.php?logout=success"); // Añade parámetro
exit();
?>