CREATE database IMDB;
USE IMDB;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    release_date DATE,
    duration_minutes INT
);

INSERT INTO Movies (movie_id, title, release_date, duration_minutes)
VALUES
    (1, 'Inception', '2010-07-16', 148),
    (2, 'Interstellar', '2014-11-07', 169),
    (3, 'The Matrix', '1999-03-31', 136),
    (4, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 178),
    (5, 'Forrest Gump', '1994-07-06', 142);


SELECT * FROM Movies;

CREATE TABLE Media (
    media_id INT PRIMARY KEY,
    movie_id INT,
    media_type ENUM('image', 'video'),
    file_path VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);


INSERT INTO Media(media_id, movie_id, media_type, file_path)
VALUES
    (1,1,'image', 'C:\Users\chand\Videos\1.jpeg'),
    (2,1,'video', 'C:\Users\chand\Videos\1.mp4'),
    (3,2,'image',  'C:\Users\chand\Videos\2.jpeg'),
    (4,2,'video',  'C:\Users\chand\Videos\2.mp4');
  
SELECT * FROM Media;

CREATE TABLE Genre(
    genre_id INT PRIMARY KEY,
    genre_name NVARCHAR(50) NOT NULL
);

INSERT INTO Genre(genre_id,genre_name)
VALUES
    (1, 'Action'),
    (2, 'Thriller'),
    (3, 'comedy'),
    (4, 'Romance');

SELECT * FROM Genre;

CREATE TABLE Users(
    user_id INT PRIMARY KEY,
    user_name NVARCHAR(120) NOT NULL
);

INSERT INTO Users(user_id, user_name)
VALUES
    (1, 'Sushma'),
    (2, 'Aadhya'),
    (3, 'Atharv'),
    (4, 'Chandu');

SELECT * FROM Users;

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    review_text NVARCHAR(500),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


INSERT INTO Reviews(review_id, movie_id, user_id, review_text)
VALUES
    (1, 1, 1, "Direction was super, Hero and heroine acted so well."),
    (2, 2, 1, 'Super comedy movie, enjoyed a lot.'),
    (3, 2, 3, "Laughed through out the movie, super screenplay." );

SELECT * FROM Reviews;

CREATE TABLE Artists (
    artist_id INT PRIMARY KEY,
    artist_name NVARCHAR(120) NOT NULL
);


INSERT INTO Artists(artist_id, artist_name)
VALUES
    (1, 'Rajinikanth'),
    (2, 'Brahmanandam'),
    (3, 'Rajamouli'),
    (4, 'Anirudh'),
    (5, 'Trisha'),
    (6,'Trivikram');

SELECT * FROM Artists;

CREATE TABLE Skills (
    skill_id INT PRIMARY KEY,
    skill_name NVARCHAR(50) NOT NULL
);

INSERT INTO Skills(skill_id, skill_name)
VALUES
    (1, 'Direction'),
    (2, 'Acting'),
    (3, 'Singing'),
    (4, 'Music'),
    (5, 'Writing');

SELECT * FROM Skills ;

CREATE TABLE ArtistSkills (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);

INSERT INTO ArtistSkills(artist_id, skill_id)
VALUES
    (1,2),
    (2,2),
    (3,1),
    (4,3),
    (4,4),
    (5,2),
    (6,1),
    (6,5);

SELECT * FROM ArtistSkills;

CREATE TABLE ArtistRoles (
    artist_id INT,
    movie_id INT,
    role VARCHAR(50),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO ArtistRoles (artist_id, movie_id, role)
VALUES
    (1, 1, 'hero'),
    (2, 1, 'comedian'),
    (3, 1, 'director'),
    (4, 2, 'music director'),
    (5, 1, 'heroine'),
    (6, 3, 'script writer');

SELECT * FROM ArtistRoles;

CREATE TABLE MovieGenre (
    movie_id INT,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

INSERT INTO MovieGenre(movie_id, genre_id)
VALUES
    (1,1),
    (1,2),
    (2,3),
    (3,4),
    (4,2),
    (5,4);

SELECT * FROM MovieGenre;
