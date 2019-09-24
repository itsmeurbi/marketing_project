$(document).on('turbolinks:load', function() {
  $('.new-corp').hide();
  $('#add-btn').on('click', function() {
    if (document.getElementsByClassName("new-corp")[0].style.display == "none") {
      $('#add-btn').html('Cancelar')
      $('.new-corp').show();
    } else {
      $('#add-btn').html('Agregar Corporativo')
      $('.new-corp').hide();
    }   
  });
});
