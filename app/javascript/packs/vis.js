import vis from "vis-network"
import axios from "axios"

document.addEventListener('turbolinks:load', function() {
  const csrfToken = document.querySelector("meta[name=csrf-token]").content;
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
  loadNetwork();
})

function loadNetwork() {
  const container = document.getElementById('vis-container');
  let options = networkOptions();
  let data = {};
  var network = new vis.Network(container, data, options);

  getCurrentNetwork().then((response) => processResponse(response))
                     .then((data) => setNetworkData(data, network));
  buildForms(network);
}

function buildForms(network){
  $("#add-node").unbind("click");
  document.getElementById("add-node").onclick = function (data){
    parent = false
    for (var key in network.body.nodes) {
      if (network.body.nodes[key].selected) {
        parent = network.body.nodes[key].id
      }
    }
    if (Object.keys(network.body.nodes).length === 0 || parent != false ) {
      $('#add-node-modal').modal('toggle');
      document.getElementById('saveButton').onclick = saveData.bind(data, parent);
      document.getElementById('cancelButton').onclick = clearPopUp.bind();
    } else {
      $("#modalWarning").modal('toggle');
      $("#modalTitle").text("Aleta!");
      $("#modalText").text("Debe de seleccionar el nodo padre");
    }
  };

  document.getElementById("delete-node").onclick = function() {
    for (var key in network.body.nodes) {
      if (network.body.nodes[key].selected) {
        deleteNode(network.body.nodes[key].id) 
      }
    }
  };

  document.getElementById('edit-node').onclick = function() {
    let node = false
    for (var key in network.body.nodes) {
      if (network.body.nodes[key].selected) {
        node = network.body.nodes[key].id
        axios.get(`/nodos/${node}.json`, {})
        .then((response) => {
          if (response.status == 200) {
            $('#designer_designer_id').val(response.data.designer)
            $('#generador_generador_id').val(response.data.generator)
            $('#add-employee-modal').modal('toggle');
            document.getElementById('save-employees-btn').onclick = function() {
              addEmployees(node) 
            };
          } else {
            console.log(response.errors)
          }
        }).catch((error) => {
          console.log(error)
        });
      }
    }
    if (node == false) {
      $("#modalWarning").modal('toggle');
      $("#modalTitle").text("Aleta!");
      $("#modalText").text("Debe de seleccionar el nodo padre");
    }
  };
}

function networkOptions(){
  return {
    manipulation: {
      enabled: true,
      deleteEdge: true,
    }
  };
}

function deleteNode(nodeId){
  const url = `/nodos/${nodeId}.json`;
  axios.delete(url, { id: nodeId })
            .then((response) => {
              if(response.status == 200){
                loadNetwork();
              }else{
                console.log(response.data);
              }
            })
            .catch((error) => {
              console.log(error);
            });
}

function clearPopUp() {
  document.getElementById('saveButton').onclick = null;
  document.getElementById('cancelButton').onclick = null;
  $('#add-node-modal').modal('hide');
  $('#node-label').val(null);
}

function saveData(data, parent) {
  const url = document.getElementById('saveButton').getAttribute("href") + '.json';
  let label = document.getElementById('node-label').value
  let camp = document.getElementById('camp-id').value
  axios.post(url, { label: label, camp: camp, parent: parent.view.window.parent })
        .then((response) => {
          if(response.status == 200){
            clearPopUp();
            loadNetwork();
          }else{
            console.log(response.data);
          }
        })
        .catch((error) => {
          console.log(error);
        });
}

async function getCurrentNetwork() {
  const url = window.location.href + '.json';
  var response = {}
  try {
    response = await axios.get(url, {})
  }catch(exception){
    console.log(exception)
  }
  return response
}

function setNetworkData(data, network){
  network.setData (data);
  network.redraw();
}

function processResponse(response){
  var data = {}
  if(response.status == 200){
    let nodes = response.data.nodes.map( (node) => { return {id: node.id, label: node.name }});
    let cont = 0
    let edges = []
    for (var key in response.data.children) {
      response.data.children[key].map( (ch) => 
        { 
          cont += 1 
          edges.push({id: cont, from: key, to: ch}) 
        }
      );
    }
    data = {
      nodes: nodes,
      edges: edges
    }
  }else{
    console.log(response.data.nodes.each( (node) => console.log(node) ));
  }
  return data;
}

function addEmployees(nodeId) {
  const url = `/nodos/${nodeId}.json`
  let designer = document.getElementById('designer_designer_id').value
  let generador = document.getElementById('generador_generador_id').value
  axios.put(url, { id: nodeId, designer: designer, generador: generador })
    .then((response) => {
      if(response.status == 200){
        console.log(`200 ${response.data}`)
        $("#add-employee-modal").modal('hide');
        $("#modalWarning").modal('toggle');
        $("#modalTitle").text("Alerta!");
        $("#modalText").text(response.data);
      }else{
        console.log(response.data)
      }
    })
    .catch((error) => {
      console.log(error)
      confirm("Selecciona los empleados para el nodo")
    });
}
