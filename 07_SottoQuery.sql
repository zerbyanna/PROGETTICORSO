--******************
/*
	COSA SONO LE SOTTOQUERY?
	Una sottoquery è una query dentro un’altra query.
	Serve per:
		filtrare dati usando risultati di altre tabelle
		calcolare valori intermedi
		sostituire JOIN quando vuoi logica più compatta
		creare condizioni avanzate nel WHERE, HAVING, SELECT
*/

-- 1. SOTTOQUERY nel WHERE
-- Obiettivo
--	Trovare gli studenti che hanno preso il voto massimo in tutti i corsi.

-- 🔎 passo 1 Trovare il voto massimo in intero
SELECT CAST(MAX(Voto) AS INT) [Voto Massimo] FROM Voti; -- 30

-- 🔥Query finale sottoquery (SubQuery)
SELECT
	s.Nome,
	s.Cognome,
	v.Voto
FROM Studenti s
JOIN Voti v
	On s.StudenteId = v.StudenteId
where v.voto = (
	SELECT 
		MAX(Voto) [Voto Massimo] 
	FROM Voti
);
--***************************************************


/*
sottoquery nel WHERE
TUTTI GLI STUDENTI CHE HANNO PRESO IL VOTO MASSIMO IN TUTTI I CORSI

PASSO1
TROVARE IL VOTO MASSIMO
*/
SELECT 
    CAST(MAX(v.Voto) AS INT) AS [Voto MASSIMO]
	FROM Voti AS v

--PASSO 2
--SOTTOQUERY (SUBQUERY)
/*TROVARE GLI STUDENTI 
*/
SELECT 
		S.Nome,
		S.Cognome,
		V.Voto
 FROM Studenti AS s
 LEFT JOIN Voti AS v
	ON V.StudenteId=S.StudenteId
-----FINITO RICERCA VOTI STUDENTI
---WHERE V.Voto=30==>PASSO LA SOTTOQUERY CHE MI TROVA IL VOTO MASSIMO
   WHERE V.Voto=(												-- SOTTOQUERY FATTA SOPRA CHE CALCOLA IL VOTO MASSIMO
				SELECT 
					CAST(MAX(v.Voto) AS INT) AS [Voto MASSIMO]
					FROM Voti AS v
				)	

/* 
SOTTO QUERY NELLA SELECT
ES 2
MOSTRARE OGNI STUDENTE CON LA MEDIA DEI SUOI VOTI (SENZA GROUP BY)
*/
--PASSO1 RESTITUIRE LA LISTA DEGLI STUDENTI
SELECT * FROM Studenti;

--passo2 medie dei voti

SELECT 
	AVG(Voto) [Media]		--25.90 media voti
	FROM Voti
--passo3

--unire 1 e 2 con nome e cognome e cf

SELECT 
	Nome,
	Cognome,
	CodiceFiscale,
	(SELECT 
	AVG(Voto) [Media]		--25.90 media voti
	FROM Voti) AS [MEDIA VOTI]
	FROM Studenti

/*
SOTTOQUERY CON IN
ES 3 
TROVARE STUDENTI CHE HANNO PRESO UN VOTO >= 28

*/
--PASSO1 TROVARE TUTTI GLI STUDENTI
SELECT
	Nome,
	Cognome,
	CodiceFiscale
	FROM Studenti

--PASSO 2 RESTITUIRE I VOTI >=28

	SELECT
		Voto
		FROM Voti
		WHERE Voto>=28
--PASSO3 UNIRE PASSI 1 E 2 USANDO IL FILTRO SEGUITO DA IN

		
SELECT
	Nome,
	Cognome,
	CodiceFiscale
FROM Studenti
WHERE StudenteId IN (SELECT
							StudenteId
							FROM Voti
							WHERE Voto>=28
					)
------------------------
/*
4. SOTTOQUERY CON EXISTS
--MOSTRARE GLI STUDENTI CHE HANNO ALMENO UN VOTO REGISTRATO


*/
--PASSO1 TROVARE TUTTI GLI STUDENTI
SELECT
	Nome,
	Cognome
	FROM Studenti

--passo 2
--esiste almeno 1 VOTO->>exist_1  ->SELECT 1
--FUNZIONE EXISTS

SELECT 1
	FROM Voti
	WHERE StudenteId=2

--PASSO 3
--QUERY FINALE
SELECT
	Nome,
	Cognome
FROM Studenti AS s
	WHERE EXISTS(SELECT 1
					FROM Voti AS v
					WHERE s.StudenteId=V.StudenteId
				) 
/*
5. SOTTOQUERY CORRELATA AVANZATA
MOSTRARE STUDENTI CHE HANNO PRESO UN VOTO SUPERIORE ALLA MEDIA
*/
--PASSO UNO 1 MEDIA VOTI

SELECT
	AVG(Voto) [MEDIA VOTI]  
	FROM Voti

--PASSO 2 QUERY FINALE
SELECT
	Nome,
	Cognome,
	CAST(V.Voto AS INT) AS [Voto]
	FROM Studenti AS s
	INNER JOIN Voti AS v
		ON S.StudenteId=V.StudenteId
	WHERE V.Voto>(						 --CALCOLA LA MEDIA DEI VOTI-->>>25.9
				SELECT
					AVG(Voto) [MEDIA VOTI]  
				FROM Voti
					);
/*
6.SOTTOQUERY CON JOIN (SUPER AVANZATA)
-MOSTRARE I CORSI CHE HANNO UNA MEDIA VOTI SUPERIORE ALLA MEDIA DI TUTTI

7.SOTTOQUERY PER TROVARE STUDENTI SENZA DATA DI NASCITA
-MOSTRARE STUDENTI ISCRITTI A CORIS SENZA DATA DI NASCITA ,USANDO SOTTOQUERY
*/


--******ESERCIZI PER IL 05/10/2026
--6. SOTTOQUERY con JOIN (super avanzata)
-- Obiettivo
-- Mostrare i corsi che hanno una media voti superiore alla media di tutti i corsi.
-------------------------anna---------------------------------
SELECT * FROM Voti
SELECT * FROM Corsi

--PASSO 1 CALCOLO LA MEDIA VOTI
SELECT
	AVG(Voto) [La media dei voti] ---> 25.90
FROM Voti
---QUERY FINALE

SELECT --*
	C.NomeCorso,
	C.Descrizione,
	CAST(V.Voto AS INT) AS [VOTO]
 FROM Corsi AS c
 JOIN Voti AS v
 ON V.CorsoId=C.CorsoId
 WHERE V.Voto>(
				SELECT
					AVG(Voto) [La media dei voti] ---> 25.90
				FROM Voti
		    	)

--7. SOTTOQUERY per trovare studenti senza data di nascita
-- Obiettivo
--Mostrare studenti iscritti a corsi senza data di nascita, usando sottoquery invece dei JOIN.


SELECT --*
	s.Nome + ' ' + s.Cognome AS [Studente Iscritto],
	ISNULL(CONVERT(VARCHAR,s.DataNascita, 105),'NON DEFINITA') AS [Data Nascita],
	s.Email,
	s.Telefono,
	s.CodiceFiscale
FROM Studenti AS s
WHERE s.DataNascita IS NULL
  AND s.StudenteId IN (
					 SELECT DISTINCT i.StudenteId
					 FROM Iscrizioni AS i
					 )
ORDER BY [Studente Iscritto] ASC;
