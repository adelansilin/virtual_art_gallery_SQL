-- Creation of the Virtual_Art_Gallery database
CREATE DATABASE Virtual_Art_Gallery;

-- Usage of the Virtual_Art_Gallery database
USE Virtual_Art_Gallery;

-- Creation of Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(50),
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(50),
    Website VARCHAR(255),
    ContactInformation VARCHAR(50)
);

-- Creation of Artwork table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY,
    Title VARCHAR(70),
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(100),
    ImageURL VARCHAR(255),
    ArtistID INT,
    FOREIGN KEY (ArtistID)
        REFERENCES Artist (ArtistID)
);

-- creation of User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50),
    Email VARCHAR(255),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255)
);

-- creation of User_Favorite_Artwork table(JUNCTIONTABLE)
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    FOREIGN KEY (UserID)
        REFERENCES User (UserID),
    FOREIGN KEY (ArtWorkID)
        REFERENCES Artwork (ArtworkID)
);

-- Creation of gallery table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT,
    Location VARCHAR(100),
    Curator INT,
    OpeningHours VARCHAR(255),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);

-- Creation of Artwork_Gallery junction table
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    FOREIGN KEY (ArtworkID)
        REFERENCES Artwork (ArtworkID),
    FOREIGN KEY (GalleryID)
        REFERENCES Gallery (GalleryID)
);

-- Insertion of sample data into Artist table 
INSERT INTO Artist 
VALUES
(1,'Leonardo da Vinci', 'Leonardo di ser Piero da Vinci was an Italian polymath of the High Renaissance who is widely considered one of the most diversely talented individuals ever to have lived. He was born on April 15, 1452, in Vinci, Italy.', '1452-04-15', 'Italian', 'https://en.wikipedia.org/wiki/Leonardo_da_Vinci', 'contact@leonardodavinci.com'),
(2,'Vincent van Gogh', 'Vincent Willem van Gogh was a Dutch Post-Impressionist painter who is among the most famous and influential figures in the history of Western art. He was born on March 30, 1853, in Zundert, Netherlands.', '1853-03-30', 'Dutch', 'https://en.wikipedia.org/wiki/Vincent_van_Gogh', 'contact@vincentvangogh.com'),
(3,'Pablo Picasso', 'Pablo Ruiz Picasso was a Spanish painter, sculptor, printmaker, ceramicist and theatre designer who spent most of his adult life in France. He was born on October 25, 1881, in Málaga, Spain.', '1881-10-25', 'Spanish', 'https://en.wikipedia.org/wiki/Pablo_Picasso', 'contact@picasso.com'),
(4,'Michelangelo', 'Michelangelo di Lodovico Buonarroti Simoni was an Italian sculptor, painter, architect, and poet of the High Renaissance who is considered one of the greatest artists of all time. He was born on March 6, 1475, in Caprese, Italy.', '1475-03-06', 'Italian', 'https://en.wikipedia.org/wiki/Michelangelo', 'contact@michelangelo.com'),
(5,'Claude Monet', 'Oscar-Claude Monet was a French painter and founder of the Impressionist movement who is known for his paintings of water lilies, haystacks, and the Rouen Cathedral. He was born on November 14, 1840, in Paris, France.', '1840-11-14', 'French', 'https://en.wikipedia.org/wiki/Claude_Monet', 'contact@claudemonet.com'),
(6,'Rembrandt', 'Rembrandt Harmenszoon van Rijn was a Dutch draughtsman, painter, and printmaker. An innovative and prolific master in three media, he is generally considered one of the greatest visual artists in the history of art and the most important in Dutch art history.', '1606-07-15', 'Dutch', 'https://en.wikipedia.org/wiki/Rembrandt', 'contact@rembrandt.com'),
(7,'Johannes Vermeer', 'Johannes Vermeer was a Dutch Baroque Period painter who specialized in domestic interior scenes of middle-class life. He was born on October 31, 1632, in Delft, Netherlands.', '1632-10-31', 'Dutch', 'https://en.wikipedia.org/wiki/Johannes_Vermeer', 'contact@vermeer.com'),
(8,'Auguste Rodin', 'François-Auguste-René Rodin was a French sculptor generally considered the founder of modern sculpture. He was born on November 12, 1840, in Paris, France.', '1840-11-12', 'French', 'https://en.wikipedia.org/wiki/Auguste_Rodin', 'contact@rodin.com'),
(9,'Raja Ravi Varma', 'Raja Ravi Varma was a celebrated Indian painter and artist. He is considered one of the greatest painters in the history of Indian art. His works are known for their portrayal of Indian mythology and culture.', '1848-04-29', 'Indian', 'https://en.wikipedia.org/wiki/Raja_Ravi_Varma', 'contact@rajaravivarma.com'),
(10,'Salvador Dalí', 'Salvador Dalí was a Spanish Surrealist artist renowned for his eccentric personality, surreal imagery, and flamboyant mustache. He was born on May 11, 1904, in Figueres, Spain.', '1904-05-11', 'Spanish', 'https://en.wikipedia.org/wiki/Salvador_Dal%C3%AD', 'contact@salvadordali.com');

