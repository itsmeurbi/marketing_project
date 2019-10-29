$(document).on('turbolinks:load', function() {
  $('.corporate').hide();
  $('#keep-rep').hide();
  $('#corp').on('click', function() {
    if ($(this).is(':checked')) {
      $('.corporate').show();
      $('#keep-rep').show();
    } else {
      $('.corporate').hide();
      $('#keep-rep').hide();
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
