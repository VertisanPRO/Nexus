$(document).ready(function() {
  
  var likeButton = $('#like');
  var ajaxActionUrl = "/queries/like";

  $(likeButton).on('click', function(e){
    var pageid = $(this).data('id');
    $post = $(this);
    if(likeButton.hasClass("like")){
      $.ajax({
        url: ajaxActionUrl,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
          liked: 1,
          pageid: pageid
        }),
        success: function(response){
          var likesNum = parseInt($('#likes_counter').text());
          $('#likes_counter').text(likesNum+1);
          $post.addClass('primary');
          likeButton.removeClass('like');
          likeButton.addClass('unlike');
        },
        error: function (result) {
            alert("failure" + result);
        }
      });
    } else if(likeButton.hasClass("unlike")){
      $.ajax({
        url: ajaxActionUrl,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
          unliked: 1,
          pageid: pageid
        }),
        success: function(response){
          var likesNum = parseInt($('#likes_counter').text());
          $('#likes_counter').text(likesNum-1);
          $post.removeClass('primary');
          likeButton.addClass('like');
          likeButton.removeClass('unlike');
        },
        error: function (result) {
            alert("failure" + result);
        }
      });
    }
  });
});
