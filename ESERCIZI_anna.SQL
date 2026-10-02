/*
 ES1
 RESTITUIRE LA MEDIA DEL VOTO DEGLI STUDENTI
 NOME 
 CF
 VOTO
 */
SELECT 
    st.Nome + ' ' + st.Cognome AS Studente,
    st.CodiceFiscale AS CF,
    ISNULL(CONVERT(VARCHAR,i.DataIscrizione, 105),'Data non definita') AS [Data Iscrizione]
    FROM Studenti AS st
    RIGHT JOIN Iscrizioni AS i
        ON i.StudenteId=st.StudenteId;

-------------------------------------------------------------
SELECT * FROM Voti
SELECT * FROM Studenti





--------------------------------------------------
SELECT 
    st.Nome + ' ' + st.Cognome AS [NOME COMPLETO],
    st.Cognome,
    st.CodiceFiscale AS [CF],
    AVG(v.voto) AS [VOTO MEDIO]
    FROM Studenti AS st
    JOIN Voti AS v
       ON v.StudenteId=st.StudenteId
       GROUP BY st.Nome,st.Cognome,st.CodiceFiscale;
----------------------------------------------------------
/*
CONCAT()
CONCATENA PIU' STRINGHE
CAST()
CONVERTE IN INTERO
*/

SELECT 
    CONCAT(st.Nome , ' ' , st.Cognome) AS [NOME COMPLETO],
    st.Cognome,
    st.CodiceFiscale AS [CF],
    CAST(AVG(v.voto) AS INT) AS [VOTO MEDIO]
    FROM Studenti AS st
    JOIN Voti AS v
       ON v.StudenteId=st.StudenteId
       GROUP BY st.Nome,st.Cognome,st.CodiceFiscale;

-------------------------------------------
/*
STUDENTE
ISCRITTI CORSO
SENZA DATA NASCITA SE NULL VISUALIZZA UN ALTRO DATO

RESTITUIRE:
NOME COMPLETO
DATA NASCITA
CF
CORSO
VOTO
DOCENTE DEL CORSO
AULA
*/

/*
Select * from Studenti;
Select * from Iscrizioni; 
Select * from Corsi;
Select * from DocentiCorso;
Select * from Docenti;
Select * from Lezioni;
Select * from Aule;
Docenti, Corsi, Aule Lezioni
Lezioni <-> Aule <-Corsi
Iscrizioni <-> Studenti <- Corsi
DocentiCorsi <- Docenti
*/

SELECT 
    st.Nome + ' ' + st.Cognome AS [NOME COMPLETO],
    ISNULL(CONVERT(VARCHAR, st.DataNascita, 120), 'NON REGISTRATA') AS [DATA NASCITA],
    st.CodiceFiscale AS [CF],
    C.NomeCorso AS [NOME DEL CORSO],
    CAST(AVG(v.voto) AS INT) AS [VOTO MEDIO],
    CONCAT(d.Nome,' ' ,d.Cognome) AS [DOCENTE],
    A.NomeAula AS Aula
    FROM Studenti AS st
    JOIN Iscrizioni as i
        ON st.studenteid=i.StudenteId
    JOIN Corsi as c
        on c.CorsoId=i.CorsoId
    JOIN Voti AS v
       ON st.StudenteId=v.StudenteId
            AND c.CorsoId=v.CorsoId
    JOIN DocentiCorso AS dc 
    ON dc.CorsoId=C.CorsoId
    JOIN Docenti AS d
    ON d.DocenteId=dc.DocenteId
    JOIN Lezioni AS l
    ON l.CorsoId=C.CorsoId
    JOIN Aule AS a
    ON A.AulaId=L.AulaId
    WHERE DataNascita IS NULL
    GROUP BY st.nome, st.cognome,st.codicefiscale,c.nomecorso,d.nome,d.Cognome,a.NomeAula,st.datanascita;
---------------------------------------------------------------------
/******************************************************************************************
    Obiettivo 1
Mostrare gli studenti che hanno preso un voto maggiore o uguale a 28 in qualsiasi corso.
*/

