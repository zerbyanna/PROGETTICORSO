/*

Operatori principali SQL
 *CONFRONTO
	=		ugual
	<>		diverso
	!=		diverso
	>
	>
	>=
	<=
*/

--ESEMPIO PER UGUALE
SELECT 
	StudenteId,
	Nome,
	Cognome,
	Email
FROM Studenti
WHERE StudenteId=5;

--ESEMPIO PER DIVERSO
SELECT * 
FROM Studenti
WHERE StudenteId<>5
--

SELECT 
	StudenteId,
	Nome,
	Cognome,
	Email
FROM Studenti
WHERE StudenteId<>5;



--

SELECT * FROM Corsi;

SELECT * FROM Corsi
WHERE Crediti>5;

SELECT * FROM Corsi
WHERE Crediti<5;


SELECT DISTINCT
	NomeCorso,
	Descrizione,
	Crediti
	FROM Corsi
	WHERE Crediti>=5;

SELECT DISTINCT
	NomeCorso,
	Descrizione,
	Crediti
FROM Corsi
WHERE Crediti<=5;

SELECT * FROM Corsi;

SELECT DISTINCT
	NomeCorso,
	Descrizione,
	Crediti,
	Durata
FROM Corsi
WHERE Crediti>=5 AND Durata>50;



--***********************************

SELECT *
FROM Corsi
WHERE Crediti=5 OR Crediti=3;


SELECT DISTINCT
	NomeCorso,
	Descrizione,
	Crediti,
	Durata
FROM Corsi
WHERE Crediti=5 OR Crediti=3;


--***********************************

SELECT *
FROM Corsi
WHERE Crediti=5 OR Crediti=3;
--************************************

SELECT *
FROM Studenti
WHERE Nome = 'ANNA';

--******************************************

SELECT 
	Nome +' ' + Cognome AS 'Nome Completo',
	DataNascita AS [Data di nascita],
	Email  
FROM Studenti
WHERE DataNascita>'2002'
ORDER BY [Nome Completo] ASC;
