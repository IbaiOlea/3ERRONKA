<header>
    <img src="M.S.N_Logo.png" alt="M.S.N_Logo">

    <?php if (isset($_SESSION['user_id']) && $_SESSION['user_id'] != 0): ?>
        <!-- Usuario REGISTRADO (oculta "Saioa Hasi") -->
        <a href="produktuak.php" class="product-link">Zure produktuak</a>
        <a href="logout.php" class="logout-button">Saioa itxi</a>
        <a href="cesta.php" class="cart-button">Carrito (<?php echo array_sum($_SESSION['cesta']); ?>)</a>

    <?php elseif (isset($_SESSION['invitado']) && $_SESSION['invitado']): ?>
        <!-- Modo INVITADO (muestra "Saioa Hasi" + carrito) -->
        <a href="login.php" class="logout-button">Saioa hasi</a>
        <a href="productInvitedList.php" class="product-link">Produktu zerrenda</a>
        <a href="cesta.php" class="cart-button">Carrito (<?php echo array_sum($_SESSION['cesta']); ?>)</a>

    <?php else: ?>
        <!-- Sin sesión (solo "Saioa Hasi") -->
        <a href="login.php" class="logout-button">Saioa hasi</a>
    <?php endif; ?>
</header>