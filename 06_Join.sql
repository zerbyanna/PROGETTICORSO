/*
    
    JOIN — PERCHÉ SERVE?
    LEFT JOIN  - RECUPERA PARTE DEI CAMPI (anche NULL) a PARTIRE DA SX
    RIGHT JOIN - RECUPERA PARTE DEI CAMPI (anche NULL) a PARTIRE DA DX
    FULL JOIN

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

    Studenti
       |
       ↓
    Iscrizioni
       |
       ↓
    Corsi

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.
    --------------------------------------------------------------------------------------
    SINTASSI BASE PER LA JOIN\INNER JOIN

    SELECT  
        Colonne
        ...
    FROM Tabella1 as t1
    INNER JOIN Tabella2 as t2

    SELECT 
        t1.colonne1
        t1.colonne2
        t1.colonna3
        t2.colonna1
        ...
    FROM tabella1 as t1
    INNER JOIN tabella2 as t2
        ON condizione



*/
-- Restituire la lista degli studenti iscritti
SELECT * FROM Studenti;
SELECT * FROM Iscrizioni;

SELECT *
    FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId;

SELECT 
        s.Nome + ' ' + s.Cognome AS [Nome Completo],
        s.DataNascita AS [Data di nascita],
        s.CodiceFiscale AS CF,
        i.DataIscrizione AS [Data Iscrizione]
    FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId;

--esempio 2
--restituire la lista degli studenti iscritti a un corso
SELECT * FROM Studenti;
SELECT * FROM Iscrizioni;
SELECT * FROM Corsi;

 SELECT 
        s.Nome + ' ' + s.Cognome AS [Nome Completo],
        s.DataNascita AS [Data di nascita],
        s.CodiceFiscale AS CF,
        i.DataIscrizione AS [Data Iscrizione],
        c.NomeCorso + ' - ' + c.Descrizione AS [Corso],
        c.Durata
    FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId
    INNER JOIN Corsi AS c
        ON i.CorsoId=c.CorsoId;

        SELECT * FROM Corsi;
---ESEMPIO 3 
--restituire la lista degli studenti iscritti a un corso CON DATA NASCITA NULL
    SELECT 
        s.Nome + ' ' + s.Cognome AS [Nome Completo],
        s.DataNascita AS [Data di nascita],
        s.CodiceFiscale AS CF,
        i.DataIscrizione AS [Data Iscrizione],
        c.NomeCorso + ' - ' + c.Descrizione AS [Corso],
        c.Durata
    FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId
    INNER JOIN Corsi AS c
        ON i.CorsoId=c.CorsoId
    WHERE s.DataNascita IS NULL;
/*    ---ESEMPIO 4
    --
SELECT * FROM Voti;
SELECT * FROM Aule;
SELECT * FROM Corsi;
SELECT * FROM DocentiCorso;
SELECT * FROM Lezioni;




  
    SELECT * FROM Studenti;
    SELECT * FROM Iscrizioni; -c -s
    SELECT * FROM Corsi;
    SELECT * FROM DocentiCorso;
    SELECT * FROM Docenti;
    SELECT * FROM Lezioni;
    SELECT * FROM Aule;




DOCENTI CORSI AULE LEZIONI
LEZIONI <-> AULE<- CORSI
ISCRIZIONI<-> STUDENTI <- CORSI
DOCENTICORSI<-> DOCENTI

*/

/*
    SELECT * FROM Studenti;
    SELECT * FROM Iscrizioni; -c -s
    SELECT * FROM Corsi;
    SELECT * FROM DocentiCorso;
    SELECT * FROM Docenti;
    SELECT * FROM Lezioni;
    SELECT * FROM Aule;

*/

    SELECT 
        s.Nome + ' ' + s.Cognome AS [Nome Completo],
        c.NomeCorso + ' - ' + c.Descrizione AS [Corso],
        s.DataNascita AS [Data di nascita],
        s.CodiceFiscale AS CF,
        i.DataIscrizione AS [Data Iscrizione],
        c.Durata
    FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId
    INNER JOIN Corsi AS c
        ON c.CorsoId=i.CorsoId
    INNER JOIN DocentiCorso AS dc
        ON dc.CorsoId=c.CorsoId
    INNER JOIN Docenti AS d
        ON d.DocenteId=dc.DocenteId
    INNER JOIN Lezioni AS l
        ON l.CorsoId=c.CorsoId
    INNER JOIN Aule AS a
        ON a.AulaId=l.AulaId
    WHERE s.DataNascita IS NULL;

    --visualizza tutti i campi
    SELECT *
        FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId
    INNER JOIN Corsi AS c
        ON c.CorsoId=i.CorsoId
    INNER JOIN DocentiCorso AS dc
        ON dc.CorsoId=c.CorsoId
    INNER JOIN Docenti AS d
        ON d.DocenteId=dc.DocenteId
    INNER JOIN Lezioni AS l
        ON l.CorsoId=c.CorsoId
    INNER JOIN Aule AS a
        ON a.AulaId=l.AulaId;


