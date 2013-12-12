function classToggle(el, action, togglingClass) {
  var classToToggle = togglingClass || 'is-active';
  switch (action) {
    case 'add':
      el.className += ' ' + classToToggle;
      return;
    case 'remove':
      var re = new RegExp('(?:^|\\s)' + classToToggle + '(?!\\S)', 'g');
      el.className = el.className.replace(re, '');
      return;
    case 'contains':
      return el.className.indexOf(classToToggle) !== -1;
  }
}

function ScutModals() {

  var helpBtns = document.getElementsByClassName('js-help-btn'),
      helpC = document.getElementById('help-content'),
      transTime = 300,
      modals = document.getElementsByClassName('js-help-modal');

  init();

  function openModal(targetModal) {
    classToggle(helpC, 'add');
    targetModal.style.display = 'block';
    setTimeout(function () {
      classToggle(targetModal, 'add');
    }, transTime);
  }

  function closeModal(targetModal) {
    classToggle(targetModal, 'remove');
    setTimeout(function () {
      targetModal.style.display = 'none';
      classToggle(helpC, 'remove');
    }, transTime);
  }

  function closeOpenModal() {
    var activeModal;
    for (var i=0,l=modals.length; i<l; i++) {
      if (modals[i].classList.contains('is-active')) {
        activeModal = modals[i];
        break;
      }
    }
    closeModal(activeModal);
  }

  function processButton(btn) {
    var term = btn.getAttribute('data-term'),
        targetModal = document.getElementById('help-' + term),
        dir = btn.getAttribute('data-dir');

    if (dir === 'open') {
      btn.addEventListener('click', function (e) {
        e.stopPropagation();
        openModal(targetModal);
      });
    } else if (dir === 'close') {
      btn.addEventListener('click', function (e) {
        e.stopPropagation();
        closeModal(targetModal);
      });
    }
  }

  function stopProp(e) {
    e.stopPropagation();
  }

  function init () {
    for (var i=0, l=helpBtns.length; i<l; i++) {
      processButton(helpBtns[i]);
    }
    for (var j=0, m=modals.length; j<m; j++) {
      modals[j].addEventListener('click', stopProp);
    }
    helpC.addEventListener('click', closeOpenModal);
  }
}

var helpfulModals = ScutModals();