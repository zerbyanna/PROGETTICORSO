USE ScuolaDb;
GO
SELECT * FROM Aule;
SELECT * FROM Corsi;
SELECT * FROM Docenti;
SELECT * FROM DocentiCorso;
SELECT * FROM Iscrizioni;
SELECT * FROM Lezioni;
SELECT * FROM Studenti;
SELECT * FROM Voti;

/*DOCENTI CORSI AULE LEZIONI
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
