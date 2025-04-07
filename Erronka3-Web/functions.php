<?php
function renderHeader($lang, $session) {
    ?>
    <header>
        <img src="M.S.N_Logo.png" alt="M.S.N_Logo">

        <div class="language-selector">
            <a href="?lang=eu" class="language-button"><img src="eu.png" alt="EU"></a>
            <a href="?lang=en" class="language-button"><img src="en.png" alt="EN"></a>
        </div>

        <?php if (isset($session['user_id']) && $session['user_id'] != 0): ?>
            <a href="produktuak.php" class="product-link"><?= t('yourProducts') ?></a>
            <a href="logout.php" class="logout-button"><?= t('logout') ?></a>
            <a href="cesta.php" class="cart-button"><?= t('cart') ?> (<?php echo array_sum($session['cesta']); ?>)</a>
        <?php elseif (isset($session['invitado']) && $session['invitado']): ?>
            <a href="login.php" class="logout-button"><?= t('login') ?></a>
            <a href="productInvitedList.php" class="product-link"><?= t('products') ?></a>
            <a href="cesta.php" class="cart-button"><?= t('cart') ?> (<?php echo array_sum($session['cesta']); ?>)</a>
        <?php else: ?>
            <a href="login.php" class="logout-button"><?= t('login') ?></a>
        <?php endif; ?>
    </header>
    <?php
}
?>