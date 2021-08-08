DROP DATABASE IF EXISTS notes_db;
CREATE DATABASE notes_db;
USE notes_db;

#	Creación y llenado de tabla users
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES 
(1,"Keary Woof","kwoof0@economist.com"),
(2,"Stanley Surgeoner","ssurgeoner1@xing.com"),
(3,"Ellene Tripet","etripet2@cafepress.com"),
(4,"Charmian Kopf","ckopf3@blinklist.com"),
(5,"Florry Bruggeman","fbruggeman4@bing.com"),
(6,"Mylo Beasleigh","mbeasleigh5@google.co.uk"),
(7,"Zarah Easton","zeaston6@ebay.co.uk"),
(8,"Linette Ribbens","lribbens7@fastcompany.com"),
(9,"Sophia Slany","sslany8@salon.com"),
(10,"Archie Middleditch","amiddleditch9@boston.com");
UNLOCK TABLES;

#	Creación y llenado de tabla categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
LOCK TABLES `categories` WRITE;
INSERT INTO `categories` VALUES 
(1,"Personal notes"),
(2,"Song lyrics"),
(3,"Random thoughts"),
(4,"Chores"),
(5,"School assignments"),
(6,"Shopping"),
(7,"Medical records"),
(8,"Pets"),
(9,"Movies"),
(10,"Books");
UNLOCK TABLES;

#	Creación y llenado de tabla notes
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text NOT NULL,
  `deletable` tinyint NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_user_id_foreign` (`user_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
LOCK TABLES `notes` WRITE;
INSERT INTO `notes` VALUES 
(1,"Title 1",NULL,NULL,"His name was Gaal Dornick and he was just a country boy who had never seen Trantor before. That is, not in real life. He had seen it many times on the hyper-video, and occasionally in tremendous three-dimensional newscasts covering an Imperial Coronation or the opening of a Galactic Council. Even though he had lived all his life on the world of Synnax, which circled a star at the edges of the Blue Drift, he was not cut off from civilization, you see. At that time, no place in the Galaxy was.",0,1),
(2,"Title 2",NULL,NULL,"There were nearly twenty-five million inhabited planets in the Galaxy then, and not one but owed allegiance to the Empire whose seat was on Trantor. It was the last half-century in which that could be said.",0,2),
(3,"Title 3",NULL,NULL,"To Gaal, this trip was the undoubted climax of his young, scholarly life. He had been in space before so that the trip, as a voyage and nothing more, meant little to him. To be sure, he had traveled previously only as far as Synnax’s only satellite in order to get the data on the mechanics of meteor driftage which he needed for his dissertation, but space-travel was all one whether one travelled half a million miles, or as many light years.",1,2),
(4,"Title 4",NULL,NULL,"He had steeled himself just a little for the Jump through hyper-space, a phenomenon one did not experience in simple interplanetary trips. The Jump remained, and would probably remain forever, the only practical method of travelling between the stars. Travel through ordinary space could proceed at no rate more rapid than that of ordinary light (a bit of scientific knowledge that belonged among the items known since the forgotten dawn of human history), and that would have meant years of travel between even the nearest of inhabited systems. Through hyper-space, that unimaginable region that was neither space nor time, matter nor energy, something nor nothing, one could traverse the length of the Galaxy in the interval between two neighboring instants of time.",1,5),
(5,"Title 5",NULL,NULL,"Gaal had waited for the first of those jumps with a little dread curled gently in his stomach, and it ended in nothing more than a trifling jar, a little internal kick which ceased an instant before he could be sure he had felt it. That was all.",1,3),
(6,"Title 6",NULL,NULL,"And after that, there was only the ship, large and glistening; the cool production of 12,000 years of Imperial progress; and himself, with his doctorate in mathematics freshly obtained and an invitation from the great Hari Seldon to come to Trantor and join the vast and somewhat mysterious Seldon Project.",1,4),
(7,"Title 7",NULL,NULL,"What Gaal was waiting for after the disappointment of the Jump was that first sight of Trantor. He haunted the View-room. The steel shutter-lids were rolled back at announced times and he was always there, watching the hard brilliance of the stars, enjoying the incredible hazy swarm of a star cluster, like a giant conglomeration of fireflies caught in mid-motion and stilled forever. At one time there was the cold, blue-white smoke of a gaseous nebula within five light years of the ship, spreading over the window like distant milk, filling the room with an icy tinge, and disappearing out of sight two hours later, after another Jump.",1,5),
(8,"Title 8",NULL,NULL,"The first sight of Trantor’s sun was that of a hard, white speck all but lost in a myriad such, and recognizable only because it was pointed out by the ship’s guide. The stars were thick here near the Galactic center. But with each Jump, it shone more brightly, drowning out the rest, paling them and thinning them out.",1,7),
(9,"Title 9",NULL,NULL,"An officer came through and said, “View-room will be closed for the remainder of the trip. Prepare for landing.”",1,8),
(10,"Title 10",NULL,NULL,"Gaal had followed after, clutching at the sleeve of the white uniform with the Spaceship-and-Sun of the Empire on it.

He said, “Would it be possible to let me stay? I would like to see Trantor.”

The officer smiled and Gaal flushed a bit. It occurred to him that he spoke with a provincial accent.

The officer said, “We’ll be landing on Trantor by morning.”

“I mean I want to see it from Space.”",1,9);
UNLOCK TABLES;

#	Creación y llenado de tabla category_note
DROP TABLE IF EXISTS `category_note`;
CREATE TABLE `category_note` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_note_note_id_foreign` (`note_id`),
  KEY `category_note_category_id_foreign` (`category_id`),
  CONSTRAINT `category_note_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`),
  CONSTRAINT `category_note_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
LOCK TABLES `category_note` WRITE;
INSERT INTO `category_note` VALUES 
(1,1,1),
(2,1,2),
(3,2,2),
(4,2,3),
(5,3,3),
(6,3,4),
(7,4,4),
(8,4,5),
(9,5,5),
(10,5,6),
(11,6,6),
(12,6,7),
(13,7,7),
(14,7,8),
(15,8,8),
(16,8,9),
(17,9,9),
(18,9,10),
(19,10,10),
(20,10,1);
UNLOCK TABLES;

select notes.title, categories.name, users.name
from notes
inner join category_note
on notes.id = category_note.note_id
inner join categories
on categories.id = category_note.category_id
inner join users
on notes.user_id = users.id;

