function poll(fn, callback, success) {
    var interval = setInterval(function(){
        console.log(fn());
        if (fn()) {
            clearInterval(interval);
            success();
        } else {
            callback()
        }
    }, 3000);
}
