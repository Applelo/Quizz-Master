-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Mer 22 Mars 2017 à 17:53
-- Version du serveur :  5.6.28
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `quizz`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `text_question` text,
  `id_theme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `questions`
--

INSERT INTO `questions` (`id`, `text_question`, `id_theme`) VALUES
(3, 'Où les dinosaures vivaient-ils ?', 1),
(4, 'Pendant combien d\'années ont-ils vécu ?', 1),
(5, 'Comment sait-on à quoi ils ressemblaient ?', 1),
(6, 'Combien d espèces de dinosaures connaît-on ?', 1),
(7, 'Comme les lézards, les tortues et les serpents d aujourd hui, ils étaient :', 1),
(8, 'Ils pondaient des œufs. Ils étaient donc :', 1),
(9, 'Après l\'éclosion des œufs, qui s\'occupait des petits ?', 1),
(10, 'Les dinosaures étaient-ils tous carnivores ?', 1),
(11, 'Quel dinosaure volait les œufs des autres ?', 1),
(12, 'Quels étaient les plus grands dinosaures ?', 1),
(13, 'Ces trois grands dinosaures étaient :', 1),
(14, 'Que mangeaient-ils ?', 1),
(15, 'Quel était le plus petit dinosaure ?', 1),
(16, 'Quel dinosaure allait à la pêche ?', 1),
(17, 'En france, dans quelle ville se trouve l\'adresse du père noel ?', 2),
(18, 'Comment se nomme le plus grand spécimen de chouette ?', 2),
(19, 'En français, sur quelle lettre ne peut-on pas mettre de tréma ?', 2),
(20, 'Que signifie le terme Karaoke en japonais ?', 2),
(21, 'Pour calculer la bonnet d\'un soutien gorge, que faut-il mesurer ?', 2),
(22, 'A quoi correspondent les indices de protection solaire ?', 2),
(23, 'Les carottes contiennent de la vitamine A utile pour lutter contre quelle maladie ?', 2),
(24, 'A quel élément se rapporte la loi de Godwin ?', 2),
(25, 'Quel est le diamètre d\'un CD ?', 2),
(26, 'Comment se nomme le père Noël au Danemark ?', 2),
(27, 'Quels océans du monde affectent les débris marins ?', 3),
(28, 'Quelle matière qui prend 100 à 150 ans à se dégrader est omniprésente sur les plages du monde entier ?', 3),
(29, 'De combien de pourcents environ sont d\'origine les débris marins terrestre ?', 3),
(30, 'Que concerne la faune et la flore sous-marine', 3),
(31, 'Si l\'océan n\'élimine pas tous les déchets, qu\'en fait-il ?', 3),
(32, 'Les déchets industriels présentent-ils un réel danger pour les océans ?', 3),
(33, 'Qu\'est-ce que la \'marée noire\' ?', 3),
(34, 'Comment s\'est-elle déposée sur l\'océan ?', 3),
(35, 'Combien d\'années faudra-t-il pour que ses effets de pollution diminuent ?', 3),
(36, 'En 1337, Edouard III d\'Angleterre revendique la couronne de France alors que la France a déjà un roi, Philippe VI de Valois. Quel argument de filiation légitime cette revendication ?', 4),
(37, 'En 1346, quelle célèbre bataille se conclut par l\'écrasement de l\'armée française ?', 4),
(38, 'Lors de la bataille de Poitiers en 1356, l\'armée française est à nouveau défaite. En quoi le désastre est-il plus grand qu\'en 1346 ?', 4),
(39, 'En 1368, la guerre reprend. Quel célèbre connétable reconquiert une grande partie des territoires cédés lors du traité de Brétigny de 1360 ?', 4),
(40, 'La bataille d\'Azincourt en 1415 est un nouveau désastre pour l\'armée française. Le traité de Troyes de 1420 qui le suit est lui aussi une catastrophe. Il prévoit notamment', 4),
(41, 'Quelques années avant la bataille d\'Azincourt, Jeanne d\'Arc naît en Lorraine à', 4),
(42, 'Dès l\'âge de 13 ans, Jeanne d\'Arc entend les voix de saints et de saintes lui confier une mission. Quelle est cette mission ?', 4),
(43, 'Admise dans une salle du château de Chinon pour être reçue par Charles VII, que réussit à faire Jeanne d\'Arc ?', 4),
(44, 'Charles VII confie une armée à Jeanne d\'Arc pour secourir une ville assiégée par les Anglais. Comment s\'appelle cette ville ?', 4),
(45, 'A quel évènement assiste Jeanne d\'Arc le 17 juillet 1429 à Reims ?', 4),
(46, 'Comment s\'est eteinte Jeanne d\'Arc ?', 4),
(47, 'On cherche la couleur dans laquelle vous êtes quand vos chèques sont en bois :', 5),
(48, 'Si je suis un jeu, de quelle couleur suis-je ?', 5),
(49, 'De quelle couleur est la carte quand on vous donne le feu vert ?', 5),
(50, 'Delpech nous chantait "Ils sont arrivés dans l\'île nue sans un bagage et les pieds nus, comme un cyclone inattendu, comme une pluie de papillons, une fleur avant la saison à laquelle on n\'a jamais cru, c\'est comme un soleil..." mais de quelle couleur était le ciel ?', 5),
(51, 'Qu\'est ce qui est rouge dans le film de Melville réunissant Delon et Bourvil ?', 5),
(52, 'Si vous êtes sur la côte bleue, dans quelle ville êtes-vous ?', 5),
(53, 'De quelle couleur est l\'Aiguille située dans le Massif de la Vanoise ?', 5),
(54, 'Je suis lent si je suis petit :', 5),
(55, 'Comment sont les soucis ?', 5),
(56, 'A quelle couleur associez-vous l\'ictère ?', 5),
(57, 'En quelle année Einstein a-t-il publié sa théorie de la Relativité Générale ?', 6),
(58, 'Laquelle de ces particules n\'est pas un lepton ?', 6),
(59, 'Quelle est la particule messagère (vectrice) de la force forte ?', 6),
(60, 'Laquelle des 4 forces fondamentales est la plus faible ?', 6),
(61, 'Laquelle de ces particule est composite ?', 6),
(62, 'Quel scientifique est à l\'origine du théorème de dualité onde/corpuscule ?', 6),
(63, 'Comment appelle-t-on le phénomène lumineux par lequel une particule dépasse un photon dans un milieu autre que le vide ?', 6),
(64, 'Mais que signifie le \'c\' (représentant la vitesse de la lumière dans le vide) dans l\'équation E=MC2 ?', 6),
(65, 'Comment appelle-t-on le point de l\'orbite d\'un corps céleste qui est le plus rapproché d\'un trou noir ?', 6),
(66, 'Dans quel domaine parle-t-on de \'brane\' ?', 6),
(67, 'En quelle année a-t-on la trace de la première observation d\'une supernova ?', 6),
(68, 'Parmi ces appellations courantes, laquelle correspond au nom officiel du CERN ?', 6);

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

CREATE TABLE `reponses` (
  `id` int(11) NOT NULL,
  `id_question` int(11) DEFAULT NULL,
  `int_reponse` text,
  `juste` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reponses`
