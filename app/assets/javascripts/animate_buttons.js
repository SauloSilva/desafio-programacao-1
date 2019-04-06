var animateButton = function(e) {
  e.preventDefault;
  e.target.classList.remove('animate');
  e.target.classList.add('animate');

  setTimeout(function(){
    e.target.classList.remove('animate');
  }, 700);
};

window.onload = function() {
  var bubblyButtons = document.getElementsByClassName("button");

  for (var i = 0; i < bubblyButtons.length; i++) {
    bubblyButtons[i].addEventListener('mouseover', animateButton, false);
  }
};
