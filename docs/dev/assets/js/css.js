var showCssBtns = document.getElementsByClassName('js-toggle-css');

function toggleCss (event) {
  var button = event.target;
  var entry = button.getAttribute('data-entry');
  var css = document.getElementById(entry + '-css');
  if (!classToggle(css, 'contains')) {
    classToggle(css, 'add');
    button.innerHTML = 'Hide compiled CSS';
  } else {
    classToggle(css, 'remove');
    button.innerHTML = 'Show compiled CSS';
    document.getElementById(entry + '-scss').scrollIntoView();
  }

}

for (var i = 0, l = showCssBtns.length; i < l; i++) {
  showCssBtns[i].addEventListener('click', toggleCss);
}