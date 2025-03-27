<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "1MG2024";
$dbname = "erronka3";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

session_start();
if(isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM erabiltzaileak WHERE ID = $user_id";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $user_data = $result->fetch_assoc();
        
        // Formatear fecha de nacimiento
        $jaiotze_data = $user_data['Jaiotze_data'] ? (new DateTime($user_data['Jaiotze_data']))->format('Y-m-d') : '';
        
        // Calcular IMC y determinar estado
        $imc = null;
        $egoera_text = '';
        if($user_data['Pisua'] && $user_data['Altuera']) {
            $altura_metros = $user_data['Altuera'] / 100;
            $imc = $user_data['Pisua'] / ($altura_metros * $altura_metros);
            $imc_rounded = round($imc, 1);
            
            // Determinar estado según IMC (clasificación OMS)
            if ($imc < 16) {
                $egoera_text = "Desnutrizio larria";
            } elseif ($imc >= 16 && $imc < 17) {
                $egoera_text = "Desnutrizio moderatua";
            } elseif ($imc >= 17 && $imc < 18.5) {
                $egoera_text = "Desnutrizio arina";
            } elseif ($imc >= 18.5 && $imc < 25) {
                $egoera_text = "Pisu normala";
            } elseif ($imc >= 25 && $imc < 30) {
                $egoera_text = "Sobrepisua";
            } elseif ($imc >= 30 && $imc < 35) {
                $egoera_text = "Obesitate motela (I. maila)";
            } elseif ($imc >= 35 && $imc < 40) {
                $egoera_text = "Obesitate ertaina (II. maila)";
            } else {
                $egoera_text = "Obesitate larria (III. maila)";
            }
        }
?>
<!DOCTYPE html>
<html lang="eu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datu Pertsonalak</title>
    <style>
        .logout-button {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            position: absolute;
            right: 20px;
        }
        .logout-button:hover {
            background-color: red;
        }
        header img {
            width: 250px;
            height: 160px;
            margin-right: 10px;
        }
        .error-message {
            color: red;
            margin-bottom: 50px;
            padding: 10px;
            background-color: #ffeeee;
            border: 1px solid #ffcccc;
            border-radius: 4px;
        }
        .register-button {
            background-color: darkred;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            position: absolute;
            left: 40px;
        }
        .register-button:hover {
            background-color: red;
        }
        footer {
            background-color: #808080;
            color: white;
            padding: 10px;
            font-size: 14px;
            text-align: center;
            word-wrap: break-word;
        }
        main {
            flex: 1;
            padding: 20px;
            background-color: white;
        }
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        h2 {
            color: #2980b9;
            margin-top: 30px;
        }
        .form-section {
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        input[type="number"] {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: #3498db;
            margin: 30px 0;
        }
        header {
            background-color: #808080;
            color: white;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            flex-wrap: wrap;
        }
        .imc-info {
            font-style: italic;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <header>
        <img src="M.S.N_Logo.png" alt="M.S.N_Logo">
        <button class="logout-button">Saioa itxi</button>
        <a href="register2.php" class="register-button">Erregistratu bazara hemen sartu.</a>
    </header>

    <div class="form-container">
        <h1>Datu Pertsonalak</h1>
        
        <div class="form-section">
            <div class="form-group">
                <label for="izena">Izena:</label>
                <input type="text" id="izena" value="<?php echo htmlspecialchars($user_data['Izena']); ?>" readonly>
            </div>
            
            <div class="form-group">
                <label for="abizena">Abizena:</label>
                <input type="text" id="abizena" value="<?php echo htmlspecialchars($user_data['Abizena']); ?>" readonly>
            </div>
            
            <div class="form-group">
                <label for="jaiotze_data">Jaiotze data:</label>
                <input type="date" id="jaiotze_data" value="<?php echo $jaiotze_data; ?>" readonly>
            </div>
            
            <div class="form-group">
                <label for="sexua">Sexua:</label>
                <input type="text" id="sexua" value="<?php echo htmlspecialchars($user_data['Sexua']); ?>" readonly>
            </div>
        </div>

        <hr>

        <h2>Egoera Fisikoa</h2>
        <div class="form-section">
            <div class="form-group">
                <label for="egoera">Egoera:</label>
                <input type="text" id="egoera" value="<?php echo $egoera_text; ?>" readonly>
                <?php if($imc): ?>
                <div class="imc-info">IMC: <?php echo round($imc, 2); ?> - <?php echo $egoera_text; ?></div>
                <?php endif; ?>
            </div>
        </div>

        <hr>

        <h2>Gorputz-masaren indizea (IMC)</h2>
        <div class="form-section">
            <div class="form-group">
                <label for="pisua">Pisua:</label>
                <input type="number" id="pisua" step="0.1" value="<?php echo htmlspecialchars($user_data['Pisua']); ?>" readonly> kg
            </div>
            
            <div class="form-group">
                <label for="altuera">Altuera:</label>
                <input type="number" id="altuera" value="<?php echo htmlspecialchars($user_data['Altuera']); ?>" readonly> cm
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
</body>
</html>

<?php
    } else {
        header("Location: sessionOut.php");
        exit();
    }
} else {
    header("Location: sessionOut.php");
    exit();
}


$conn->close();
?>