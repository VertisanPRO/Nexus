$(document).ready(function() {
  var likeCounter = $('#likes_counter');

  $('.ui.accordion').accordion();
  $(likeCounter).on('click', function(e){
    $('.ui.modal').modal('show');
  });

});
