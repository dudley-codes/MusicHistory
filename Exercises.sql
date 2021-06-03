-- Step 1
--Query all of the entries in the Genre table
SELECT * FROM Genre;
SELECT * FROM song;
-- Step 2
--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT * FROM artist
ORDER BY ArtistName;
-- Step 3
--Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT s.*,
		a.ArtistName
	FROM Song s
		LEFT JOIN Artist a ON s.ArtistId = a.id;
-- Step 4
--Write a SELECT query that lists all the Artists that have a Pop Album
SELECT ar.ArtistName
	FROM Song s 
	left join Album a 
	ON s.AlbumId = a.id
	left join Artist ar 
	ON ar.id = s.ArtistId
		WHERE s.GenreId = 7;
-- Step 5
--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT	s.Title AS SongTitle,
		a.Title AS AlbumTitle,
		ar.ArtistName,
		g.Name AS Genre
	FROM Song s 
	left join Album a 
	ON s.AlbumId = a.id
	left join Artist ar 
	ON ar.id = s.ArtistId
	left join Genre g
	ON g.id = s.GenreId
		WHERE s.GenreId = 2 
		OR s.GenreId = 4;
-- Step 6
--Write a SELECT statement that lists the Albums with no songs
SELECT	a.Title AS AlbumTitle,
		s.Title AS SongName
	FROM Album a
	left join Song s
	ON s.AlbumId = a.id
	WHERE s.Title IS NULL;
-- Step 7
--Using the INSERT statement, add one of your favorite artists to the Artist table.
SELECT * FROM Artist;
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Dropkick Murphys', 1996)
-- Step 8
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
SELECT * FROM Album;
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Warrior`s Code', '6/1/2005', 2200, 'Boston', 29, 2);
-- Step 9
--Using the INSERT statement, add some songs that are on that album to the Song table.
SELECT * FROM Song;
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Wicked Sensitive Crew', 666, '6/6/1999', 2, 29, 24);
-- Step 10
-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT	s.Title AS SongTitle,
		a.Title AS AlbumTitle,
		ar.ArtistName,
		g.Name AS Genre
	FROM Song s 
	left join Album a 
	ON s.AlbumId = a.id
	left join Artist ar 
	ON ar.id = s.ArtistId
	left join Genre g
	ON g.id = s.GenreId
		WHERE a.Title = 'Warrior`s Code';
-- Step 11
--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT	COUNT(s.Title) AS SongCount,
		a.Title
		FROM Song s
		left join Album a
		ON a.Id = s.AlbumId
		GROUP BY a.Title
-- Step 12
--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(s.Title) AS SongCount,
		a.ArtistName
		FROM Song s
		left join Artist a
		ON a.Id = s.ArtistId
		GROUP BY a.ArtistName
-- Step 13
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(s.Title) AS SongCount,
		g.Name AS Genre
		FROM Song s
		left join Genre g
		ON g.Id = s.GenreId
		GROUP BY g.Name
-- Step 14
-- Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT	a.ArtistName,
		count(label) AS LabelCount
FROM Album al
left join Artist a
ON a.Id = al.ArtistId
GROUP BY a.ArtistName
HAVING COUNT(a.ArtistName) > 1;