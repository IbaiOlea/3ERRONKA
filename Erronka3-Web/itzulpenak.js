let currentLanguage = 'eu'; // Idioma por defecto (euskera)

function loadTranslations(callback) {
    const xhr = new XMLHttpRequest();
    xhr.overrideMimeType("application/json");
    xhr.open('GET', 'itzulpenak.json', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            callback(JSON.parse(xhr.responseText));
        }
    };
    xhr.send(null);
}

function applyTranslations(translations) {
    const lang = translations[currentLanguage];
    
    // Actualizar elementos con data-i18n attribute
    document.querySelectorAll('[data-i18n]').forEach(element => {
        const key = element.getAttribute('data-i18n');
        if (lang[key]) {
            element.textContent = lang[key];
        }
    });

    // Actualizar placeholders
    document.querySelectorAll('[data-i18n-placeholder]').forEach(element => {
        const key = element.getAttribute('data-i18n-placeholder');
        if (lang[key]) {
            element.setAttribute('placeholder', lang[key]);
        }
    });

    // Actualizar valores de inputs
    document.querySelectorAll('[data-i18n-value]').forEach(element => {
        const key = element.getAttribute('data-i18n-value');
        if (lang[key]) {
            element.value = lang[key];
        }
    });
}

function changeLanguage(lang) {
    currentLanguage = lang;
    loadTranslations(applyTranslations);
    localStorage.setItem('preferredLanguage', lang);
}

// Al cargar la página
document.addEventListener('DOMContentLoaded', function() {
    const savedLanguage = localStorage.getItem('preferredLanguage');
    if (savedLanguage) {
        currentLanguage = savedLanguage;
    }
    
    loadTranslations(applyTranslations);
    
    // Añadir selectores de idioma si es necesario
    const languageSelectors = document.querySelectorAll('[data-language-selector]');
    languageSelectors.forEach(selector => {
        selector.addEventListener('click', function(e) {
            e.preventDefault();
            changeLanguage(this.getAttribute('data-language-selector'));
        });
    });
});