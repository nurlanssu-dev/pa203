CREATE DATABASE CinemaClubDB

CREATE TABLE Movies
(
MovieID INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(150) NOT NULL,
ReleaseYear  INT,
Rating DECIMAL (3,1),
Duration INT,
Status NVARCHAR(50)
);

CREATE TABLE MovieDetails
(
MovieID INT PRIMARY KEY IDENTITY (1,1),
FOREIGN KEY (MovieID)
REFERENCES Movies(MovieID),
Budget DECIMAL(15,2),
Country NVARCHAR(100),
Language NVARCHAR(50),
Description NVARCHAR(MAX)
);

CREATE TABLE Genres
(
GenreID  INT PRIMARY KEY IDENTITY (1,1),
GenreName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE MovieGenres
(
MovieID INT,
GenreID INT,
FOREIGN KEY (MovieID)
REFERENCES Movies(MovieID),
FOREIGN KEY (GenreID)
REFERENCES GenreS(GenreID)
);

CREATE TABLE Actors
(
ActorID INT PRIMARY KEY IDENTITY (1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
BirthDate DATE
);

CREATE TABLE MovieActors
(
MovieID INT,
ActorID INT,
FOREIGN KEY (MovieID)
REFERENCES Movies(MovieID),
FOREIGN KEY (ActorID)
REFERENCES Actors(ActorID)
);

CREATE TABLE Halls
(
HallID INT PRIMARY KEY IDENTITY (1,1),
HallName NVARCHAR(50) NOT NULL,
Capacity INT NOT NULL
);

CREATE TABLE Sessions
(
SessionID INT PRIMARY KEY IDENTITY (1,1),
MovieID INT,
HallID  INT,
StartTime DATETIME NOT NULL,
Status NVARCHAR(50),
FOREIGN KEY (MovieID)
REFERENCES Movies(MovieID),
FOREIGN KEY (HallID)
REFERENCES Halls(HallID)
);

CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY IDENTITY (1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email NVARCHAR(100),
Phone NVARCHAR(20),
City NVARCHAR(50)
);

CREATE TABLE CustomerCards
(
CustomerID INT PRIMARY KEY IDENTITY (1,1),
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID),
CardNumber NVARCHAR(20) NOT NULL UNIQUE,
BonusPoints INT DEFAULT 0,
Status NVARCHAR(20)
);

CREATE TABLE Tickets
(
TicketID INT PRIMARY KEY IDENTITY (1,1),
SessionID INT,
CustomerID INT,
FOREIGN KEY (SessionID)
REFERENCES Sessions(SessionID),
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID),
SeatNumber NVARCHAR(10) NOT NULL,
Price DECIMAL(10,2),
PurchaseDate DATETIME DEFAULT GETDATE()
);



-- =========================================
-- MOVIES
-- =========================================

INSERT INTO Movies (Title, ReleaseYear, Rating, Duration, Status)
VALUES
(N'Interstellar', 2014, 8.7, 169, N'Active'),
(N'Inception', 2010, 8.8, 148, N'Active'),
(N'Titanic', 1997, 7.9, 194, N'Active'),
(N'Joker', 2019, 8.4, 122, N'Active'),
(N'Avengers: Endgame', 2019, 8.4, 181, N'Active');


-- =========================================
-- MOVIE DETAILS
-- =========================================

INSERT INTO MovieDetails (Budget, Country, Language, Description)
VALUES
(165000000, N'USA', N'English', N'A science fiction movie about space and time.'),
(160000000, N'USA', N'English', N'A movie about dreams and the subconscious mind.'),
(200000000, N'USA', N'English', N'A romantic drama based on the Titanic disaster.'),
(55000000, N'USA', N'English', N'A psychological drama about Arthur Fleck.'),
(356000000, N'USA', N'English', N'The Avengers fight against Thanos.');


-- =========================================
-- GENRES
-- =========================================

INSERT INTO Genres (GenreName)
VALUES
(N'Sci-Fi'),
(N'Drama'),
(N'Action'),
(N'Romance'),
(N'Thriller'),
(N'Adventure');


-- =========================================
-- MOVIE GENRES
-- =========================================

INSERT INTO MovieGenres (MovieID, GenreID)
VALUES
-- Interstellar
(1, 1),
(1, 2),
(1, 6),

-- Inception
(2, 1),
(2, 3),
(2, 5),

-- Titanic
(3, 2),
(3, 4),

-- Joker
(4, 2),
(4, 5),

-- Avengers
(5, 3),
(5, 1),
(5, 6);


-- =========================================
-- ACTORS
-- =========================================

INSERT INTO Actors (FirstName, LastName, BirthDate)
VALUES
(N'Matthew', N'McConaughey', '1969-11-04'),
(N'Anne', N'Hathaway', '1982-11-12'),
(N'Leonardo', N'DiCaprio', '1974-11-11'),
(N'Kate', N'Winslet', '1975-10-05'),
(N'Joaquin', N'Phoenix', '1974-10-28'),
(N'Robert', N'Downey Jr.', '1965-04-04'),
(N'Chris', N'Evans', '1981-06-13'),
(N'Scarlett', N'Johansson', '1984-11-22');


-- =========================================
-- MOVIE ACTORS
-- =========================================

