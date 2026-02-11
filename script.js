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
  });
  