--

INSERT INTO `reponses` (`id`, `id_question`, `int_reponse`, `juste`) VALUES
(1, 3, 'Partout sur la Terre', 1),
(2, 3, 'Uniquement en Chine', 0),
(3, 4, 'Environ 165M', 1),
(4, 4, 'Environ 5M', 0),
(5, 5, 'Grâce aux traces de pattes', 0),
(6, 5, 'Grâce aux os fossiles', 1),
(7, 6, 'Soixante', 0),
(8, 6, 'Six cents', 1),
(9, 7, 'Des mammifères', 0),
(10, 7, 'Des reptiles', 1),
(11, 9, 'Personne : ils pouvaient se nourrir seuls.', 0),
(12, 9, 'Les maiasaures 1', 1),
(13, 10, 'Non', 1),
(14, 10, 'Oui', 1),
(15, 11, 'L\'oviraptor', 1),
(16, 11, 'Le vélociraptor', 0),
(17, 12, 'L\'urètosaure, le brachiosaure, le compsognathus', 0),
(18, 12, 'L\'ultrasaure, le brachiosaure, le diplodocus', 1),
(19, 13, 'Des dinosaures à long cou', 1),
(20, 13, 'Des dinosaures à grosse tête', 0),
(21, 14, 'Des animaux', 0),
(22, 14, 'Des plantes', 1),
(23, 15, 'L\'iguanodon', 0),
(24, 15, 'Le compsognathus', 1),
(25, 16, 'Le deinonychus', 0),
(26, 16, 'Le baryonyx', 1),
(27, 17, 'Strasbourg', 0),
(28, 17, 'Paris', 0),
(29, 17, 'Libourne', 1),
(30, 17, 'Narbonne', 0),
(31, 18, 'Grand comte', 0),
(32, 18, 'Grand duc', 1),
(33, 18, 'Grand roi', 0),
(34, 18, 'Grand prince', 0),
(35, 19, 'e', 0),
(36, 19, 'i', 0),
(37, 19, 'o', 1),
(38, 19, 'u', 0),
(39, 20, 'chanson', 0),
(40, 20, 'microphone', 0),
(41, 20, 'parole', 0),
(42, 20, 'vide', 1),
(43, 21, 'la circonférence de la cage thoracique', 0),
(44, 21, 'la distance entre les seins', 0),
(45, 21, 'le tour de poitrine en comptant les seins', 1),
(46, 21, 'la distance entre les omoplates', 0),
(47, 22, 'au rapport temps de rougissement / temps d\'exposition sans protection', 0),
(48, 22, 'au rapport temps de rougissement / temps d\'exposition avec protection', 0),
(49, 22, 'au rapport temps d\'exposition sans protection / temps de rougissement', 0),
(50, 22, 'au rapport temps d\'exposition avec protection / temps de rougissement', 1),
(51, 23, 'héméralopie', 1),
(52, 23, 'bronhumite', 0),
(53, 23, 'dépressionnite', 0),
(54, 23, 'arthrosopie', 0),
(55, 24, 'au christianisme', 0),
(56, 24, 'au lettrisme', 0),
(57, 24, 'au nazisme', 1),
(58, 24, 'au socialisme', 0),
(59, 25, '11 cm', 0),
(60, 25, '12 cm', 1),
(61, 25, '13 cm', 0),
(62, 25, '14 cm', 0),
(63, 26, 'Julinisse', 1),
(64, 26, 'Jouluvana', 0),
(65, 26, 'Joulupukki', 0),
(66, 26, 'Jultomte', 0),
(67, 27, 'L\'Océan Atlantique et Arctique', 0),
(68, 27, 'L\'Océan Indien et Pacifique', 0),
(69, 27, 'Tous les océans du monde', 1),
(70, 28, 'Les peaux de bananes', 0),
(71, 28, 'Le plastique', 1),
(72, 28, 'La viande séchée', 0),
(73, 29, '10%', 0),
(74, 29, '80%', 1),
(75, 29, '100%', 0),
(76, 30, 'Ses habitants (animaux)', 1),
(77, 30, 'Ses plantes (algues, coraux)', 1),
(78, 31, 'Il en stoke une grande partie', 1),
(79, 31, 'Il les vends à un pêcheur', 0),
(80, 31, 'Il fais leur connaissance', 0),
(81, 32, 'Non', 0),
(82, 32, 'Oui', 1),
(83, 33, 'De la mousse sur l\'eau', 0),
(84, 33, 'Du pétrole déversé dans l\'océan ', 1),
(85, 34, 'Accident de pétrolier', 1),
(86, 34, 'Accident de la route', 0),
(87, 35, '2 à 3 ans', NULL),
(88, 35, '4 à 5 ans', 0),
(89, 35, 'Plusieurs dizaines années', 1),
(90, 36, 'Il est l\'unique petit-fils de Philippe IV le Bel alors que Philippe VI en est le neveu', 1),
(91, 36, 'Il est le gendre de Charles IV le Bel, le prédécesseur de Philippe VI', 0),
(92, 36, 'Aucun lien de filiation n\'est mis en avant, Edouard III veut juste être roi de France', 0),
(93, 37, 'La bataille de Dijon', 0),
(94, 37, 'La bataille de Paris', 0),
(95, 37, 'La bataille de Crécy ', 1),
(96, 38, 'Plusieurs membres de la famille royale sont tués', 0),
(97, 38, 'Le roi est fait prisonnier', 1),
(98, 38, 'Lors d\'une manœuvre de l\'armée anglaise, l\'armée française est obligée de traverser une rivière et s\'y noie', 0),
(99, 39, 'Bertrand du Guesclin', 1),
(100, 39, 'Jean de Noailles', 0),
(101, 39, 'Louis d\'Evreux', 0),
(102, 40, 'La perte de la Normandie, de la Picardie, de la Bretagne et du Poitou ', 0),
(103, 40, 'Que le roi d\'Angleterre Henry V devienne l\'héritier du trône de France', 1),
(104, 40, 'Le paiement d\'un tribut pendant 10 ans à l\'Angleterre', 0),
(105, 41, 'Domrémy', 1),
(106, 41, 'Pontoise', 0),
(107, 41, 'Auxerre', 0),
(108, 42, 'Libérer la Lorraine du joug anglais', 0),
(109, 42, 'Bouter les Anglais hors de France', 1),
(110, 42, 'Libérer Paris de l\'occupation bourguignonne', 0),
(111, 43, 'Réciter la Bible de bout en bout sans la moindre erreur', 0),
(112, 43, 'Etonner l\'assemblée des nobles présents par son érudition', 0),
(113, 43, 'Identifier le roi parmi les nobles présents', 1),
(114, 44, 'Dijon', 0),
(115, 44, 'Reims', 0),
(116, 44, 'Orléans', 1),
(117, 45, 'Le sacre de Charles VII', 1),
(118, 45, 'Elle voit la Vierge Marie', 0),
(119, 45, 'Elle est anoblie par le roi', 0),
(120, 46, 'Elle meurt empoisonnée', 0),
(121, 46, 'Elle meurt de ses blessures', 0),
(122, 46, 'Elle redevenue poussière ', 1),
(123, 47, 'Vert', 0),
(124, 47, 'Noir', 0),
(125, 47, 'Rouge', 1),
(126, 48, 'Rouge', 0),
(127, 48, 'Vert', 0),
(128, 48, 'Jaune', 1),
(129, 49, 'Bleu', 0),
(130, 49, 'Grise', 0),
(131, 49, 'Blanche', 1),
(132, 50, 'Pourpre', 0),
(133, 50, 'Bleu', 0),
(134, 50, 'Gris', 1),
(135, 51, 'Le soleil', 0),
(136, 51, 'Le cercle', 1),
(137, 51, 'L\'auberge', 0),
(138, 52, 'Le grau du Roi', 0),
(139, 52, 'Carry le Rouet', 1),
(140, 52, 'Bandol', 0),
(141, 53, 'Rouge', 1),
(142, 53, 'Verte', 0),
(143, 53, 'Blanche', 0),
(144, 54, 'Violet', 0),
(145, 54, 'Bleu', 0),
(146, 54, 'Gris', 1),
(147, 54, 'Non', 0),
(148, 55, 'Orange', 1),
(149, 55, 'Oranges', 0),
(150, 55, 'Ce ne sont pas des soucis', 0),
(151, 56, 'Jaune', 1),
(152, 56, 'Violet', 0),
(153, 56, 'Rouge', 0),
(154, 57, '1905', 0),
(155, 57, '1915', 1),
(156, 57, '1925', 0),
(157, 57, '1935', 0),
(158, 58, 'Electron', 0),
(159, 58, 'Tau', 0),
(160, 58, 'Neutrino muonique', 0),
(161, 58, 'Quark up', 1),
(162, 59, 'Gluon', 1),
(163, 59, 'Graviton', 0),
(164, 59, 'Les bosons W+, W- et Z', 0),
(165, 59, 'Photon', 0),
(166, 60, 'Interaction (force) forte', 0),
(167, 60, 'Interaction (force) faible', 0),
(168, 60, 'Gravitation', 1),
(169, 60, 'Electromagnétisme', 0),
(170, 61, 'Le quark', 0),
(171, 61, 'L\'électron', 0),
(172, 61, 'Le proton', 1),
(173, 61, 'Le photon', 0),
(174, 62, 'Albert Einstein', 0),
(175, 62, 'Louis De Broglie', 1),
(176, 62, 'James Clerk Maxwell', 0),
(177, 62, 'Stephen Hawking', 0),
(178, 63, 'Effet Cherenkov', 1),
(179, 63, 'Effet Curie', 0),
(180, 63, 'Effet Aharonov-Bohm', 0),
(181, 63, 'Effet Casimir', 0),
(182, 64, 'C pour \'Comportement ondulatoire\'', 0),
(183, 64, 'C pour \'Constante\'', 0),
(184, 64, 'C pour \'Celeritas\'', 1),
(185, 64, 'C pour \'Clarté\'', 0),
(186, 65, 'Périhélie', 0),
(187, 65, 'Périgalacticon', 0),
(188, 65, 'Périmélasme', 1),
(189, 65, 'Périzène', 0),
(190, 66, 'En théorie des cordes', 1),
(191, 66, 'Dans le modèle standard', 0),
(192, 66, 'En chromodynamique quantique', 0),
(193, 66, 'En Supersymétrie', 0),
(194, 67, '-456', 0),
(195, 67, '185', 1),
(196, 67, '1054', 0),
(197, 67, '1604', 0),
(198, 68, 'Centre Européen de Recherche Nucléaire', 0),
(199, 68, 'Conseil Européen de Recherche Nucléaire', 0),
(200, 68, 'Organisation Européenne pour la Physique des Particules', 0),
(201, 68, 'Organisation Européenne pour la Recherche Nucléaire', 1);

-- --------------------------------------------------------

--
-- Structure de la table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `date_heure` date NOT NULL,
  `temps` int(11) NOT NULL,
  `id_theme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `themes`
--

INSERT INTO `themes` (`id`, `nom`, `description`) VALUES
(1, 'Les dinosaures', 'Quelques petites question pas piqués des hannetons sur nos ancètres :D'),
(2, 'Culture Générale', 'blabla'),
(3, 'La vie sous-marine', 'glou-glou'),
(4, 'La guerre', 'pan-pan'),
(5, 'Les couleurs', 'grat grat'),
(6, 'La mécanique quantique et relativité générale', '*bruit de cerveau en fusion*');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_theme` (`id_theme`);

--
-- Index pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_question` (`id_question`);

--
-- Index pour la table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_theme` (`id_theme`);

--
-- Index pour la table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT pour la table `reponses`
--
ALTER TABLE `reponses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT pour la table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_theme`) REFERENCES `themes` (`id`);

--
-- Contraintes pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `reponses_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`);

--
-- Contraintes pour la table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`id_theme`) REFERENCES `themes` (`id`);
