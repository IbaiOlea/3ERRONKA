document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.querySelector('.menu-toggle');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    const menuLinks = dropdownMenu.querySelectorAll('a'); // Seleccionar todos los enlaces del menú

    if (menuToggle && dropdownMenu) {
        // Abrir o cerrar el menú al hacer clic en el botón hamburguesa
        menuToggle.addEventListener('click', function (e) {
            e.stopPropagation();
            dropdownMenu.classList.toggle('active');
        });

        // Cerrar el menú si se hace clic fuera de él
        document.addEventListener('click', function (e) {
            if (!dropdownMenu.contains(e.target) && !menuToggle.contains(e.target)) {
                dropdownMenu.classList.remove('active');
            }
        });

        // Cerrar el menú al hacer clic en cualquier enlace dentro del menú
        menuLinks.forEach(link => {
            link.addEventListener('click', function () {
                dropdownMenu.classList.remove('active');
            });
        });

        // Cerrar el menú si la pantalla se redimensiona a más de 768px
        window.addEventListener('resize', function () {
            if (window.innerWidth > 768) {
                dropdownMenu.classList.remove('active');
            }
        });
    }
});