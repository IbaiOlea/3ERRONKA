document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.querySelector('.menu-toggle');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    const menuLinks = dropdownMenu.querySelectorAll('a');

    if (menuToggle && dropdownMenu) {
        menuToggle.addEventListener('click', function (e) {
            e.stopPropagation();
            dropdownMenu.classList.toggle('active');
            menuToggle.classList.toggle('active');
            
            // Forzar el cierre si ya está abierto
            if (dropdownMenu.classList.contains('active')) {
                menuToggle.setAttribute('aria-expanded', 'true');
            } else {
                menuToggle.setAttribute('aria-expanded', 'false');
            }
        });

        menuLinks.forEach(link => {
            link.addEventListener('click', function () {
                dropdownMenu.classList.remove('active');
                menuToggle.classList.remove('active'); // Remover clase
            });
        });

        window.addEventListener('resize', function () {
            if (window.innerWidth > 768) {
                dropdownMenu.classList.remove('active');
                menuToggle.classList.remove('active'); // Remover clase
            }
        });
    }
});