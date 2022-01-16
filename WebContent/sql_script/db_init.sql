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
INSERT INTO artist(first_name, last_name)
	VALUES('Kid', 'Cudi');

INSERT INTO artist(first_name, last_name)
	VALUES('Elton', 'John');
	
INSERT INTO artist(first_name, last_name)
	VALUES('Billie', 'Holidy');
	
INSERT INTO artist(first_name, last_name)
	VALUES('Childish', 'Gambino');
	
INSERT INTO artist(first_name, last_name)
	VALUES('Chance', 'The Rapper');
	
	
-- insert album statements
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Man On the Moon: The End of Day', 29.99, 'Hip Hop', '/youtunes/images/ManonTheMoonTheEndofDay.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Cudi'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Honky Chateau', 141.59, 'Classic Rock', '/youtunes/images/HonkyChateau.jpg', (SELECT artist_id FROM artist WHERE last_name = 'John'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Billie Holiday 1957', 132.18, 'Classical', '/youtunes/images/BillieHoliday.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Holidy'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Awaken, My Love!', 39.90, 'Hip Hop', '/youtunes/images/AwakenMyLove.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Gambino'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Acid Rap', 19.89, 'Rap', '/youtunes/images/AcidRap.jpg', (SELECT artist_id FROM artist WHERE last_name = 'The Rapper'));