-- visualizza solo i campi nome studente ,corso ,aula,nome docente
    SELECT 
        s.Nome + ' ' + s.Cognome AS [Nome Studente],
        s.DataNascita AS [Data di nascita],
        s.CodiceFiscale AS CF,
        i.DataIscrizione AS [Data Iscrizione],
        c.NomeCorso + ' - ' + c.Descrizione AS [Corso],
        c.Durata,
        d.Nome + ' ' + d.Cognome AS [Nome Docente],
        d.Specializzazione,
        a.NomeAula AS [Nome Aula],
        a.Capacita AS [Capacità]
    FROM Studenti AS s
    INNER JOIN Iscrizioni AS i
        ON s.StudenteId=i.StudenteId
    INNER JOIN Corsi AS c
        ON c.CorsoId=i.CorsoId
    INNER JOIN DocentiCorso AS dc
        ON dc.CorsoId=c.CorsoId
    INNER JOIN Docenti AS d
        ON d.DocenteId=dc.DocenteId
    INNER JOIN Lezioni AS l
        ON l.CorsoId=c.CorsoId
    INNER JOIN Aule AS a
        ON a.AulaId=l.AulaId;

----------------------------------------------------

-------------MOUSSA 28/09/26-----------------------
/*

	JOIN / INNER JOIN 
    
    Serve per  unire 2 o + tabelle

    JOIN
	LEFT JOIN <- Parte da sinistra 
	RIGHT JOIN<- Parte da Destra
	FULL JOUIN 
	_________________________
	JOIN — PERCHÉ SERVE?

	Fino a questo punto abbiamo lavorato principalmente con una tabella.

	Ma un database relazionale è composto da più tabelle collegate tra loro.

	Nel nostro database "ScuolaDb" abbiamo, per esempio:

	Studenti
	   |
	   ↓
	Iscrizioni
	   |
	   ↓
	Corsi

	Uno studente può essere iscritto a un corso.

	Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.
	_____________________________


	Sitassi base della JOIN / INNER JOIN 
	unisce 2 tabella che hanno qualcosa in comune 

	Select
		t1.colonne1
		t1.colonne2
		t1.colonne3
		t2.colonne1
		....
	From tabella1 as t1
	Inner join tabella2 as t2
		ON Condizione (t1.id = t2.Id) -> 

        EQUIVALE A
        IF <condizione>
            THEN print(t1.colonne1
		               t1.colonne2
		               t1.colonne3
		               t2.colonne1)
            ELSE
*/

-- Restituire la lista degli studenti scritti
SELECT * FROM Studenti, Iscrizioni; -- da non fare⚠️⚠️⚠️

-- Nome completo
-- Data Nascita
-- Codice fiscale
-- Data Iscrizione

SELECT 
	s.Nome + ' ' + s.Cognome as [Nome Completo],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione]
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId;



-- Esempio 2:
-- Restituisce la lista degli studenti iscritti ad un corso.
SELECT 
	s.Nome + ' ' + s.Cognome as [Nome Completo],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione],
	c.NomeCorso + ' - ' + c.Descrizione as [Corso],
	c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
	On i.CorsoId = c.CorsoId;


-- Esempio 3:
-- Restituisce la lista degli studenti iscritti ad un corso con la data di nascita null.
SELECT 
	s.Nome + ' ' + s.Cognome as [Nome Completo],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione],
	c.NomeCorso + ' - ' + c.Descrizione as [Corso],
	c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
	On i.CorsoId = c.CorsoId
