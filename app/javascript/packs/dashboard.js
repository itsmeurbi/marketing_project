document.addEventListener('turbolinks:load', function(){
  $('#home').show();
  switch ($('#role')["0"].value)  {
    case "1":
      admin();
      break;
    case "2":
      comm(); 
      break;
    case "3":
      gen();
      break;
    case "4":
      des(); 
      break;
    case "5":
      rh();
      break;
    case "6":
      sales(); 
      break;
    case "7":
      agency(); 
      break;
  
    default:
      break;
  } 
});

function sidebar() {
  document.getElementById('sidebar-wrap').onclick = function() {
    if ($('#sidebar').css("display") == "none") {
      $('#sidebar').show();
    } else {
      $('#sidebar').hide();
    }
  }
}

function admin() {
  $('#admin-clients').hide();
  $('#admin-employees').hide();
  $('#admin-campaigns').hide();
  document.getElementById('home-btn').onclick = function() {
    $('#home').show();
    $('#admin-clients').hide();
    $('#admin-employees').hide();
    $('#admin-campaigns').hide();
  }
  document.getElementById('Campañas-btn').onclick = function() {
    $('#home').hide();
    $('#admin-clients').hide();
    $('#admin-employees').hide();
    $('#admin-campaigns').show();
  }
  document.getElementById('Clientes-btn').onclick = function() {
    $('#home').hide();
    $('#admin-clients').show();
    $('#admin-employees').hide();
    $('#admin-campaigns').hide();
  }
  document.getElementById('Empleados-btn').onclick = function() {
    $('#home').hide();
    $('#admin-clients').hide();
    $('#admin-employees').show();
    $('#admin-campaigns').hide();
  }
  sidebar()
}

function comm() {
  $('#com-campaigns').hide();
  $('#com-calendar').hide();
  document.getElementById('home-btn').onclick = function() {
    $('#home').show();
    $('#com-campaigns').hide();
    $('#com-calendar').hide();
  }
  document.getElementById('Campañas-btn').onclick = function() {
    $('#home').hide();
    $('#com-campaigns').show();
    $('#com-calendar').hide();
  }
  document.getElementById('Calendario-btn').onclick = function() {
    $('#home').hide();
    $('#com-campaigns').hide();
    $('#com-calendar').show();
  }
  sidebar();
}

function gen() {
  $('#gen-nodes').hide();
  document.getElementById('home-btn').onclick = function() {
    $('#home').show();
    $('#gen-nodes').hide();
  }
  document.getElementById('Tematicas-btn').onclick = function() {
    $('#home').hide();
    $('#gen-nodes').show();
  }
  sidebar();
}

function des() {
  $('#des-nodes').hide();
  document.getElementById('home-btn').onclick = function() {
    $('#home').show();
    $('#des-nodes').hide();
  }
  document.getElementById('Tematicas-btn').onclick = function() {
    $('#home').hide();
    $('#des-nodes').show();
  }
  sidebar();
}

function sales() {
  $('#sales-clients').hide();
  $('#sales-companies').hide();
  $('#sales-corporates').hide();
  document.getElementById('home-btn').onclick = function () {
    $('#home').show();
    $('#sales-clients').hide();
    $('#sales-companies').hide();
    $('#sales-corporates').hide();
  };
  document.getElementById('Clientes-btn').onclick = function () {
    $('#home').hide();
    $('#sales-clients').show();
    $('#sales-companies').hide();
    $('#sales-corporates').hide();
  };
  document.getElementById('Empresas-btn').onclick = function () {
    $('#home').hide();
    $('#sales-clients').hide();
    $('#sales-companies').show();
    $('#sales-corporates').hide();
  };
  document.getElementById('Corporativos-btn').onclick = function () {
    $('#home').hide();
    $('#sales-clients').hide();
    $('#sales-companies').hide();
    $('#sales-corporates').show();
  }; 
  sidebar();
}

function rh() {
  $('#rh-employees').hide();
  document.getElementById('home-btn').onclick = function () {
    $('#home').show();
    $('#rh-employees').hide();
  };
  document.getElementById('Empleados-btn').onclick = function () {
    $('#home').hide();
    $('#rh-employees').show();
  };
  sidebar();
}

function agency() {
  $('#agency-admins').hide();
  document.getElementById('home-btn').onclick = function () {
    $('#home').show();
    $('#agency-admins').hide();
  };
  document.getElementById('Administradores-btn').onclick = function () {
    $('#home').hide();
    $('#agency-admins').show();
  };
  sidebar();
}
