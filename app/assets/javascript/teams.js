

teamsCheck = () => {
    let el = document.getElementById('team_subcategory');
    el.setAttribute("onchange", "CheckSubcategory(this);");

}


//element select (categories) change element in select (subcategories)
CheckSubcategory = (op) => {
  $("#team_subcategory_id").empty();
  s = $.ajax({
    
    url: "/category/" + op.value + "/getsubcategory", //get all subcategories from id category
    type: "GET",
    dataType: "script",
    data: { "team_id": op.value },
    success: function(result) { 
      
      //get array from json information
      let array = JSON.parse(result)
      let el = document.getElementById('team_subcategory_id');
      var i;
      var iLength = Object.keys(array).length;
      
      //Fill select subcategories
      for (i = 0; i < iLength; i++) {
        var option = document.createElement("option");
        option.value = array[i].id;
        option.text = array[i].name;
        el.add(option);
      }

    }
  })
} 





//Table for team informamtion
//path to app/datatables for information
tableTeam = () => $('#team-table').each(function(){
  $(this).DataTable({
    processing: true,
    serverSide: true,
    searching: true,
    paging: false,
    info: false,
    columns: [
  {name: 'team_name'},
  {name: 'team_country_city' },
  {name: 'date_added' }  ,   
  {name: 'team_category' },
  {name: 'subcategory.name'},
  {name: 'links'}
],
    ajax: {
      "url": $(this).data('url') //get current url 
    },

    "scrollY":        "334px",
      initComplete: function () {
        var table = $('#team-table').DataTable();

        $('#filter-team').on('click',function () { //get all information in form and search in table
          var country = $("#team_city_id ").val();
          var category = $("#team_subcategory ").val();
          var subcategory = $("#team_subcategory_id").val();
          var team_name = $("#team_name").val()
          var query = [country,category,subcategory,team_name]
          table.search( query ).draw();                     
        })      
    }
  });
}); 