Where s.DataNascita is null;


/*
	Docenti, Corsi, Aule Lezioni
	Lezioni <-> Aule <-Corsi
	Iscrizioni <-> Studenti <- Corsi
	DocentiCorsi <- Docenti

	Restituire:
		il nome dello studente,
		il corso,
		l'aula
		Docente,
		lezione
*/
Select * from Studenti;
Select * from Iscrizioni; 
Select * from Corsi;
Select * from DocentiCorso;
Select * from Docenti;
Select * from Lezioni;
Select * from Aule;




SELECT DISTINCT 
	s.Nome + ' ' + s.Cognome as [Nome Studente],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione],
	c.NomeCorso + ' - ' + c.Descrizione as [Corso],
	c.Durata,
	d.Nome + ' ' + d.Cognome as [Nome Docente],
	d.Specializzazione,
	a.NomeAula as [Nome Aula],
	a.Capacita as Capacità
FROM Studenti as s
JOIN Iscrizioni as i
	ON s.StudenteId = i.StudenteId
JOIN Corsi as c
	ON c.CorsoId = i.CorsoId
JOIN DocentiCorso as dc
	ON dc.CorsoId = c.CorsoId
JOIN Docenti as d
	ON d.DocenteId = dc.DocenteId
JOIN Lezioni as l
	ON c.CorsoId = l.CorsoId
JOIN Aule as a
	ON a.AulaId = l.AulaId;
-----------------------------FINE MOUSSA 28/09/26------------

---------------------------29/09/26
--prendo i primi 10 studenti nati dal 2000 e lo unisco alla tabella iscrizioni
--vedo le iscrizioni degli studenti

-----------------LEFT JOIN 
--MOSTRA I DATI ANCHE SE NON ESISTE CORRISPONDENZA TRA I CAMPI DI UNIONE TRA LE DUE TABELLE
/*   
    LEFT JOIN 
        Mostra i record della tabella sinistra 
        anche se non esiste corristpondenza
        nella tabella destra.
*/
SELECT TOP 10 *
FROM Studenti as s
INNER JOIN Iscrizioni i
    ON i.StudenteId = s.StudenteId
WHERE DataNascita IS NOT NULL
    AND DataNascita >= '2000'
ORDER BY DataNascita asc;
-------------------------------------------------------
SELECT TOP 10 *
FROM Studenti as s
JOIN Iscrizioni i
    ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
    ON i.CorsoId = c.CorsoId    
WHERE DataNascita IS NOT NULL
    AND DataNascita <> '2000'
ORDER BY DataNascita asc;
-------------------------------------------------------
--MOSTRA TUTTI GLI STUDENTI CHE NON SI SONO ISCRITTI

-- Restituisce le lista degli studenti non scritti
SELECT 
    s.Nome , 
    s.Cognome,
    s.DataNascita,
    s.CodiceFiscale,
    s.Email,
    s.Telefono,
    i.DataIscrizione,
    c.NomeCorso,
    c.Descrizione,
    c.Crediti,
    c.Durata
FROM Studenti s 
LEFT JOIN Iscrizioni i
    On i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
    On i.CorsoId = c.CorsoId;


------------------------------
-- Restituisce le lista degli studenti non scritti
--controllo la DATA NASCITA e quella NULL SCRIVO n/d


--------funzione CONVERT()--------- 
--converte un valore in un altro tipo
---CONVERT ( data_type [ ( length ) ] , expression [ , style ] )
--funzione ISNULL() definisce il valore default in caso di valore NULL campo

--ISNULL()--> CONVERTE QUALSIASI DATO NULL IN UN VALORE DEFAULT 
--ISNULL(espressione, valore_alternativo)



SELECT
    Nome,
    Cognome,
    ISNULL(CONVERT(VARCHAR,DataNascita, 105),'n/d') AS DataNascita
    FROM Studenti
    WHERE DataNascita IS NULL;

    ---------------------esercizo ----------



