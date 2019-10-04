$(document).on('turbolinks:load', function() {
  $('.corporate').hide();
  $('#corp').on('click', function() {
    if ($(this).is(':checked')) {
      $('.corporate').show();
    } else {
      $('.corporate').hide();
    }   
  });

  $('#rep').on('click', function() {
    if ($(this).is(':checked')) {
      $('.info-repre').hide();
    } else {
      $('.info-repre').show();
    }   
  });

  $('#submit').on('click', function() {
    if ($('#repre').is(':checked') && $('#select-corp').value == 0){
      $('#select-corp').addClass('highlight');
      return false;
    }
  })
});
