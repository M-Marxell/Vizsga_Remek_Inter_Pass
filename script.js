document.addEventListener("DOMContentLoaded", () => {
    const menuBtn = document.getElementById("menuBtn");
    const sidebar = document.getElementById("sidebar");
    const overlay = document.getElementById("overlay");
  
    function toggleSidebar() {
      const open = sidebar.classList.toggle("open");
      overlay.classList.toggle("active", open);
      document.body.style.overflow = open ? "hidden" : "";
    }
  
    menuBtn.addEventListener("click", toggleSidebar);
    overlay.addEventListener("click", toggleSidebar);

    // Szolgáltatások összehúzható menü
    const servicesBtn = document.getElementById("servicesBtn");
    const servicesMenu = document.getElementById("servicesMenu");
    if (servicesBtn && servicesMenu) {
      function toggleServices(e) {
        const expanded = servicesBtn.getAttribute('aria-expanded') === 'true';
        servicesBtn.setAttribute('aria-expanded', String(!expanded));
        servicesMenu.classList.toggle('show', !expanded);
        servicesMenu.setAttribute('aria-hidden', String(expanded));
      }

      servicesBtn.addEventListener('click', toggleServices);
      servicesBtn.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          toggleServices();
        }
      });
    }
  });
