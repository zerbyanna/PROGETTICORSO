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
/*
Docenti, Corsi, Aule Lezioni
Lezioni <-> Aule <-Corsi
Iscrizioni <-> Studenti <- Corsi
DocentiCorsi <- Docenti
*/

/*
    SELECT * FROM Studenti;
    SELECT * FROM Iscrizioni; -c -s
    SELECT * FROM Corsi;
    SELECT * FROM DocentiCorso;
    SELECT * FROM Docenti;
    SELECT * FROM Lezioni;
    SELECT * FROM Aule;
