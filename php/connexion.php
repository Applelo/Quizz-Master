<?php
/*
Dans ce fichier nous allons établir la connexion avec la BDD Mysql.
Une fois la connexion établie, nous stockons les informations de la connexion dans la variable $connexion

Chaque page qui appellera ce fichier connexion.php (par un require_once) pourra utiliser la variable $connexion pour interagir avec la BDD

*/

/*
La connexion se fait grâce au module PDO.
Les modules PHP fonctionnent par "Instance", on crée un instance avec l'instruction "new"
*/

//Connexion au serveur
$serveur = 'localhost';
$bdd = 'quizz';
$user = 'root';
$mdp = 'root';

//L'instruction Try/Catch permet de traiter les erreurs éventuelles de connexion
try {
	//on déclare la variable $connexion et on lui attribue les infos de connexion en créant une instance PDO
	$connexion = new PDO('mysql:host=' . $serveur . ';dbname=' . $bdd, $user, $mdp);
	//afin de vérifier la connexion, on affiche un message que l'on peut masquer ensuite
	// echo 'connexion ok<br>';
} catch(Exception $e) {
	//si la connexion ne se fait pas, on affiche un message d'erreur et on stoppe le php avec l'instruction die
	die('erreur de connexion');
}

?>
