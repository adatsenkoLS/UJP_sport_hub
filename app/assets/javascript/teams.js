

teamsCheck = () => {
    let el = document.getElementById('team_id');
    el.setAttribute("onchange", "Check(this)");
}

 Check = (op) => {
  console.log(op.value)
  s = $.ajax({
    url: "/category/" + op.value + "/getsubcategory", 
    type: "GET",
    dataType: "script",
    data: { "team_id": op.value },
    success: function(result) { 

      let array = JSON.parse(result)
      let el = document.getElementById('team_subcategory_id');
      $("#team_subcategory_id").empty();
      var i;
      var iLength = Object.keys(array).length;
      for (i = 0; i < iLength; i++) {
        var option = document.createElement("option");
        option.value = array[i].id;
        option.text = array[i].name;
        el.add(option);
      }
    }
  })
 




} 







NextCheck = (op) => {
  console.log(op.options[op.selectedIndex])     
}