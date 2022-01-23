/*
    Author: Kaymon McCain
    Date: 1/13/2022
    
    This script is to create tables for the youtunes webapp. Database name youtunes
*/

-- Use the youtunes database
use youtunes;

-- drop test user if exists 
DROP USER IF EXISTS 'youtunes_user'@'localhost';


-- create pysports_user and grant them all privileges to the pysports database 
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pass';


-- grant all privileges to the pysports database to user pysports_user on localhost 
GRANT ALL PRIVILEGES ON youtunes.* TO'youtunes_user'@'localhost';


-- Drop the foreign key
ALTER TABLE album DROP FOREIGN KEY fk_artist;


-- drop tables if they are present
DROP TABLE IF EXISTS artist; 
DROP TABLE IF EXISTS album; 


-- create artist table 
CREATE TABLE artist (
	artist_id 		INT 			NOT NULL		AUTO_INCREMENT,
	first_name		VARCHAR(75)		NOT NULL,
	last_name		VARCHAR(75)		NOT NULL,
	PRIMARY KEY(artist_id)
);

-- create album table 
CREATE TABLE album (
	album_id		INT 			NOT NULL 		AUTO_INCREMENT,
	title			VARCHAR(150)	NOT NULL,
	price			DECIMAL(5, 2)	NOT NULL,
	genre			VARCHAR(75)		NOT NULL,
	img_url			VARCHAR(150)	NOT NULL,
	artist_id		INT				NOT NULL,
	PRIMARY KEY(album_id),
	CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
); 


-- insert artist statements 

-- Jazz
INSERT INTO artist(first_name, last_name)
	VALUES('Alfa', 'Mist');

INSERT INTO artist(first_name, last_name)
	VALUES('Joey', 'Defrancesco');

-- Classical
INSERT INTO artist(first_name, last_name)
	VALUES('Claude', 'Debussy');
    
INSERT INTO artist(first_name, last_name)
	VALUES('Ludwig van', 'Beethoven');

-- Blues
INSERT INTO artist(first_name, last_name)
	VALUES('Sugaray', 'Rayford');
	
INSERT INTO artist(first_name, last_name)
	VALUES('Eric', 'Bibb');
    
-- Rock
INSERT INTO artist(first_name, last_name)
	VALUES('Green', 'Day');
	
INSERT INTO artist(first_name, last_name)
	VALUES('The ', 'Cranberries');
	
	
-- insert album statements

-- Jazz
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Antiphon', 29.99, 'Jazz', '/youtunes/images/antiphon.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Mist'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('More Music', 35.59, 'Jazz', '/youtunes/images/more_music.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Defrancesco'));
	
-- Clasical
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Clair De Lune', 132.18, 'Classical', '/youtunes/images/clair_de_lune.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Debussy'));

INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Beethoven Complete Edition', 119.99, 'Classical', '/youtunes/images/beethoven_complete_edition.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Beethoven'));
	
-- Blues
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Someboy Save Me', 39.90, 'Blues', '/youtunes/images/somebody_save_me.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Rayford'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Bookers Guitar', 19.89, 'Blues', '/youtunes/images/bookers_guitar.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Bibb'));

-- Rock
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Dookie', 45.90, 'Rock', '/youtunes/images/dookie.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Day'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('No Need To Argue', 29.89, 'Rock', '/youtunes/images/no_need_to_argue.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Cranberries'));

select * from album;