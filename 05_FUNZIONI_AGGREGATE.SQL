-- Le Funzioni Aggregate in SQL Server
/*
    Le funzioni aggregate permettono di
    effetuare calcoli sulle righe
    
    Le principali sono:
    
    |COUNT()    | Conta         |
    |-----------|---------------|
    |SUM()      | SOMMA         |
    |-----------|---------------|
    |AVG()      | Media         |
    |-----------|---------------|
    |MIN()      | Valore Minimo |
    |-----------|---------------|
    |MAX()      | Valore Massimo|
    |-----------|---------------|

*/

--1
--CONTARE QUANTI STUDENTI CI SONO NELLA TABELLA
--TOTALE DEGLI STUDENTI

SELECT * FROM Studenti;

SELECT 
    COUNT(*) AS [Numero Totale Studenti]
    FROM Studenti;


    -- 2 COUNT / UNION ALL
    SELECT * FROM Aule;
    SELECT * FROM Corsi;
    SELECT * FROM Docenti;
    SELECT * FROM DocentiCorso;
    SELECT * FROM Iscrizioni;
    SELECT * FROM Lezioni;
    SELECT * FROM Studenti;
    SELECT * FROM Voti;

    SELECT 
        'Studenti' AS Tabella,
        COUNT(*) AS NumeroRighe 
        FROM Studenti;

    SELECT 
        'Studenti' AS Tabella,
        COUNT(*) AS NumeroRighe 
        FROM Studenti
   
   UNION ALL

    SELECT 
        'Corsi',
        COUNT(*)
        FROM Corsi

UNION ALL

    SELECT 
        'Docenti',
        COUNT(*)
    FROM Docenti

UNION ALL

    SELECT 
        'Aule',
        COUNT(*)
        FROM Aule
        
UNION ALL

    SELECT 
        'DocentiCorso',
        COUNT(*)
        FROM DocentiCorso

UNION ALL

    SELECT 
        'Iscrizioni',
        COUNT(*)
        FROM Iscrizioni
        UNION ALL

    SELECT 
        'Lezioni',
        COUNT(*)
        FROM Lezioni
   UNION ALL

    SELECT 
        'Voti',
        COUNT(*)
        FROM Voti;


---------------------------------------

--sommare il totale crediti DELLA TABELLA CORSI
  
SELECT * FROM Corsi;



SELECT 
   SUM(Crediti) AS [Totale Crediti]
   FROM Corsi;


---MEDIA DEI CREDITI

SELECT 
   AVG(Crediti) AS [Media Crediti]
   FROM Corsi;


---MEDIA della durata corsi

SELECT 
   AVG(Durata) AS [Durata media corsi]
   FROM Corsi;


--valore miniMO della durata dei corsi

SELECT 
   MIN(Durata) AS [Durata MINIMA]
   FROM Corsi;

--valore massimo crediti

SELECT 
   MAX(Crediti) AS [valore massimo credito]
   FROM Corsi;



--************************************************************
/*
   GRUOUP BY serve x raggruppare record
   --quanti docenti abbiamo per specializzazione??
*/

SELECT * FROM Docenti;

SELECT
    Specializzazione,
    COUNT(*) AS [Totale docenti]
    FROM Docenti
    GROUP BY Specializzazione;



--QUANTI DOCENTI ABBIAMO PER SPECIALIZZAZIONE DOVE LA SPECIALIZZAZIONE INIZIA PER D
    SELECT * FROM Docenti


    SELECT
        Specializzazione,
        Nome AS [nome docente],
        Cognome AS [COGNOME DOCENTE],
        COUNT(*) AS [Totale docenti]
    FROM Docenti
    WHERE Specializzazione LIKE 'D%'
    GROUP BY Specializzazione,Nome,Cognome
    
-- stessa cosa però con nome scritto completo 

    SELECT
        Specializzazione,
        Nome + ' ' + Cognome AS [nome docente],
        COUNT(*) AS [Totale docenti]
    FROM Docenti
    WHERE Specializzazione LIKE 'D%'
    GROUP BY Specializzazione,Nome,Cognome
    ORDER BY Specializzazione ASC;

-- HAVING SERVE PER FILTRARE IL RISULTATO DELLA MIA GROUP BY
--ESEMPIO 1

    SELECT * FROM DOCENTI;
  --Mostra le specializzazioni che hanno almeno 3 docenti
    SELECT
        Specializzazione,
        COUNT(*) AS [TOTALE DOCENTI]  --calcolo totale docenti
    FROM Docenti
    GROUP BY Specializzazione  --raggruppo per campo Specializzazione
    HAVING COUNT(*) >=3;

    /*
      Differenza FONDAMENTALE tra WHERE e HAVING
      WHERE filtra le righe del raggruppamento
      HAVING fltra i gruppi dopo il raggruppamento

      Schema PROGRAMMAZIONE
      SELECT
            <COLONNE>
      FROM
            <TABELLE>
      WHERE
            <CONDIZIONE>
      (eventuali JOIN)
      GROUP BY
      HAVING
            (SELECT ORDER BY)

    */

    /*
    --Primo report completo
    --quanti studenti abbiamo
    --quanti corsi ci sono
    --media dei crediti
    --corso più frequentato
    --durate media
    --durata minima 
    --durata massima

    **********
    totale corsi
    media corsi
    somma crediti
    credito minimo
    credito massimo
    */
    SELECT * FROM Corsi;

    SELECT 
     COUNT(*) AS [Totale Corsi],
     AVG(Crediti) AS [Media Crediti],
     SUM(Crediti) AS [Somma dei crediti],
     MIN(Crediti) AS [Credito minimo],
     MAX(Crediti) AS [Credito massimo]
     FROM Corsi;