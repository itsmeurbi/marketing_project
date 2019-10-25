import axios from "axios";

document.addEventListener('turbolinks:load', function() {
  signOut();
})

function signOut() {
  document.getElementById('sign-out-btn').addEventListener('click', function(){
    $("#modal-sign-out").modal('toggle');
    document.getElementById('accept-btn').addEventListener('click', function(){
      axios.get('/users/sign_out', {}).then((response) => {
        if(response.status == 200){
          document.location.href = "/"
        }else{
          console.log(response.data)
        }
      })
    });
  })
}