SELECT 
    ISNULL(s.Nome + ' ' +s.Cognome,'n/d') AS [Nome Studente],
    ISNULL(CONVERT(VARCHAR,s.DataNascita, 105),'n/d') AS [Data Nascita],
    ISNULL(s.CodiceFiscale,'n/d') AS [Codice Fiscale],
    ISNULL(s.Email,'n/d') AS [Email],
    ISNULL(s.Telefono,'n/d') AS [Telefono],
    ISNULL(CONVERT(VARCHAR,i.DataIscrizione, 105),'n/d') AS [Data Iscrizione],
    ISNULL(c.NomeCorso,'n/d') AS [Nome Corso],
    ISNULL(c.Descrizione,'n/d') AS [Descrizione Corso],
    ISNULL(CONVERT(NVARCHAR,c.Crediti,255),'n/d') AS [Crediti],
    --ISNULL(c.Crediti,0) AS [Crediti]
    ISNULL(CONVERT(NVARCHAR,c.Durata,255),'n/d') AS [Durata]
    --ISNULL(c.Durata,0) AS [Durata]
FROM Studenti s 
LEFT JOIN Iscrizioni i
    On i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
    On i.CorsoId = c.CorsoId;

-------------------------------
--FUNZIONI DI STRINGA------

SELECT * FROM Lezioni;

SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    OraInizio,
    OraFine
    FROM Lezioni;

--SOLO 
SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2),'NON DEFINITA') AS [ORA INIZIO],
    ISNULL(LEFT(CONVERT(VARCHAR,OraFine, 108), 2),'NON DEFINITA') AS [ORA FINE]
    FROM Lezioni;


--CONVERT 108 09:00 0000000 ->09:00

SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    ISNULL(RIGHT(CONVERT(VARCHAR,OraInizio, 108), 2),'NON DEFINITA') AS [ORA INIZIO],
    ISNULL(RIGHT(CONVERT(VARCHAR,OraFine, 108), 2),'NON DEFINITA') AS [ORA FINE],
    FROM Lezioni;
----------------------
SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    OraInizio,
    OraFine,
    ISNULL(RIGHT(CONVERT(VARCHAR,OraInizio, 108), 2),'NON DEFINITA') AS [ORA INIZIO],
    ISNULL(RIGHT(CONVERT(VARCHAR,OraFine, 108), 2),'NON DEFINITA') AS [ORA FINE],
    DATEPART(HOUR,OraInizio) AS [ORE INIZIO],
    DATEPART(MINUTE,OraInizio) AS [MINUTI INZIO]
    FROM Lezioni;

---------------
SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    ISNULL(CONVERT(VARCHAR,OraInizio, 108),'NON DEFINITA') AS [ORA INIZIO],
    RIGHT('0' + CAST(DATEPART(MINUTE,OraInizio) AS nvarchar(2)),2) AS minuti
FROM Lezioni
-----
SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    'la lezione inzia all '+
   CAST(DATEPART(HOUR,OraInizio) AS nvarchar(2)) +':'+
    RIGHT('0' + CAST(DATEPART(MINUTE,OraInizio) AS nvarchar(2)),2) AS [ORARIO INIZIO LEZIONE]
FROM Lezioni;

----------------------
SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    OraInizio,
    OraFine,
    ISNULL(CONVERT(VARCHAR,OraInizio, 108),'NON DEFINITA') AS [ORA INIZIO],
    ISNULL(CONVERT(VARCHAR,OraFine, 108),'NON DEFINITA') AS [ORA FINE]
FROM Lezioni;

SELECT
    Titolo + ' ' + Descrizione AS [MATERIA],
    OraInizio,
    OraFine,
    ISNULL(CONVERT(VARCHAR(5),OraInizio, 108),'NON DEFINITA') AS [ORA INIZIO],
    ISNULL(CONVERT(VARCHAR(5),OraFine, 108),'NON DEFINITA') AS [ORA FINE]
FROM Lezioni

-------
--^^^^^^^^^^^^^^^^^^^^^^^^^^
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


--^^^^^^^^^^^^^^^^^^^^^^^^^^^
SELECT 
    Titolo + ' ' + Descrizione AS [MATERIA],
    OraInizio,
    OraFine,
    DATEPART(HOUR,OraInizio) AS [ORA INIZIO],
    DATEPART(MINUTE,OraInizio) AS [MINUTI INIZIO],
    DATEPART(SECOND,OraInizio) AS [SECONDI INIZIO]
FROM Lezioni

