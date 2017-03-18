var themes = { "dinosaures" : "Dinosaures", "culture-generale" : "Culture Générale", "marine" : "Vie sous marine", "guerres" : "Guerres", "couleurs" : "Couleurs", "mecaniques-quantique" : "Mécanique Quantique"};
var id_themes = {"dinosaures" : 1, "culture-generale" : 2, "marine" : 3, "guerres" : 4, "couleurs" : 5, "mecaniques-quantique" : 6};



function print_info(id) {
  $("h1").text(themes[id]);
  $(".btn-default").remove();
  $("h2").remove();
  $.ajax({
    type: "POST",
    dataType: "json",
    url: "php/ajax.php",
    data: "action=get_description&id=" + id_themes[id],
    success: function(data) {
        $(".description").text(data);
    }
  });
  $("footer").css("display","block");
}

function print_questions(id) {
  $.ajax({
    type: "POST",
    dataType: "json",
    url: "php/ajax.php",
    data: "action=get_questions&id=" + id_themes[id],
    success: function(data) {
      var result = "";
      for (var i = 0; i < data.length; i++) {
        if (i == 0)
          result = result + "<div class='panel panel-question'><div class='panel-heading  collapse-panel ' aria-expanded='true'";
        else
          result = result + "<div class='panel panel-question'><div class='panel-heading collapse-panel collapsed'";
        result = result + " data-toggle='collapse' data-target='#question" + (i+1) + "'>Question " + (i+1) + " : " + data[i]["question"] + " <span class='fa arrow'></span></div><div class='panel-body collapse";
        if (i == 0)
          result = result + " in' id='question" + (i+1) + "'><p>";
        else
          result = result + "' id='question" + (i+1) + "'><p>";


        for (var j = 0; j < data[i]["reponses"].length; j++) {

          result = result + "<input type='checkbox' id='reponse" + data[i]["reponse_id"][j] + "' /> <label for='" + data[i]["reponse_id"][j] + "'>" + data[i]["reponses"][j] + "</label><br />";
        }

        result = result + "<p>";



        result = result + "</div></div>";
      }

      $(".col-lg-6").html(result);
      $('.panel-body').on( "change", ":checkbox", function() {
        if ($(this).parent().find('input:checkbox:checked').length > 0) {
          $(this).parent().parent().parent().addClass('panel-question-fill');
          $(this).parent().parent().parent().removeClass('panel-question');
        }
        else {
          $(this).parent().parent().parent().addClass('panel-question');
          $(this).parent().parent().parent().removeClass('panel-question-fill');
        }
      });
    }
  });
}
