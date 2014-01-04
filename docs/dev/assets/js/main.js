var activeClass = 'is-active',
    helpC = document.getElementById('help-content'),
    activeHelp;

// event delegation
document.getElementById('main').addEventListener('click', checkMainClick);

function checkMainClick(e) {
  var clicked = e.target,
      clickedClassList = clicked.classList;
  if (clickedClassList.contains('js-toggle-css')) {
    toggleCss(clicked);
  } else if (clickedClassList.contains('js-help-btn')) {
    openHelp(clicked);
  }
}

// open and close entry's CSS
function toggleCss(el) {
  var entryId = el.getAttribute('data-entry'),
      entryCss = document.getElementById(entryId + '-css');
  if (!entryCss.classList.contains(activeClass)) {
    entryCss.classList.add(activeClass);
    el.innerHTML = 'Hide compiled CSS';
  } else {
    entryCss.classList.remove(activeClass);
    el.innerHTML = 'Show compiled CSS';
    document.getElementById(entryId + '-scss').scrollIntoView();
  }
}

// opening help
function openHelp(el) {
  // triggered by a click in main
  var help = document.getElementById('help-' + el.getAttribute('data-help'));
  activeHelp = help;
  help.classList.add(activeClass);
  helpC.classList.add(activeClass);
  document.body.style.overflow = 'hidden';
}

// closing help
helpC.addEventListener('click', checkHelpClick);

function checkHelpClick(e) {
  var clicked = e.target;
  e.stopPropagation();
  if (clicked.classList.contains('js-help-btn') || clicked.id === 'help-content')
    closeHelp(activeHelp);
}

function closeHelp(el) {
  // triggered by a click in help
  el.classList.remove(activeClass);
  helpC.classList.remove(activeClass);
  document.body.style.overflow = 'auto';
  activeHelp = '';
}