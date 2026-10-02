/* Esercizio 1
	Restituire i voti medi degli studenti 
	Campi da visulizzare:
		Nome Completo dello studente
		CF
		Media
*/
SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS NomeCompleto,
    s.CodiceFiscale as CF,
    AVG(v.Voto) AS MediaVoti
FROM Studenti s
JOIN Voti v ON v.StudenteId = s.StudenteId
GROUP BY s.StudenteId, s.Nome, s.Cognome, s.CodiceFiscale;


/*
	Restituire la lista degli studenti iscritti ad un corso SENZA la data di nascita, 
	mostrando:
		Nome completo
		Data di nascita (rinominata)
		Codice Fiscale
		Corso
		Voto
		Docente
		Aula
*/
SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS [NomeCompleto],
    ISNULL(CONVERT(VARCHAR(10), s.DataNascita, 120), 'Non registrata') AS Data_di_Nascita,
    s.CodiceFiscale AS CF,
    c.NomeCorso AS Corso,
    CAST(AVG(v.Voto) AS INT) AS Voto,
    CONCAT(d.Nome, ' ', d.Cognome) AS Docente,
    a.NomeAula AS Aula
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteId = i.StudenteId
JOIN Corsi c 
    ON i.CorsoId = c.CorsoId
JOIN Voti v 
    ON s.StudenteId = v.StudenteId 
    AND c.CorsoId = v.CorsoId
JOIN DocentiCorso dc 
    ON c.CorsoId = dc.CorsoId
JOIN Docenti d 
    ON dc.DocenteId = d.DocenteId
JOIN Lezioni l 
    ON c.CorsoId = l.CorsoId
JOIN Aule a 
    ON l.AulaId = a.AulaId
WHERE s.DataNascita IS NULL
GROUP BY s.Nome, s.Cognome, s.DataNascita, s.CodiceFiscale, c.NomeCorso, d.Nome, d.Cognome, a.NomeAula;

-------------------------------ESERZI TUTTI INSIEME
/*
Obiettivo 1
Mostrare gli studenti che hanno preso un voto maggiore o uguale a 28 in qualsiasi corso.

*/


SELECT
    s.StudenteId,
    CONCAT(s.Nome , ' ' , S.Cognome) AS [Studente NON iscritto],
    s.Email,
    s.Telefono    
    FROM Studenti AS s
    LEFT JOIN Iscrizioni i 
        ON s.StudenteId = i.StudenteId
    LEFT JOIN Corsi AS c
        ON C.CorsoId=I.CorsoId
    --WHERE i.IscrizioneId IS NULL
    WHERE i.StudenteId IS NULL;

    -------OPPURE GIOVANNI
    SELECT	-- 'Studente senza corso' AS Tipo,
		CONCAT(s.Nome, ' ', s.Cognome) AS Nome,
		'CORSO ' + ISNULL(c.NomeCorso, 'N/D') AS Corso		
        FROM Studenti AS s
            LEFT JOIN Iscrizioni AS i
	        ON s.StudenteID = i.StudenteID
            LEFT JOIN Corso AS c
	        ON c.CorsoID = i.CorsoID
            WHERE i.IscrizioneID IS NULL
            /*



*/
/* Esercizi 3
Mostrare i corsi che non hanno studenti iscritti.

CLEVATTE*/
SELECT
    CONCAT(s.Nome, ' ', s.Cognome) AS Nome,
    ISNULL(c.CorsoId, 0) AS ID,
    ISNULL(c.NomeCorso, 'Non definito') AS Corso,
    ISNULL(c.Crediti, 0) AS Crediti,
    ISNULL(c.Durata,0) As Durata
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi AS c
    ON c.CorsoId= i.CorsoId
WHERE i.CorsoId IS NULL;
/*
MOUSSA
*/
SELECT
    CONCAT(s.Nome, ' ', s.Cognome) AS Nome,
    ISNULL(c.CorsoId, 0) AS ID,
    ISNULL(c.NomeCorso, 'Non definito') AS Corso,
    ISNULL(c.Crediti, 0) AS Crediti,
    ISNULL(c.Durata,0) As Durata
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi AS c
    ON c.CorsoId= i.CorsoId
WHERE i.CorsoId IS NULL
ORDER BY S.Nome
/*
******************************************************************************************
Obiettivo 3_2  con Full JOIN 
Mostrare studenti e voti, anche se non corrispondono
NOME
COGNOME
VOTO
*/

SELECT 
    S.Nome,
    S.Cognome,
    --ISNULL(CONVERT(VARCHAR(10), s.DataNascita, 120), 'Non registrata') AS Data_di_Nascita
    --ISNULL(CAST(v.Voto AS INT),'ND') AS [Voto]
       CAST(ISNULL(v.Voto ,0) AS INT ) AS [Voto]
FROM Studenti AS s
FULL OUTER JOIN Voti AS v
 ON s.StudenteId = v.StudenteId
 ORDER BY V.Voto DESC

