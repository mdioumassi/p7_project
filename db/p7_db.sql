-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 02 mai 2022 à 20:13
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `p7_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `commenter_id` int(11) NOT NULL,
  `postCommented_id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `commenter_id`, `postCommented_id`, `pseudo`, `message`, `date`) VALUES
(19, 36, 56, 'PseudoTest6', 'Yo updated', '2022-04-29'),
(20, 36, 56, 'PseudoTest6', 'Yo up', '2022-04-29'),
(34, 36, 84, 'PseudoTest6Updated', 'test com', '2022-05-01'),
(35, 50, 84, 'testReact6', 'test react', '2022-05-01'),
(36, 36, 85, 'PseudoTest6Updated', 'Test2', '2022-05-01'),
(38, 36, 81, 'Hugo', 'Commentaire', '2022-05-01'),
(40, 76, 85, 'Pierre', 'test commentaire', '2022-05-02');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `liker_id` int(11) NOT NULL,
  `postLiked_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `liker_id`, `postLiked_id`) VALUES
(174, 36, 9),
(194, 36, 84),
(195, 50, 84),
(211, 76, 81);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'No img',
  `video` varchar(255) NOT NULL DEFAULT 'No video',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `poster_id`, `message`, `image`, `video`, `date`) VALUES
(9, 36, 'MsgTest with video', 'No img', 'https://www.youtube.com/embed/dQw4w9WgXcQ', '2022-04-09'),
(15, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(16, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(17, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(18, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(23, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(24, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(25, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(26, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(27, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(28, 36, 'MsgTest', 'No img', '', '2022-04-11'),
(39, 36, 'test', 'No img', '', '2022-04-28'),
(40, 36, 'test2', 'No img', '', '2022-04-28'),
(41, 36, 'test3', 'No img', '', '2022-04-28'),
(46, 36, 'test req', 'No img', '', '2022-04-29'),
(48, 36, 'test req 3', 'http://localhost:5000/images/beach_coast_holiday_island_landscape_nature_nobody_600768.jpg1651185976392.jpg', '', '2022-04-29'),
(50, 36, 'test vid +', 'No img', 'https://www.youtube.com/embed/OC9swIBpD_U', '2022-04-29'),
(51, 36, 'test', 'No img', '', '2022-04-29'),
(55, 36, 'nouveau test', 'No img', '', '2022-04-29'),
(56, 36, 'Yes 2', 'No img', '', '2022-04-29'),
(65, 36, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.', 'No img', '', '2022-04-29'),
(66, 36, 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n\'a pas fait que survivre cinq siècles, mais s\'est aussi adapté à la bureautique informatique, sans que son contenu n\'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker. Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant', 'No img', '', '2022-04-29'),
(69, 36, '', 'No img', 'https://www.youtube.com/embed/bml92jhF4t8', '2022-04-29'),
(71, 36, 'test', 'http://localhost:5000/images/beach_coast_holiday_island_landscape_nature_nobody_600768.jpg1651267802788.jpg', '', '2022-04-29'),
(72, 36, 'test test', 'No img', '', '2022-04-29'),
(73, 36, 'yes', 'No img', '', '2022-04-29'),
(74, 36, '', 'http://localhost:5000/images/436033.jpg1651268678678.jpg', '', '2022-04-29'),
(75, 36, 'test', 'No img', '', '2022-04-29'),
(76, 36, '', 'http://localhost:5000/images/436033.jpg1651268734448.jpg', '', '2022-04-29'),
(77, 36, 'test', 'http://localhost:5000/images/India_Gate_600x400.jpg1651352876795.jpg', '', '2022-04-30'),
(79, 36, 'test', 'http://localhost:5000/images/436033.jpg1651361794336.jpg', '', '2022-05-01'),
(81, 50, 'test', 'No img', '', '2022-05-01'),
(84, 36, 'test', 'No img', 'https://www.youtube.com/embed/1lvnT2oE0_4', '2022-05-01'),
(85, 36, 'test', 'No img', '', '2022-05-01'),
(88, 36, 'test', 'No img', 'https://www.youtube.com/embed/bml92jhF4t8', '2022-05-02');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT './icons/user-solid.svg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `email`, `password`, `image`) VALUES
(33, 'PseudoTest5', 'test5@gmail.com', '$2b$10$oVpt9JEc0MLboOapRpy0meysFW3AMDXL2L5sb8Gw0dqMtet8OXnpG', './icons/user-solid.svg'),
(36, 'Hugo', 'test6@gmail.com', '$2b$10$vekS53TqcxgBhJQNc3jERuir5notezfB6EEpGUdQzFpWOe0z8f8gy', 'http://localhost:5000/images/destiny.png1651446367582.png'),
(37, 'PseudoTest7', 'test7@gmail.com', '$2b$10$OIfLQdgGoBj8.BDTVbxLjeVXn65zUKyADru3Rv0HXlZUfgwJR1f4G', './icons/user-solid.svg'),
(39, 'PseudoTest8', 'test8@gmail.com', '$2b$10$v.zEw0HR1BeFnnSWFggsYeASHBVZIzEm74JC8FXTMJP1.3EvfZvLm', './icons/user-solid.svg'),
(42, 'testReact', 'testReact@gmail.com', '$2b$10$l/Yd.RHmtUFjhx3G8u6Yh.5p0sXEqJdNP4Jnl4yBoqzvTOXUTIPo6', './icons/user-solid.svg'),
(44, 'testReact2', 'testReact2@gmail.com', '$2b$10$XIvPa/7ibuW25sN6ZHnJKeX3RZiO3kObjhnKpHJKGadRmIrY2YfKm', './icons/user-solid.svg'),
(45, 'testReact3', 'testReact3@gmail.com', '$2b$10$whykQ5V525A5PKTlryH6H.8CAdZwDf1Iq2OlSRj7afmDs0iuKzsFi', './icons/user-solid.svg'),
(48, 'testReact4', 'testReact4@gmail.com', '$2b$10$7.6VVnzs152j1JHxxgf6..FVONNSg6AnsvyAw9z1aZZMqB7Hcqq7K', './icons/user-solid.svg'),
(49, 'testReact5', 'testReact5@gmail.com', '$2b$10$0nfDAyB9slXdqi2EOJOqMeBBEMCe07J7t7ITL7mWW9M2HcPXDeB3G', './icons/user-solid.svg'),
(50, 'Zidane', 'testReact6@gmail.com', '$2b$10$kLAgR6kFh/v.7SrNgaH1AuHXp7.rsVeVE7KKDj/lo/bRDkfgxBaFO', 'http://localhost:5000/images/modèle-de-vecteur-d-icône-du-logo-real-madrid-pour-le-t-shirt-ou-la-bannière-173832438.jpg1651446130847.jpg'),
(69, 'testReact7', 'testReact7@gmail.com', '$2b$10$fjfKFAIaYB0AlsRXqMyj1.yIX8bEn.lpKInWFKvL6RXNMAZzJSBf6', './icons/user-solid.svg'),
(73, 'testReact8', 'testReact8@gmail.com', '$2b$10$sSF5SbdcNvJhQ.WhCRk0Z.aHX4LsubtJIcwJmPvFPghaN83sXuBEy', './icons/user-solid.svg'),
(74, 'testDelete', 'testDelete@gmail.com', '$2b$10$yWmOpaMH1Kt8JSgFAjCBV.DKaj/idux5eRxy.oTi0rMzOkVyduTsC', './icons/user-solid.svg'),
(76, 'Pierre', 'test123@gmail.com', '$2b$10$M8oiHvQBThHDJyUou4qP4.HqXlj3FyHdrWHW1T5M3mxv6MlNDcPam', 'http://localhost:5000/images/logo-gad19b0810_1280.png1651507975304.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_linked_to_post` (`postCommented_id`),
  ADD KEY `comment_linked_to_user` (`commenter_id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `like_linked_to_post` (`postLiked_id`),
  ADD KEY `like_linked_to_user` (`liker_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_linked_to_user` (`poster_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_linked_to_post` FOREIGN KEY (`postCommented_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_linked_to_user` FOREIGN KEY (`commenter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `like_linked_to_post` FOREIGN KEY (`postLiked_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_linked_to_user` FOREIGN KEY (`liker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `post_linked_to_user` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
