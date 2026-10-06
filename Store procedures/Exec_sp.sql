USE ScuolaDb;
---ESECUZIONE DELLA STORED PROCEDURE 
--LISTA DEGLI STIDENTI

EXEC sp_select_all_studenti;

---------------------
--restiruire  lo studente PASSANDO IL NOME
EXEC sp_GetStudenteByName 'Matteo';

--restiruire  lo studente PASSANDO L'ID
EXEC sp_GetStudenteById '3'

--restiruire  GLI STUDENTI ISCRITTI
EXEC sp_Studenti_Scritti;