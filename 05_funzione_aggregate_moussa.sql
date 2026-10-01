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


-- 1 Totole righe degli studenti
SELECT 
    COUNT(*) AS [Numero Totale degli Studenti]
FROM Studenti;

-- 2 COUNRT / UNION ALL
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
    'Docenti Corso',
    COUNT(*)
FROM DocentiCorso

UNION ALL

SELECT 
    'Aule',
    COUNT(*)
FROM Aule

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