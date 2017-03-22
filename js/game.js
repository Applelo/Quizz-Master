var themes = {
    "dinosaures": "Dinosaures",
    "culture-generale": "Culture Générale",
    "marine": "Vie sous marine",
    "guerres": "Guerres",
    "couleurs": "Couleurs",
    "mecaniques-quantique": "Mécanique Quantique"
};
var id_themes = {
    "dinosaures": 1,
    "culture-generale": 2,
    "marine": 3,
    "guerres": 4,
    "couleurs": 5,
    "mecaniques-quantique": 6
};

var themes_id = [
    "dinosaures",
    "culture-generale",
    "marine",
    "guerres",
    "couleurs",
    "mecaniques-quantique"
];

var current_theme = 0;
var q_finish = 0;
var score = 0;

sumjq = function(selector) {
    var sum = 0;
    $(selector).each(function() {
        sum += Number($(this).text());
    });
    return sum;
};

function menu() {
$("#menu-toggle").on("click",function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

$(".sidebar-nav li a").on("click",function(e) {
    var id_theme = $(this).attr("class");
    e.preventDefault();
    $("#wrapper").removeClass("toggled");
    print_info(id_theme);
    print_questions(id_theme);
    setInterval(time_manager, 1000);

    $('#wrapper').on( "click", "#soumission", function() {
      send_check_open(id_theme);
    });
});
}

function print_info(id) {
    $("h1").text(themes[id]);
    $(".theme").text(themes[id]);
    current_theme = id_themes[id];
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
    $("footer").css("display", "block");
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
                if (i === 0)
                    result = result + "<div class='panel panel-question' onclick='timer_lauch_and_stop(this);'><div class='panel-heading  collapse-panel ' aria-expanded='true'";
                else
                    result = result + "<div class='panel panel-question' onclick='timer_lauch_and_stop(this);'><div class='panel-heading collapse-panel collapsed'";
                result = result + " data-toggle='collapse' data-target='#question" + (i + 1) + "'><u>Question " + (i + 1) + " :</u> " + data[i]["question"] + "<span class='fa arrow'></span></br>Temps : <span class='timer' id='timer-" + i + "'></span> secondes</div><div class='panel-body collapse";
                if (i === 0)
                    result = result + " in' id='question" + (i + 1) + "'><p>";
                else
                    result = result + "' id='question" + (i + 1) + "'><p>";


                for (var j = 0; j < data[i]["reponses"].length; j++) {

                    result = result + "<input type='checkbox' id='reponse" + data[i]["reponse_id"][j] + "' /> <label for='reponse" + data[i]["reponse_id"][j] + "'>" + data[i]["reponses"][j] + "</label><br />";
                }

                result = result + "</p></div></div>";
            }
            $('.q_total').text(data.length);
            $(".col-lg-6").html(result);
            $('.panel-body').on("change", ":checkbox", function() {
                if ($(this).parent().find('input:checkbox:checked').length > 0) {
                    $(this).parent().parent().parent().addClass('panel-question-fill');
                    $(this).parent().parent().parent().removeClass('panel-question');
                } else {
                    $(this).parent().parent().parent().addClass('panel-question');
                    $(this).parent().parent().parent().removeClass('panel-question-fill');
                }
            });
            var countdown = new Date();
            countdown.setSeconds(countdown.getSeconds(98) + 15);
            $('span.timer').countdown(countdown, function(event) {
                $(this).text(event.strftime('%S'));
            });
            $(".collapsed .timer").countdown('pause');


        }
    });
}

function timer_lauch_and_stop(e) {
    id_timer = "#" + $(e).children(".panel-heading").children(".timer").attr('id');
    $(id_timer).parent().parent().parent().find(".panel").on('hidden.bs.collapse', function() {
        $(id_timer).countdown('pause');
    });
    $(id_timer).parent().parent().parent().find(".panel").on('show.bs.collapse', function() {
        var countdown = new Date();
        countdown.setSeconds(countdown.getSeconds(98) + Number($(id_timer).text()));
        $(id_timer).countdown(countdown);
        $(id_timer).countdown('resume');
    });
}

function time_manager() {
    $('.timer-all').text(sumjq('.timer'));
    $(".timer").each(function() {
        if ($(this).text() == 0) { //Bloque le collapse
            //alert($(this).parent().parent().parent().find(".panel-heading").attr('data-target'))
            if (typeof $(this).parent().parent().find(".panel-heading").attr('data-target') !== typeof undefined) {
                q_finish++;
                $(this).find("input:checkbox:checked").prop("disabled", "true");
                $(this).parent().parent().find(".in").removeClass("in");
                $(this).parent().parent().find(".panel-heading").removeAttr("data-target");
                $(this).parent().parent().find(".panel-heading").addClass("collapse-block");
            }
        }
    });
    $('.q_finished').text(q_finish);
}

