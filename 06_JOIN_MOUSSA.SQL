USE ScuolaDb;
GO
-- Restituisce le lista degli studenti non scritti
SELECT 
    ISNULL(s.Nome + ' ' + s.Cognome, 'Studente non asseganto') AS Studente,
    ISNULL(CONVERT(VARCHAR, s.DataNascita, 105), 'N/D') AS [Data di Nascita],
    ISNULL(s.CodiceFiscale, 'CF00000') AS [CF],
    ISNULL(s.Email, 'Email non definita') AS Email,
    ISNULL(s.Telefono, '000000') AS Telefono,
    ISNULL(CONVERT(VARCHAR, i.DataIscrizione, 105), 'N/D'),
    ISNULL(c.NomeCorso, 'Non definito') AS [Nome Corso],
    ISNULL(c.Descrizione, 'Non definita') AS Descrizione,
    ISNULL(c.Crediti, 0) AS Crediti,
    ISNULL(c.Durata, 0)
FROM Studenti s 
LEFT JOIN Iscrizioni i
    On i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
    On i.CorsoId = c.CorsoId
--------------------------------------------------------------------------------------------
-- Le funzione ISNULL() restituisce valore specifito se l'espressione è null
-- Convert()
SELECT 
    Nome,
    Cognome,
    ISNULL(CONVERT(VARCHAR, DataNascita, 104), 'N/D') AS DataNascita 
FROM Studenti
where DataNascita is null;
SELECT 
    Nome,
    Cognome,
    DataNascita 
FROM Studenti
where DataNascita is null;
SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    --ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 2), 'N/D') as Ora,
    ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'N/D') as Minuti,
    ISNULL(DATEPART(HOUR, OraInizio), 2) AS Ora,
    DATEPART(MINUTE, OraInizio) AS Minuti
FROM Lezioni;
SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    'la lezione inizia alle ' +
    CAST(DATEPART(HOUR, OraInizio) AS nvarchar(2)) + ':' + 
    RIGHT('0' + CAST(DATEPART(MINUTE, OraInizio) as nvarchar(2)), 2 ) as Orario
FROM Lezioni;
-- 108 => 09:00
SELECT
    Titolo + ' ' + Descrizione AS [Materia],
    'la lezione inizia alle ' +
    ISNULL(CONVERT(VARCHAR(5), OraInizio, 108), 'N/D') AS Ora
FROM Lezioni;