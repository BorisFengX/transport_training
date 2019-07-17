function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (window.innerHeight-70) ) {
        navbar.classList.add('navbar-wagon-white');
        navbar.classList.remove('text-light');
      } else {
        navbar.classList.remove('navbar-wagon-white');
        navbar.classList.add('text-light');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
