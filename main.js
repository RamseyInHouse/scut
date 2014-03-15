var exampleCss = document.getElementById('exampleCss');

if (exampleCss) {
  enableCssToggle();
}

function enableCssToggle() {
  var hiddenClass = 'is-hidden',
      exampleScss = document.getElementById('exampleScss'),
      example = document.getElementById('example'),
      showCssBtn = document.createElement('button'),
      cssOpen = false,
      showText = 'show compiled CSS',
      hideText = 'hide compiled CSS';
  // hide CSS
  exampleCss.classList.add(hiddenClass);
  // insert button
  showCssBtn.innerHTML = showText;
  showCssBtn.className = 'show-css-btn';
  example.insertBefore(showCssBtn, document.getElementById('resultHeading'));
  // make button work
  function toggleCss() {
    if (!cssOpen) {
      exampleCss.classList.remove(hiddenClass);
      showCssBtn.innerHTML = hideText;
      cssOpen = true;
    } else {
      exampleCss.classList.add(hiddenClass);
      exampleScss.scrollIntoView();
      showCssBtn.innerHTML = showText;
      cssOpen = false;
    }
  }
  showCssBtn.addEventListener('click', toggleCss);
}