/*PROVE
SELECT * FROM Studenti;
SELECT * FROM Corsi;
SELECT * FROM Voti;

SELECT *
    FROM Studenti AS s
    JOIN Voti AS v
    ON S.StudenteId=v.StudenteId
    JOIN Corsi AS c
    ON V.CorsoId=C.CorsoId
    WHERE V.Voto>=28.00;
------------------------------------------------------------
SELECT 
    CONCAT(s.Nome , ' ' , S.Cognome) AS [Studente],
    c.Descrizione AS [Descrizione Corso],
    v.Voto
    FROM Studenti AS s
    JOIN Voti AS v
        ON S.StudenteId=v.StudenteId
    JOIN Corsi AS c
        ON V.CorsoId=C.CorsoId
    WHERE V.Voto>=28.00;
    */ 
-------------FINE PROVE 
------------------------ESERCIZIO 1 OK-------------------------------------
SELECT 
    CONCAT(s.Nome , ' ' , S.Cognome) AS [Studente],
    c.Descrizione AS [Descrizione Corso],
    CAST(v.Voto AS INT) AS [Voto]
    FROM Studenti AS s
    JOIN Voti AS v
        ON S.StudenteId=v.StudenteId
    JOIN Corsi AS c
        ON V.CorsoId=C.CorsoId
    WHERE V.Voto>=28.00;

/*
*******************************************************************
Obiettivo 2
Mostrare gli studenti che non sono iscritti a nessun corso.
SELECT * FROM Studenti;
SELECT * FROM Corsi;
SELECT * FROM Iscrizioni
*/

SELECT
    s.StudenteId,
    CONCAT(s.Nome , ' ' , S.Cognome) AS [Studente NON iscritto],
    s.Email,
    s.Telefono    
    FROM Studenti AS s
    LEFT JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
    WHERE i.StudenteId IS NULL;
--************************************************************
/*
Obiettivo 3
Mostrare i corsi che non hanno studenti iscritti.
/*
Docenti, Corsi, Aule Lezioni
Lezioni <-> Aule <-Corsi
Iscrizioni <-> Studenti <- Corsi
DocentiCorsi <- Docenti
*/
*/
SELECT 
    c.CorsoId,
    c.NomeCorso AS [Corso senza ISCRITTI],
    c.Descrizione,
    c.Crediti,
    c.Durata
FROM corsi c
LEFT JOIN iscrizioni i ON c.CorsoId = i.CorsoId
WHERE i.CorsoId IS NULL;
/*
potrei inserire un nuovo corso
    INSERT INTO Corsi
(
    NomeCorso,
    Descrizione,
    Crediti,
    Durata
)
VALUES
('Delphi', 'evoluzione del classico [Object Pascal]', 2, 100);
E VEDERE SE COMPARE NELL'ELENCO 
---------------------------------------

/*
Obiettivo 3_2  con Full JOIN 
Mostrare studenti e voti, anche se non corrispondono
SELECT
    s.Nome,
    s.Cognome,
    c.NomeCorso
FROM Studenti AS s
FULL OUTER JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
FULL OUTER JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId;
*/
*/
SELECT
    s.StudenteId AS [ID Studente],
    CONCAT(s.Nome , ' ' , S.Cognome) AS [Studente],
    CAST(v.Voto AS INT) AS [Voto],
    CONVERT(VARCHAR,v.DataVoto, 105) AS [Data Voto]
FROM Studenti AS s
FULL JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
FULL JOIN Voti AS v
    ON V.CorsoId = i.CorsoId
    WHERE V.Voto IS NOT NULL;
--****************************************************
--SELECT * FROM Stude
--SELECT * FROM Studentinti
--SELECT * FROM Corsi
INSERT INTO Iscrizioni
 (StudenteId,CorsoId,Stato)
 VALUES (44,3,'NON ATTIVO')

 SELECT *
    FROM Studenti AS S
    INNER JOIN Iscrizioni AS i
    ON S.StudenteId=i.StudenteId
    INNER JOIN Corsi AS c
    ON C.CorsoId=I.CorsoId
    WHERE I.StudenteId=44
