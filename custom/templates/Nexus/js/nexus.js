$('.ui.sticky').sticky({
    context: '#context'
});

window.onload = function() {
    document.body.classList.add('loaded_hiding');
    window.setTimeout(function() {
        document.body.classList.add('loaded');
        document.body.classList.remove('loaded_hiding');
    }, 500);
};

$('.ui.left.sidebar').sidebar({
    transition: 'overlay'
});
