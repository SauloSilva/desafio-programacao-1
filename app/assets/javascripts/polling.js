function poll(fn, callback, success) {
  var interval = setInterval(function(){
    if (fn()) {
      clearInterval(interval);
      success();
    } else {
      callback()
    }
  }, 3000);
}