function send_check_open(id) {
    $('.panel-body').addClass("in"); //add a class in to open all element
    $(".panel-heading").removeAttr("data-target"); //Prevent to people want to close
    $("input:checkbox").attr("disabled", true); //Block checkbox
    $(".collapsed, .collapse-panel").addClass("collapse-block"); //Add a cross block with no answer
    $(".timer").countdown('pause'); //Stop all timer

    $.ajax({
        type: 'POST',
        url: "php/ajax.php",
        data: "action=get_result&id=" + id_themes[id],
        dataType: 'json',
        success: function(data) {
            //alert(JSON.stringify(data));
            var calculScore = [];
            var i=0;
            var temp="";
            $("input:checkbox").each(function() {
                if (data[$(this).attr("id")] == 1)
                    $("label[for='" + $(this).attr("id") + "']").css("color", "green");
                else {
                    $("label[for='" + $(this).attr("id") + "']").css("color", "red");
                }
            });

            //calcule le score
            $(".panel-body.collapse").each(function() {//Init to 0
                calculScore[i] = 0;
                i++;
            });
            i = -1;
          //Check the score for each question
              $("input:checkbox:checked").each(function() {
                if (temp != $(this).parent().parent().before().attr("id")) {
                  temp = $(this).parent().parent().before().attr("id");
                  i++;
                }
                if (data[$(this).attr("id")] == 1)
                  calculScore[i] = calculScore[i] + 1;
                else {
                  calculScore[i] = calculScore[i] - 0.5;
                }

              });
            for (var i = 0; i < calculScore.length; i++) {
              score = score + calculScore[i];
            }

            if (score < 0)
              score = 0;

            $(".score").text(score);

            $("input:checkbox:checked").each(function() { //Add icon after
                if (data[$(this).attr("id")] == 1)
                    $("label[for='" + $(this).attr("id") + "']").prepend("<i class='fa fa-check' aria-hidden='true'></i> ");
                else {
                    $("label[for='" + $(this).attr("id") + "']").prepend("<i class='fa fa-times' aria-hidden='true'></i> ");
                }
            });
            $("input:checkbox:checked").remove();
            $("#soumission").replaceWith('<a class="btn btn-primary navbar-right" id="send_score">Continuer</a>'); //Change le bouton Soummetre en Continuer
            $("#send_score").on("click", function() {
              $("#send_score_modal").modal('show');
              //send_score();//A changer
            });
        }
    });
}

function reset() {
  var current_theme = 0;
  var q_finish = 0;
  var score = 0;
  $(".col-lg-6").text("");//reset .col-lg-6 content
  $(".col-lg-12").html("<h1>Quizz Master</h1><h2>The most powerful quizz in jQuery and Ajax</h2><p class='description'>Quizz Master est le quizz où s'amuser est une priorité !<br/>Plusieurs thèmes, plusieurs questions et surtout plusieurs réponses possibles !</p><a href='#menu-toggle' class='btn btn-default' id='menu-toggle'>Choisissez un thème</a><a class='btn btn-default' data-target='#all_score_modal' data-toggle='modal' onclick='get_score()'>Scores</a>");//reset .col-lg-6 content

  $("#send_score").replaceWith('<a class="btn btn-primary navbar-right" id="soumission">Soumettre</a>'); //Change le bouton Soummetre en Continuer
  $("footer .text-left").replaceWith('<p class="text-left">Total temps restants : <span class="timer-all"></span> secondes | Questions <span class="q_finished">0</span> / <span class="q_total">0</span> | Score <span class="score">0</span></p>');

  $("footer").css("display", "none");
  menu();
  $("#send_score_modal").modal('hide');
}

function send_score() {
  alert(current_theme);
  $.post("php/ajax.php", {
    action : "send_score",
    pseudo : $("input[name=pseudo]").val(),
    score : score,
    date_heure : moment().format("YYYY-MM-DD HH:mm:ss"),
    temps : $(".timer-final").text(),
    id_theme : current_theme
  });
  reset();
}

function get_score() {
  $.ajax({
      type: 'POST',
      url: "php/ajax.php",
      data: "action=get_score",
      dataType: 'json',
      success: function(data) {
        var result='<div><ul class="nav nav-tabs" role="tablist">';
        console.log(data.length);
        for (var i = 0; i < data.length; i++) {
          result += '<li role="presentation"' + ((i==0)?' class="active"':'') + '><a href="#' + themes_id[i] + '" aria-controls="' + themes_id[i] + '" role="tab" data-toggle="tab">' + themes[[themes_id[i]]] + '</a></li>';
        }
        result += '</ul></div><div class="tab-content">';

        for (var i = 0; i < data.length; i++) {
          result += '<div role="tabpanel" class="tab-pane ' + ((i==0)?'active':'') + '" id="'+ themes_id[i] +'"><table class="table table-striped">';
          result += '<tr><th>Pseudo</th><th>Score</th><th>Date</th><th>Temps</th></tr>';
          for (var j = 0; j < data[i].length; j++) {
            result += '<tr><td>' + data[i][j]["pseudo"] + '</td><td>' + data[i][j]["score"] + '</td><td>' + data[i][j]["date_heure"] + '</td><td>' + data[i][j]["temps"] + '</td></td>';
          }
          result +='</table></div>'
        }

        result += '</div></div>';
        $("#all_score_modal .modal-body").html(result);
      }
  });
}
