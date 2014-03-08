var hiddenClass = 'is-hidden';
var exampleCss = document.getElementById('exampleCss');
var exampleScss = document.getElementById('exampleScss');
var example = document.getElementById('example');
var showCssBtn = document.createElement('button');
var cssOpen = false;
var showText = 'show compiled CSS';
var hideText = 'hide compiled CSS';
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