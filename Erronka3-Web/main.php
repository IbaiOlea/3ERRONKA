<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Medical Solutions Network</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #808080;
            color: white;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        main {
            flex: 1;
            padding: 20px;
            background-color: white;
        }

        .info {
            margin: 20px auto;
            padding: 20px;
            background: #ddd;
            width: 50%;
            border-radius: 10px;
        }

        footer {
            background-color: #808080;
            color: white;
            padding: 10px;
            font-size: 14px;
        }

        .productos {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .producto {
            background: #ddd;
            padding: 15px;
            border-radius: 10px;
            width: 200px;
            text-align: center;
        }

        .producto img {
            width: 100%;
            border-radius: 10px;
        }
    </style>
</head>
<body>

    <header>
        Medical Solutions Network
    </header>

    <main>
        <div class="info">
            <h2>Estado Físico</h2>
            <p>Estado: Saludable</p>
            <p>Frecuencia Cardíaca: 72 bpm</p>
        </div>

        <div class="info">
            <h2>Índice de Masa Corporal (IMC)</h2>
            <p>Peso: 70 kg</p>
            <p>Altura: 1.75 m</p>
            <p>IMC: 22.9 (Normal)</p>
        </div>

        <div class="info">
            <h2>Produktuak</h2>
        </div>

        <div class="productos">
            <div class="producto">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Romaine_lettuce.jpg/1200px-Romaine_lettuce.jpg" alt="Producto 1">
                <p>Letxuga</p>
                <p>2.23€</p>
            </div>
            <div class="producto">
                <img src="https://www.masmusculo.com/72069-thickbox_default/100-whey-gold-standard-5-lb-23kg.jpg" alt="Producto 2">
                <p>Proteina</p>
                
            </div>
            <div class="producto">
                <img src="https://medlineplus.gov/images/Carbohydrates_share.jpg" alt="Producto 3">
                <p>Karbohidratoak</p>
               
            </div>
        </div>

    </main>

    <footer>
        © 2025 Medical Solutions Network - Todos los derechos reservados
    </footer>

</body>
</html>
