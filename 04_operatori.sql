
/*
    SELECT - PARTE 2
    OPERATORI DI CONFRONTO

    Operatori principali in sql server.
        =        Uguale 
        <> / !=  Diverso da 
        <        Minore
        >        Maggiore
        <=       Minore uguale 
        >=       Maggiore uguale
        AND      E
        OR       O
*/

-- 1 UGUALE:
-- Questa riga restituisce solo lo studente con Id (4)
SELECT 
    StudenteId,
    Nome,
    Cognome,
    Email
FROM Studenti
WHERE StudenteId = 4;


-- 2 DIVERSO:
-- Restuire tutti gli studenti trane con Id (5)
SELECT 
    StudenteId,
    Nome,
    Cognome,
    Email
FROM Studenti
WHERE StudenteId <> 5;

-- 3 MAGGIORE >
-- Restituire i corsi che hanno più di 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti > 5;

-- 4 MINORE <
-- Restituire i corsi che hanno meno di 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti < 5;

-- 5 MAGGIORE O UGUALE >=
-- Restituire i corsi con almeno 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti >= 5;

-- 6 MINORE O UGUALE
-- Restituire i corsi con almeno 5 crediti
SELECT DISTINCT  
    NomeCorso, 
    Descrizione,
    Crediti
FROM Corsi WHERE Crediti <= 5;

/*
    7 AND significa (E)
    Tutte le condizione devono essre vere.
*/

/*
    Restituire la lista dei corsi con almeno 5 crediti
    e durata maggiore di 50 ore
*/
SELECT DISTINCT 
    NomeCorso, 
    Descrizione,
    Crediti,
    Durata
FROM Corsi
WHERE Crediti >= 5 AND Durata > 50;

/*
    8 OR significa "OPPURE"
    è sufficente che una delle condizione sia vera🤨
*/
-- Restituire la lista dei corsi che con 5 crediti
-- oppure corsi con 3 crediti
SELECT DISTINCT 
    NomeCorso, 
    Descrizione,
    Crediti,
    Durata
FROM Corsi
WHERE  Crediti = 5 or Crediti = 3;

/* ===================================
    9 FILTRO DEGLI STUDENTI PER NOME 
  ===================================*/
SELECT * FROM Studenti WHERE Nome = 'Anna';

/* ===================================
    10 FILTRO DEGLI STUDENTI PER COGNOME 
  ===================================*/
SELECT * FROM Studenti WHERE Cognome = 'Rossi';

/* ===================================
    11 CONDIZIONE SU UNA DATA 
    Studenti nati dopo il 1 gennaio 2002
  ===================================*/
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    DataNascita,
    Email
FROM Studenti 
WHERE DataNascita > '2002'
ORDER BY [Nome Completo] ASC;

/* ============================================================
   12. AND CON LE DATE
    Esercizio 1:
        Restituire la lista degli Studenti 
        nati tra il 2001 e il 2002
   ============================================================ */
SELECT * FROM Studenti;


SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    DataNascita
FROM Studenti 
WHERE DataNascita >= '2001' AND DataNascita <= '2002'
ORDER BY [Nome Completo] ASC;



SELECT * FROM Studenti;
--LIMIT IN SQL SERVER (TOP)

SELECT TOP 10 *
    FROM Studenti;

SELECT TOP 10 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL;
    
SELECT * FROM Corsi
    WHERE Crediti IN (6,5);

SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY Crediti ASC;


SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY NomeCorso ASC;


    -- 13 LIMIT IN SQL SERVER (TOP)
SELECT TOP 10 *
    FROM Studenti;

-- 14 TOP 10 CON IS NULL E NOT NULL 
SELECT TOP 10 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL;

-------------
SELECT TOP 10 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL   
    AND DataNascita > '2000'
    ORDER BY DataNascita ASC;

---------
SELECT TOP 5 *
    FROM Studenti
    WHERE DataNascita IS NOT NULL   
    AND DataNascita > '2000'
    ORDER BY DataNascita ASC;

-- 15 LISTE INT SQL SERVER IN(...)
-- IN = Restituisce gli elemtnti di una lista 
SELECT * FROM Corsi
    WHERE Crediti IN (6,5);

SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY Crediti ASC;


SELECT TOP 10 * FROM Corsi
    WHERE Crediti IN (6,5)
    ORDER BY NomeCorso ASC;

/*
    16 BETWEEN:

    Permette di verificare se un valore
    si trova all'interno di un intervallo.

    Sintassi:
    SELECT * FROM <TABELLA>
    WHERE <colonna> BETWEEN <valore Minimo> AND <valoreMassimo>

    CORSI CON UNA DURATA COMPRESA TRA 30 E 50 ORE
*/

SELECT * FROM Corsi;

SELECT DISTINCT
    NomeCorso AS [Nome del Corso],
    Descrizione,
    Durata
    FROM Corsi
    WHERE Durata BETWEEN 30 AND 50; 


--SOLO I PRIMI 5

SELECT DISTINCT TOP 5
    NomeCorso AS [Nome del Corso],
    Descrizione,
    Durata
    FROM Corsi
    WHERE Durata BETWEEN 30 AND 50; 



--ORDINATA PER NOME CORSI
SELECT DISTINCT TOP 5
    NomeCorso AS [Nome del Corso],
    Descrizione,
    Durata
    FROM Corsi
    WHERE Durata BETWEEN 30 AND 50
    ORDER BY [Nome del Corso] ASC;


--18 RESTITUIRE LA LISTA DEGLI STUDENTI NATI TRA IL 2000-01-01 E IL 2002-12-31
SELECT *
    FROM Studenti
    WHERE DataNascita BETWEEN '2000' AND '2002';

SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    DataNascita
FROM Studenti
    WHERE DataNascita BETWEEN '2000' AND '2002-12-31';

--19 CONFRONTO OR E IN


SELECT * FROM Corsi;

/*
SELECT * FROM 
    WHERE Crediti= 3 OR Crediti= 5 OR Crediti= 6;

    EQUIVALE A

    SELECT * FROM 
    WHERE Crediti IN (3,5,6)

*/

 SELECT * FROM 
    WHERE Crediti IN (3,5,6);

--  NOT IN :DA QUELLO CHE NON SI TROVA IN QUESTA LISTA
 SELECT * FROM 
    WHERE Crediti NOT IN (3,5,6);

/*
    20 LIKE
        A%: INIZIA PER A
        %B:FINSICE PER B
        %N%: CONTIENE N
    */

    --NOME CORSO INZIA PER P

SELECT DISTINCT 
        NomeCorso,
        Descrizione
        FROM Corsi
        WHERE NomeCorso LIKE 'P%';