SELECT * FROM User_Favorite_Artwork;
INSERT INTO Artwork 
VALUES
(1,'Mona Lisa', 'The Mona Lisa is a half-length portrait painting by the Italian artist Leonardo da Vinci. It is considered an archetypal masterpiece of the Italian Renaissance.', '1503-08-01', 'Oil on Poplar Panel', 'https://en.wikipedia.org/wiki/Mona_Lisa#/media/File:Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF_retouched.jpg', 1),
(2,'The Starry Night', 'The Starry Night is an oil on canvas painting by Dutch Post-Impressionist painter Vincent van Gogh. It depicts the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence.', '1889-06-18', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/The_Starry_Night#/media/File:Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg', 2),
(3,'Guernica', 'Guernica is a mural-sized oil painting on canvas by Spanish artist Pablo Picasso. It is one of Picasso\'s most famous works and depicts the horrors of the bombing of Guernica during the Spanish Civil War.', '1937-04-26', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Guernica_(Picasso)#/media/File:PicassoGuernica.jpg', 3),
(4,'David', 'David is a masterpiece of Renaissance sculpture created by the Italian artist Michelangelo. It depicts the Biblical hero David, represented as a standing male nude.', '1504-02-01', 'Marble', 'https://en.wikipedia.org/wiki/David_(Michelangelo)#/media/File:Michelangelo%27s_David_2015.jpg', 4),
(5,'Water Lilies', 'Water Lilies is a series of approximately 250 oil paintings by French Impressionist Claude Monet. They depict Monet\'s flower garden at his home in Giverny.', '1926-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Water_Lilies_(Monet_series)#/media/File:Claude_Monet_-_Water_Lilies_-_Google_Art_Project.jpg', 5),
(6,'Shakuntala', 'Shakuntala is a painting by Indian artist Raja Ravi Varma. It depicts the Hindu mythological character Shakuntala, a figure from the Mahabharata.', '1870-01-01', 'Oil on Canvas', 'https://commons.wikimedia.org/wiki/File:Shakuntala_by_Raja_Ravi_Varma.jpg', 9),
(7,'The Persistence of Memory', 'The Persistence of Memory is a surrealistic painting by Spanish artist Salvador Dalí. It depicts melting clocks in a dream-like landscape.', '1931-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/The_Persistence_of_Memory#/media/File:The_Persistence_of_Memory.jpg', 10),
(8,'Starry Night Over the Rhône', 'Starry Night Over the Rhône is a painting by Vincent van Gogh. It depicts the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence.', '1888-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Starry_Night_Over_the_Rh%C3%B4ne#/media/File:Van_Gogh_-_Starry_Night_over_the_Rh%C3%B4ne.jpg', 2),
(9,'Les Demoiselles d\'Avignon', 'Les Demoiselles d\'Avignon is a large oil painting created by Pablo Picasso. It is considered a seminal work in the early development of Cubism.', '1907-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Les_Demoiselles_d%27Avignon#/media/File:Les_Demoiselles_d%27Avignon.jpg', 3),
(10,'The Last Supper', 'The Last Supper is a late 15th-century mural painting by Leonardo da Vinci depicting the Last Supper of Jesus with his disciples.', '1498-01-01', 'Fresco', 'https://en.wikipedia.org/wiki/The_Last_Supper_(Leonardo)#/media/File:%C3%9Altima_Cena_-_Da_Vinci_5.jpg', 1),
(11,'Girl with a Pearl Earring', 'Girl with a Pearl Earring is one of Johannes Vermeer\'s most famous works. It depicts a girl wearing a pearl earring and has been the subject of various interpretations and adaptations.', '1665-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Girl_with_a_Pearl_Earring#/media/File:Meisje_met_de_parel.jpg', 7),
(12,'Impression, Sunrise', 'Impression, Sunrise is a painting by Claude Monet that gave rise to the name of the Impressionist movement. It depicts the port of Le Havre in France at sunrise.', '1872-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/Impression,_Sunrise#/media/File:Claude_Monet,_Impression,_soleil_levant.jpg', 5),
(13,'The Thinker', 'The Thinker is a bronze sculpture by French artist Auguste Rodin. It depicts a man in a seated position, deep in thought.', '1882-01-01', 'Bronze', 'https://en.wikipedia.org/wiki/The_Thinker#/media/File:Le_Penseur_www_cut.jpg', 8),
(14,'The Night Watch', 'The Night Watch is a painting by Dutch artist Rembrandt. It is one of the most famous Dutch Golden Age paintings and is renowned for its use of dramatic lighting and motion.', '1642-01-01', 'Oil on Canvas', 'https://en.wikipedia.org/wiki/The_Night_Watch#/media/File:The_Nightwatch_by_Rembrandt.jpg', 6);

-- Insertion of sample data into User table
INSERT INTO User
VALUES
(1,'adel_mariam', 'AdelMariam123', 'adel_mariam@gmail.com', 'Adel', 'Mariam', '2002-09-09', '/path/to/profile_pictures/adel_mariam.jpg'),
(2,'hemma_sri', 'HemmaSri123', 'hemma_sri@gmail.com', 'Hemma', 'Sri', '2003-04-09', '/path/to/profile_pictures/hemma_sri.jpg'),
(3,'anindita_kannan', 'AninditaKannan123', 'anindita_kannan@gmail.com', 'Anindita', 'Kannan', '2002-12-17', '/path/to/profile_pictures/anindita_kannan.jpg'),
(4,'abel_george', 'AbelGeorge123', 'abel_george@gmail.com', 'Abel', 'George', '2000-01-20', '/path/to/profile_pictures/abel_george.jpg'),
(5,'ansilin_george', 'AnsilinGeorge123', 'ansilin_george@gmail.com', 'Ansilin', 'George', '2000-01-17', '/path/to/profile_pictures/ansilin_george.jpg'),
(6,'daisy_mary', 'DaisyMary123', 'daisy_mary@gmail.com', 'Daisy', 'Mary', '1996-09-07', '/path/to/profile_pictures/daisy_mary.jpg'),
(7,'elsa_jean', 'ElsaJean123', 'elsa_jean@gmail.com', 'Elsa', 'Jean', '1997-12-21', '/path/to/profile_pictures/elsa_jean.jpg'),
(8,'cynthia_terese', 'CynthiaTerese123', 'cynthia_terese@gmail.com', 'Cynthia', 'Terese', '1990-07-03', '/path/to/profile_pictures/cynthia_terese.jpg'),
(9,'john_abraham', 'JohnAbraham123', 'john_abraham@gmail.com', 'John', 'Abraham', '1995-02-18', '/path/to/profile_pictures/john_abraham.jpg'),
(10,'lloyd_xavier', 'LloydXavier123', 'lloyd_xavier@gmail.com', 'Lloyd', 'Xavier', '2000-10-05', '/path/to/profile_pictures/lloyd_xavier.jpg'),
(11,'maria_smith', 'MariaSmith123', 'maria_smith@gmail.com', 'Maria', 'Smith', '1993-08-12', '/path/to/profile_pictures/maria_smith.jpg'),
(12,'alex_jones', 'AlexJones123', 'alex_jones@gmail.com', 'Alex', 'Jones', '1998-05-25', '/path/to/profile_pictures/alex_jones.jpg'),
(13,'emily_davis', 'EmilyDavis123', 'emily_davis@gmail.com', 'Emily', 'Davis', '1990-11-17', '/path/to/profile_pictures/emily_davis.jpg'),
(14,'ryan_clark', 'RyanClark123', 'ryan_clark@gmail.com', 'Ryan', 'Clark', '1996-04-30', '/path/to/profile_pictures/ryan_clark.jpg'),
(15,'sophia_wilson', 'SophiaWilson123', 'sophia_wilson@gmail.com', 'Sophia', 'Wilson', '1999-12-03', '/path/to/profile_pictures/sophia_wilson.jpg'),
(16,'minu_fathima', 'MinuFathima123', 'minu_fathima@gmail.com', 'Minu', 'Fathima', '2007-09-05', '/path/to/profile_pictures/minu_fathima.jpg'),
(17,'akash_kuttan', 'AkashKuttan123', 'akash_kuttan@gmail.com', 'Akash', 'Kuttan', '2005-03-28', '/path/to/profile_pictures/akash_kuttan.jpg'),
(18,'srujani_swes', 'SrujaniSwes123', 'srujani_swes@gmail.com', 'Srujani', 'Swes', '2004-12-15', '/path/to/profile_pictures/srujani_swes.jpg');

-- Insertion of sample data into User_Favorite_Artwork table
INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 4),
(4, 6),
(5, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(9, 1),
(10, 1),
(10, 2),
(11, 3),
(11, 3),
(12, 4),
(12, 6),
(13, 7),
(13, 4),
(14, 5),
(14, 10),
(15, 6),
(15, 11),
(16, 7),
(16, 8),
(17, 9),
(17, 12),
(18, 10),
(18, 13);
SELECT * FROM artwork_gallery;
-- Insertion of sample data into gallery table
INSERT INTO Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours)
VALUES
  (1, 'Louvre Museum', 'One of the world\'s largest and most famous museums, known for its vast collection of artworks, including the Mona Lisa.', 'Paris, France', 1, 'Daily: 9:00 AM - 6:00 PM (Closed Tuesdays)'),
  (2, 'Metropolitan Museum of Art', 'One of the largest and finest art museums in the world, known for its encyclopedic collection from all cultures and time periods.', 'New York City, USA', 3, 'Daily: 10:00 AM - 5:00 PM (Closed Tuesdays)'),
  (3, 'Van Gogh Museum', 'The world\'s largest collection of artworks by Vincent van Gogh, including The Starry Night.', 'Amsterdam, Netherlands', 2, 'Daily: 9:00 AM - 6:00 PM'),
  (4, 'Uffizi Gallery', 'A prominent art museum in Florence, Italy, known for its collection of Renaissance paintings.', 'Florence, Italy', 4, 'Tuesday-Sunday: 8:15 AM - 6:30 PM (Closed Mondays)'),
  (5, 'National Gallery of Modern Art', 'Premier art museum in India, showcasing modern and contemporary Indian art.', 'New Delhi, India', 9, 'Daily: 10:00 AM - 5:00 PM (Closed Mondays)'),
  (6, 'Museum of Modern Art (MoMA)', 'Museum dedicated to modern and contemporary art, showcasing works by Picasso, van Gogh, and others.', 'New York City, USA', 5, 'Daily: 10:30 AM - 5:30 PM (Closed Tuesdays)'),
  (7, 'Rijksmuseum', 'National museum of the Netherlands, housing a vast collection of Dutch Golden Age art, including Rembrandt\'s Night Watch.', 'Amsterdam, Netherlands', 6, 'Daily: 9:00 AM - 5:00 PM'),
  (8, 'State Hermitage Museum', 'One of the largest and oldest museums in the world, known for its collection of Western European art masterpieces.', 'Saint Petersburg, Russia', 7, 'Daily: 10:30 AM - 6:00 PM (Closed Mondays)'),
  (9, 'National Gallery, London', 'Nation gallery in England housing a vast collection of Western European paintings from the 13th to the 19th centuries.', 'London, United Kingdom', 8, 'Daily: 10:00 AM - 6:00 PM (Closed Fridays)'),
  (10, 'Art Institute of Chicago', 'Major museum in Chicago known for its collection of Impressionist, Post-Impressionist, and American art.', 'Chicago, Illinois, USA', 10, 'Thursday-Tuesday: 11:00 AM - 5:00 PM, Wednesday: 11:00 AM - 8:00 PM'),
  (11, 'The Dali Museum', 'Museum dedicated to the works of Salvador Dalí, showcasing his surrealist masterpieces.', 'Figueres, Spain', 10, 'Daily: 9:00 AM - 7:00 PM (Closed Mondays)'),
  (12, 'Museo Nacional del Prado', 'Spain\'s national museum of art, showcasing Spanish and European art from the 14th to the 19th centuries.', 'Madrid, Spain', 3, 'Daily: 10:00 AM - 8:00 PM (Closed Mondays)'),
  (13, 'National Museum of China', 'Largest national museum in China, housing a vast collection of Chinese art and artifacts.', 'Beijing, China', 8, 'Daily: 9:00 AM - 5:00 PM (Closed Mondays)'),
  (14, 'Victoria and Albert Museum', 'World\'s largest museum of decorative arts and design, showcasing a vast collection from all over the world.', 'London, United Kingdom', 9, 'Daily: 10:00 AM - 5:30 PM (Closed Fridays)'),
  (15, 'The Getty Center', 'Art museum showcasing European, Asian, and American art from various periods.', 'Los Angeles, California, USA', 1, 'Tuesday-Sunday: 10:00 AM - 5:30 PM (Closed Mondays)');


-- Insertion of sample data into Artwork_Gallery table
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID) VALUES
(1, 1),
(10, 1),
(3, 2),
(9, 2),
(2, 3),
(8, 3),
(4, 4),
(9, 5),
(5, 6),
(12, 6),
(6, 7),
(14, 7),
(11, 8),
(13, 9),
(7, 10),
(7, 11),
(3, 12),
(9, 12),
(13, 13),
(6, 14),
(1, 15),
(10, 15);

SHOW tables;

-- Retrieve all artworks by a specific artist:
select * from artwork where ArtistID = 1;

-- Retrieve all artworks created after a certain date:
SELECT * FROM artwork where CreationDate > '1600-01-01';

-- Retrieve the favorite artworks of a specific user:
SELECT * FROM artwork a 
join user_favorite_artwork fav on a.ArtworkID = fav.ArtworkID
WHERE fav.UserID = 3;

-- Retrieve the users who likes specific artwork:
select * from user u
join user_favorite_artwork f on u.UserID = f.UserID
WHERE f.ArtworkID = 4;

-- Retrieve all galleries curated by specific artists:
select * from gallery where curator = 1;

