$(document).on('turbolinks:load', function (){
  $('.companies').hide();
  $('#add-company').on('click', function() {
    if (document.getElementsByClassName('companies')[0].style.display == "none") {
      $('.companies').show();
    } else {
      $('.companies').hide();
    }
  });
});
