function initUpdateTabbarOnMove() {
  const tabbar = document.querySelector('.tab-underlined');
  if (tabbar) {
    window.addEventListener('mousemove', () => {
      console.log(tabbar)
      // if (window.scrollY >= (window.innerHeight) ) {
      //   navbar.classList.add('active');
      // } else {
      //   navbar.classList.remove('active');
      // }
    });
  }
}

export { initUpdateTabbarOnMove };
