$(document).on('turbolinks:load', function() {
  $('#corporates').hide();
  $('#type').on('change', function() {
    $('#corporates').show();
    if ($(this).val() == 1){
      $('#companies').hide();
      $('#corporates').show();
    } else {
      $('#companies').show();
      $('#corporates').hide();
    } 
  })
})