INSERT INTO MovieActors (MovieID, ActorID)
VALUES
-- Interstellar
(1, 1),
(1, 2),

-- Inception
(2, 3),

-- Titanic
(3, 3),
(3, 4),

-- Joker
(4, 5),

-- Avengers Endgame
(5, 6),
(5, 7),
(5, 8);


-- =========================================
-- HALLS
-- =========================================

INSERT INTO Halls (HallName, Capacity)
VALUES
(N'Hall 1', 100),
(N'Hall 2', 150),
(N'VIP Hall', 50),
(N'IMAX Hall', 200);


-- =========================================
-- SESSIONS
-- =========================================

INSERT INTO Sessions (MovieID, HallID, StartTime, Status)
VALUES
(1, 4, '2026-09-05 18:00:00', N'Available'),
(2, 1, '2026-09-05 20:00:00', N'Available'),
(3, 2, '2026-09-06 17:00:00', N'Available'),
(4, 3, '2026-09-06 21:00:00', N'Available'),
(5, 4, '2026-09-07 19:30:00', N'Available'),
(1, 2, '2026-09-07 22:00:00', N'Available');


-- =========================================
-- CUSTOMERS
-- =========================================

INSERT INTO Customers (FirstName, LastName, Email, Phone, City)
VALUES
(N'Nurlan', N'Aliyev', N'nurlan@gmail.com', N'0501112233', N'Baku'),
(N'Aysel', N'Mammadova', N'aysel@gmail.com', N'0502223344', N'Baku'),
(N'Elvin', N'Hasanov', N'elvin@gmail.com', N'0513334455', N'Ganja'),
(N'Leyla', N'Karimova', N'leyla@gmail.com', N'0554445566', N'Baku'),
(N'Murad', N'Quliyev', N'murad@gmail.com', N'0705556677', N'Sumgayit');


-- =========================================
-- CUSTOMER CARDS
-- =========================================

INSERT INTO CustomerCards (CardNumber, BonusPoints, Status)
VALUES
(N'CARD10001', 120, N'Active'),
(N'CARD10002', 75, N'Active'),
(N'CARD10003', 30, N'Active'),
(N'CARD10004', 200, N'Active'),
(N'CARD10005', 0, N'Active');


-- =========================================
-- TICKETS
-- =========================================

INSERT INTO Tickets
(SessionID, CustomerID, SeatNumber, Price, PurchaseDate)
VALUES
(1, 1, N'A10', 15.00, GETDATE()),
(1, 2, N'A11', 15.00, GETDATE()),
(2, 3, N'B05', 12.00, GETDATE()),
(3, 1, N'C07', 10.00, GETDATE()),
(4, 4, N'VIP01', 25.00, GETDATE()),
(5, 5, N'D12', 18.00, GETDATE()),
(5, 2, N'D13', 18.00, GETDATE()),
(6, 3, N'E05', 14.00, GETDATE());

SELECT * FROM Tickets
SELECT Title, Rating
FROM Movies 
WHERE ReleaseYear > 2010;

SELECT * FROM Customers
WHERE FirstName LIKE '%A%'
ORDER BY LastName ASC;

SELECT * FROM Movies
WHERE Rating BETWEEN 8 AND 9.5;

SELECT TOP 5 *
FROM Movies
WHERE Duration > 150
ORDER BY Rating DESC;

SELECT *
FROM Tickets
WHERE Price IS NULL;

SELECT * FROM Customers 
WHERE Email LIKE '%gmail.com'

SELECT * FROM Sessions
WHERE StartTime = GETDATE()

SELECT * FROM Movies
ORDER BY ReleaseYear ASC, Rating DESC, Duration DESC;

SELECT DISTINCT Price
FROM Tickets
WHERE Price IN (10, 12, 15);
 
SELECT FirstName, LastName
FROM Actors
WHERE YEAR(BirthDate) < 1980;

UPDATE Movies
SET Status = N'Arxiv'
WHERE Rating<8

SELECT * FROM Customers
WHERE Phone= NULL

UPDATE Tickets
SET Price = Price + 1.00
WHERE Price<15

SELECT SessionID
FROM Sessions
WHERE Status = 'Cancelled'

DELETE FROM Tickets
WHERE SessionID IN
(
SELECT SessionID
FROM Sessions
WHERE Status = 'Cancelled'
)

UPDATE CustomerCards
SET Status = N'Deaktiv'
WHERE BonusPoints=0

SELECT AVG(Rating) ORTAREYTING
FROM Movies

SELECT COUNT(CustomerID) CustomersCOUNT
FROM Customers

SELECT SUM(Price) TOTALPrice
FROM Tickets

SELECT MAX(Price) MAXPrice 
FROM Tickets

SELECT MIN(Duration) MINDuration
FROM Movies

SELECT COUNT(Email) AS EmailiOlanlar
FROM Customers;

SELECT  SUM(Price) - MAX(Price)
FROM Tickets

SELECT Movies.Title, MovieDetails.Budget
FROM Movies
JOIN MovieDetails
ON Movies.MovieID=MovieDetails.MovieID

SELECT Customers.FirstName, Customers.LastName, CustomerCards.BonusPoints
FROM Customers
INNER JOIN CustomerCards
ON Customers.CustomerID=CustomerCards.CustomerID

