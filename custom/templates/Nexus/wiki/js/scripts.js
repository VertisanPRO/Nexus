const ajaxActionUrl = "/queries/like";

$(document).ready(function () {
    let likeCounter = $('#likes_counter');
    let likeButton = $('#like');

    $('.ui.accordion').accordion();
    $(likeCounter).on('click', function () {
        console.log('click');
        $('.ui.modal').modal('show');
    });

    function toastFire(text, type = "success", time = 3000) {
        $('body').toast({
            showIcon: 'fa-solid fa-circle-info',
            message: text,
            class: type,
            progressUp: true,
            displayTime: time,
            pauseOnHover: true,
            position: 'bottom left',
        });
    }

    $(likeButton).on('click', function () {
        var pageid = $(this).data('id');
        $post = $(this);
        if (likeButton.hasClass("like")) {
            $.ajax({
                url: ajaxActionUrl,
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    liked: 1,
                    pageid: pageid
                }),
                success: function () {
                    var likesNum = parseInt($('#likes_counter').text());
                    $('#likes_counter').text(likesNum + 1);
                    $post.addClass('primary');
                    likeButton.removeClass('like');
                    likeButton.addClass('unlike');
                    toastFire('You liked ' + pageid + ' page successfully!');
                },
                error: function (result) {
                    toastFire(result, 'error');
                }
            });
        } else if (likeButton.hasClass("unlike")) {
            $.ajax({
                url: ajaxActionUrl,
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    unliked: 1,
                    pageid: pageid
                }),
                success: function () {
                    var likesNum = parseInt($('#likes_counter').text());
                    $('#likes_counter').text(likesNum - 1);
                    $post.removeClass('primary');
                    likeButton.addClass('like');
                    likeButton.removeClass('unlike');
                    toastFire('You unliked ' + pageid + ' page successfully!');
                },
                error: function (result) {
                    toastFire(result, 'error');
                }
            });
        }
    });
});