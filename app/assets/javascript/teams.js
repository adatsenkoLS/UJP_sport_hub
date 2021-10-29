

teamsCheck = () => {
    let el = document.getElementById('team_subcategory');
    el.setAttribute("onchange", "Check(this)");
    $("#team_subcategory_id").empty();
}

 Check = (op) => {
  s = $.ajax({
    url: "/category/" + op.value + "/getsubcategory", 
    type: "GET",
    dataType: "script",
    data: { "team_id": op.value },
    success: function(result) { 
      $("#team_subcategory_id").empty();
      let array = JSON.parse(result)
      let el = document.getElementById('team_subcategory_id');
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



