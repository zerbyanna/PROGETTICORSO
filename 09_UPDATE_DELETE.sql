-- UPDATE è il commando sql che modifica i dati già esistenti dentro una tablla
SELECT * FROM Studenti
where StudenteId = 3;



-- katya
--⚠️🙅😭😭😭 
--UPDATE Studenti
--SET Nome = 'katya'


--aggiornamento del nome dello studente con id=3
UPDATE Studenti
SET Nome = 'Katia'
WHERE StudenteId = 3; 



--aggiornamento dei dati dello studente con cf BLUSRA02B28H501E
update Studenti
SET Nome = 'Mario',
    Cognome = 'Rossi',
    Email = 'm.rossi@software.it'
WHERE CodiceFiscale = 'BLUSRA02B28H501E';
SELECT * FROM Studenti WHERE CodiceFiscale = 'BLUSRA02B28H501E';