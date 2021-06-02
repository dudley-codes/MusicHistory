-- Step 1
SELECT * FROM Genre;
SELECT * FROM song;
-- Step 2
SELECT * FROM artist
ORDER BY ArtistName;
-- Step 3
SELECT s.*,
		a.ArtistName
	FROM Song s
		LEFT JOIN Artist a ON s.ArtistId = a.id;
-- Step 4
SELECT ar.ArtistName
	FROM Song s 
	left join Album a 
	ON s.AlbumId = a.id
	left join Artist ar 
	ON ar.id = s.ArtistId
		WHERE s.GenreId = 7;
-- Step 5
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
SELECT	a.Title AS AlbumTitle,
		s.Title AS SongName
	FROM Album a
	left join Song s
	ON s.AlbumId = a.id
	WHERE s.Title IS NULL;
-- Step 7
SELECT * FROM Artist;
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Dropkick Murphys', 1996)
-- Step 8
SELECT * FROM Album;
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Warrior`s Code', '6/1/2005', 2200, 'Boston', 29, 2);


