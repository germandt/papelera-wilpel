(function () {
  "use strict";

  var toggle = document.getElementById("nav-toggle");
  var nav = document.getElementById("site-nav");

  if (toggle && nav) {
    var closeNav = function () {
      nav.classList.remove("is-open");
      toggle.setAttribute("aria-expanded", "false");
      toggle.setAttribute("aria-label", "Abrir menú");
    };

    toggle.addEventListener("click", function () {
      var isOpen = nav.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", String(isOpen));
      toggle.setAttribute("aria-label", isOpen ? "Cerrar menú" : "Abrir menú");
    });

    nav.addEventListener("click", function (event) {
      if (event.target.tagName === "A") closeNav();
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape") closeNav();
    });
  }

  // El botón flotante de WhatsApp aparece recién cuando el botón de
  // WhatsApp del hero deja de estar a la vista, para no superponerse.
  var fab = document.querySelector(".fab-whatsapp");
  var heroActions = document.querySelector(".hero__actions");

  if (fab && heroActions && "IntersectionObserver" in window) {
    var observer = new IntersectionObserver(
      function (entries) {
        fab.classList.toggle("is-visible", !entries[0].isIntersecting);
      },
      { rootMargin: "-72px 0px 0px 0px" }
    );
    observer.observe(heroActions);
  } else if (fab) {
    fab.classList.add("is-visible");
  }
})();
