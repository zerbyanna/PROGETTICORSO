CREATE PROCEDURE sp_Studenti_Scritti
AS
	BEGIN
		SELECT *
		FROM Studenti AS s
		INNER JOIN Iscrizioni AS i
		ON s.StudenteId=i.StudenteId;
	END
GO