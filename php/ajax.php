<?php
require("connexion.php");

//Check if is an ajax request
function checkAjax()
{
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}

//Launch the good ajax function
if (checkAjax() && isset($_POST["action"]) && !empty($_POST["action"])) {
    $action = htmlspecialchars($_POST["action"]);
    switch ($action) { //Switch case for value of action
      case "get_description": get_description($connexion, $_POST["id"]); break;
      case "get_questions": get_questions($connexion, $_POST["id"]); break;
      case "get_result": get_result($connexion, $_POST["id"]); break;
      case "send_score": send_score($connexion, $_POST["pseudo"], $_POST["score"], $_POST["date_heure"], $_POST["temps"], $_POST['id_theme']); break;
      case "get_score": get_score($connexion); break;
    }
}

function get_description($connexion, $id)
{
    $sql = "SELECT description
  FROM themes
  WHERE id = " . $id;
    $exec = $connexion->query($sql);
    $themes = $exec->fetch(PDO::FETCH_OBJ);
    $result = array($description = $themes->description);
    header('Content-Type: application/json');
    echo json_encode($result);
}

function get_questions($connexion, $id)
{
    $sql = "SELECT questions.id AS question_id, text_question, int_reponse, reponses.id AS reponse_id
FROM questions
INNER JOIN reponses ON reponses.id_question = questions.id
WHERE id_theme = " . $id;
    $exec = $connexion->query($sql);
    $questions = $exec->fetchAll(PDO::FETCH_OBJ);
    $result = array();
    $i = 0;
    $r = 0;
    $current_question = 0;
    foreach ($questions as $q) {
        if ($current_question == 0) {//Initialisation pour répartir les infos dans un tableau
      $current_question = $q->question_id;
        }

        if ($current_question != $q->question_id) {//Incrémente de 1
      $current_question = $q->question_id;
            $i++;
            $r = 0;
      //$result[$i]["reponses"] = array();
        }

        $result[$i]["question"] = $q->text_question;
        $result[$i]["reponses"][$r] = $q->int_reponse;
        $result[$i]["reponse_id"][$r] = $q->reponse_id;
        $r++;
    }
    shuffle($result);//On mélange le tout :)

  header('Content-Type: application/json');
    echo json_encode($result);
}

function get_result($connexion, $id)
{
    $sql = "SELECT reponses.id AS reponse_id, juste
FROM questions
INNER JOIN reponses ON reponses.id_question = questions.id
WHERE id_theme = " . $id;
    $exec = $connexion->query($sql);
    $reponses = $exec->fetchAll(PDO::FETCH_OBJ);
    $result = array();
    foreach ($reponses as $r) {
        $result["reponse" . $r->reponse_id] = $r->juste;
    }
    header('Content-Type: application/json');
    echo json_encode($result);
}

function send_score($connexion, $pseudo, $score, $date_heure, $temps, $id_theme) {
  $pseudo = htmlspecialchars($pseudo);
  $score = (int)htmlspecialchars($score);
  $date_heure = htmlspecialchars($date_heure);
  $temps = (int)htmlspecialchars($temps);
  $id_theme = (int)htmlspecialchars($id_theme);

  $sql = "INSERT INTO `scores` (`id`, `pseudo`, `score`, `date_heure`, `temps`, `id_theme`)
  VALUES (NULL, :pseudo, :score, :date_heure, :temps, :id_theme)";
  $query = $connexion->prepare($sql);
  $query->bindValue(":pseudo", $pseudo, PDO::PARAM_STR);
  $query->bindValue(":score", $score, PDO::PARAM_INT);
  $query->bindValue(":date_heure", $date_heure, PDO::PARAM_STR);
  $query->bindValue(":temps", $temps, PDO::PARAM_INT);
  $query->bindValue(":id_theme", $id_theme, PDO::PARAM_INT);
  $query->execute();
  $query = null;
}

function get_score($connexion) {
  $result = array();
  for ($i=0; $i < 6; $i++) {
    $result[$i] = array();
    $j = 0;
    $sql = "SELECT * FROM scores WHERE id_theme = " . ($i+1);
    $exec = $connexion->query($sql);
    $scores = $exec->fetchAll(PDO::FETCH_OBJ);
    foreach ($scores as $s) {
      $result[$i][$j]["pseudo"] = $s->pseudo;
      $result[$i][$j]["score"] = $s->score;
      $result[$i][$j]["date_heure"] = $s->date_heure;
      $result[$i][$j]["temps"] = $s->temps;
      $j++;
    }
  }

  header('Content-Type: application/json');
  echo json_encode($result);
}
