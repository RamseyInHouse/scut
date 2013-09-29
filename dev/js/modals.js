var helpBtns = document.getElementsByClassName('js-help-btn'),
    helpC = document.getElementById('help-content'),
    transTime = 300,
    modals = document.getElementsByClassName('js-help-modal');

function openModal (targetModal) {
  helpC.classList.add('is-active');
  targetModal.style.display = 'block';
  setTimeout(function () {
    targetModal.classList.add('is-active');
  }, transTime);
}

function closeModal (targetModal) {
  targetModal.classList.remove('is-active');
  setTimeout(function () {
    targetModal.style.display = 'none';
    helpC.classList.remove('is-active');
  }, transTime);
}

function closeOpenModal () {
  var activeModal;
  for (var i = 0, l = modals.length; i < l; i++) {
    if (modals[i].classList.contains('is-active')) {
      activeModal = modals[i];
      break;
    }
  }
  closeModal(activeModal);
}

function processButton (btn) {
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

function stopProp (e) {
  e.stopPropagation();
}

for (var i = 0, l = helpBtns.length; i < l; i++) {
  processButton(helpBtns[i]);
}
for (var i = 0, l = modals.length; i < l; i++) {
  modals[i].addEventListener('click', stopProp);
}

helpC.addEventListener('click', closeOpenModal);
