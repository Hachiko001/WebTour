//function onMouseOver(row){
  //debugger
// row.style.backgroundColor = "blue"
//  row.className = 'hover-row';
//}

//function onMouseOut(row){
//  row.className = 'normal-row';
//}

$(document).ready(function () {
  $("table > tbody > tr").hover(function(){
    $(this).addClass('hover-row')
  }, function() {
    $(this).removeClass('hover-row')
  });
  loadGuides();
  loadRailsAJAXGuides();
});


function loadRailsAJAXGuides() {
  $.get({
    url: 'http://localhost:3000/guides.js'
  })
}

function loadGuides() {
  var table = document.getElementById('jsguides');
  table.appendChild(createLoadingElement());

  setTimeout(function() {
    $.get({
      url: 'http://localhost:3000/guides.json',
      complete: function(result) {
        clearElement('jsguides');

        var guides = $.parseJSON(result.responseText);

        // create header
        var container = createContainer('table');

        guides.forEach(function(value) {

          var element = document.createElement('tr');
          var col = document.createElement('td');
          col.innerText = value.id;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.name;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.password;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.date;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.language;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.address;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.image_tag;
          element.appendChild(col);

          col = document.createElement('td');
          col.innerText = value.email;
          element.appendChild(col);

          var link = document.createElement("a");
          link.setAttribute("href", "http://localhost:3000/guides/"+value.id+"/edit")
          var linkText = document.createTextNode("Edit");
          link.appendChild(linkText);
          element.appendChild(link);

          var link = document.createElement("a");
          link.setAttribute("href", "http://localhost:3000/guides/"+value.id)
          var linkText = document.createTextNode("Show");
          link.appendChild(linkText);
          element.appendChild(link);

          var link = document.createElement("a");
          link.setAttribute("href", "http://localhost:3000/guides");
          var linkText = document.createTextNode("Destroy");
          link.appendChild(linkText);
          element.appendChild(link);
          



          container.appendChild(element);
        });

        $('#jsguides')
          .append(container);
      }
    });
  }, 2000);
}

function createContainer(tagName) {
  var container = document.createElement(tagName);
  $(container).addClass('table');
  $(container).html("<tr><td>#</td><td>name</td><td>password</td><td>date</td><td>language</td><td>address</td><td>image</td><td>email</td></tr>");


  return container;
}

function clearElement(id) {
  var element = document.getElementById(id);
  element.innerText = "";
}

function createLoadingElement() {
  var element = document.createElement('div');

  element.innerText = "Loading...";

  return element;
}
