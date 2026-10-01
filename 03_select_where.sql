USE ScuolaDb;
GO

 SELECT * FROM Studenti;
/*
 visualizza tutte le righe
 SELECT * FROM Studenti;

 VISUALIZZA UNA DETERMINATA COLONNA
 SELECT 
     COLONNA1,
     COLONNA2,
     .....
 FROM
     TABELLA

SELECT 
    Nome,
    Cognome,
    CodiceFiscale
FROM
    Studenti
*/

SELECT 
    Nome,
    Cognome,
    CodiceFiscale
FROM
    Studenti

    /*

    alias ->AS per definire un nome temporaneo della colonna risultante 
    da estrazione di più colonne

    prima faccio concatenazione di 2 colonne
    Nome+Cognome
    */

    --concateno nome e cognome su nome completo
SELECT 
    Nome+' '+Cognome AS Nome_completo,
    CodiceFiscale
FROM
    Studenti


SELECT 
    Nome+' '+Cognome AS [Nome completo],  --posso ,ettere alias con spazi
    CodiceFiscale AS [CF],
    Email
FROM
    Studenti

SELECT * FROM Studenti;

USE ScuolaDb;
Go

-- Primo passo con select 
SELECT * FROM Studenti;

-- Secondo passo con 'SELECT'
/*
    Esempio: 
        select 
            colonna1, 
            colonna2, 
            ...
        from tabella 
*/

SELECT 
    Nome, 
    Cognome,
    CodiceFiscale
FROM Studenti

-- Concatenazione di due colonne (+) 
-- Aliass = AS per definire il nome di una colonna durante la select 

--Esempio1
SELECT 
    Nome + ' ' + Cognome AS NomeCompleto,
    CodiceFiscale 
FROM Studenti;

--Esempio2
SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale
FROM Studenti;

--Esempio3
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale AS [CF]
FROM Studenti;


--SELECT WHERE

SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale,
    DataNascita
FROM Studenti
WHERE DataNascita IS NOT NULL;

--IS NULL Se è nullo
--IS NOT NULL Se NON è NULLO


SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    Email,
    CodiceFiscale,
    DataNascita
FROM Studenti
WHERE DataNascita IS NULL;

--ORDER PER ORDINARE IL RISULTATO DELLA QUERY
--ASC CRESCENTE
--
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    Email,
    CodiceFiscale,
    DataNascita
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome Completo] ASC;--CRESCENTE


SELECT * FROM Studenti;
--DECRESCENTE
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    Email,
    CodiceFiscale,
    DataNascita
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome Completo] DESC;--DECRESCENTE



--**********************24/09/2026**************************************************

USE ScuolaDb;
Go

-- Primo passo con select 
SELECT * FROM Studenti;

-- Secondo passo con 'SELECT'
/*
    Esempio: 
        select 
            colonna1, 
            colonna2, 
            ...
        from tabella 
*/

SELECT 
    Nome, 
    Cognome,
    CodiceFiscale
FROM Studenti;

-- Concatenazione di due colonne (+) 
-- Aliass = AS per definire il nome di una colonna durante la select 

--Esempio1
SELECT 
    Nome + ' ' + Cognome AS NomeCompleto,
    CodiceFiscale 
FROM Studenti;

--Esempio2
SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale
FROM Studenti;

--Esempio3
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale AS [CF]
FROM Studenti;

select * from Studenti;

-- Where filtra a secondo le condizione
-- Esmpio1
SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale,
    DataNascita
FROM Studenti;

-- IS NULL / IS NOT NULL CON IL FILTRO Where 
SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale,
    DataNascita
FROM Studenti
WHERE DataNascita IS NOT NULL;

/*
    Restituire la lista degli studenti 
    che non hanno la data di nascita.

    Campi da visualizzare: 
        Nome completo dello studente,
        Email,
        Data di nascita,
        Codice fiscale
*/
SELECT
    Nome + ' ' + Cognome AS [Nome completo dello studente],
    Email,
    DataNascita,
    CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL;

-- ORDER ordina le colonne ASC
SELECT
    Nome + ' ' + Cognome AS [Nome completo dello studente],
    Email,
    DataNascita,
    CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome completo dello studente] ASC;

-- ORDER ordina le colonne DESC
SELECT
    Nome + ' ' + Cognome AS [Nome completo dello studente],
    Email,
    DataNascita,
    CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome completo dello studente] DESC;



--************************************************************


