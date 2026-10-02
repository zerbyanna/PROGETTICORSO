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

