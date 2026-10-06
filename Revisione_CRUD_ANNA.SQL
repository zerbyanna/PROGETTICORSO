USE master;
GO
-- Revizione completa del corso Sql server 
-- CREAZIONE DEL DATABASE hr_analytics_db
DROP DATABASE IF EXISTS Hr_analytics_db;
GO
CREATE DATABASE Hr_analytics_db;
GO
-- Uso del database 
USE Hr_analytics_db;
-- Creazione della tabella departments
CREATE TABLE Departments(
    DepartmentId INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- COLONNA principale della tabella 
    Department_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(50) NULL
);
-- Creazione della tabella Employees(DIPENDENTI)
CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    DepartmentId INT NULL,
    Job_Title VARCHAR(100) NULL,
    Hire_date DATE DEFAULT GETDATE() NULL,
    Salary DECIMAL(12,2) NULL,
    Employment_status VARCHAR(20) NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);
-- Creazione della tabella Attendance
CREATE TABLE Attendance(
    AttendanceId INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    EmployeeId INT NULL, 
    Attendance_Date DATE NULL,
    Attendance_Status VARCHAR(50) NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);
-- Creazione della tabella Promozioni
CREATE TABLE Promotions(
    PromotionId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    EmployeeId INT NULL,
    Promotion_Date DATE NULL,
    Old_job_title VARCHAR(150) NULL,
    New_job_title VARCHAR(150) NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);


-----------------------------------
---inserimento 5 NUOVI dati
INSERT INTO Departments
    (Department_Name, Location)
VALUES
    ('Data Analytics', 'Mumbai'),
    ('Finance', 'Delhi'),
    ('Human Resources', 'Bangalore'),
    ('Technology', 'Pune'),
    ('Operations', 'Hyderabad');


SELECT *
FROM Departments;
GO


------------------------------------------------------------------
-------------------------------------------------------------
-- INSERIMENTO DEI DIPENDENTI
-------------------------------------------------------------
-- EmployeeId NON è IDENTITY,
-- quindi dobbiamo specificarlo.
INSERT INTO Employees
    (
        EmployeeId,
        Employee_Name,
        DepartmentId,
        Job_Title,
        Hire_date,
        Salary,
        Employment_status
    )
VALUES
    (1, 'Rahul Sharma', 1, 'Data Analyst',       '2022-01-10',  850000.00, 'Active'),
    (2, 'Priya Verma',  2, 'Financial Analyst',  '2021-05-15',  920000.00, 'Active'),
    (3, 'Amit Patel',   4, 'Software Engineer',  '2020-08-20', 1200000.00, 'Active'),
    (4, 'Sneha Joshi',  3, 'HR Specialist',      '2023-02-10',  650000.00, 'Active'),
    (5, 'Rohan Gupta',  5, 'Operations Analyst', '2022-11-05',  750000.00, 'Resigned');


SELECT *
FROM Employees;
GO

----------------------------------------------------------------------
-------------------------------------------------------------
-- INSERIMENTO DELLE PRESENZE
-------------------------------------------------------------
-- AttendanceId è IDENTITY.
-- NON dobbiamo inserirlo.
INSERT INTO Attendance
    (
        EmployeeId,
        Attendance_Date,
        Attendance_Status
    )
VALUES
    (1, '2025-01-02', 'Present'),
    (1, '2025-01-03', 'Present'),
    (2, '2025-01-02', 'Present'),
    (2, '2025-01-03', 'Absent'),
    (3, '2025-01-02', 'Present'),
    (4, '2025-01-02', 'Present'),
    (5, '2025-01-02', 'Absent');

SELECT *
FROM Attendance;
GO

-----------------------------------------------

-------------------------------------------------------------
-- INSERIMENTO DELLE PROMOZIONI
-------------------------------------------------------------
-- PromotionId è IDENTITY.
-- NON dobbiamo inserirlo.
INSERT INTO Promotions
    (
        EmployeeId,
        Promotion_Date,
        Old_job_title,
        New_job_title
    )
VALUES
    (1, '2024-06-01', 'Junior Data Analyst', 'Data Analyst'),
    (3, '2024-01-15', 'Software Engineer', 'Senior Software Engineer');

SELECT *
FROM Promotions;
GO

----------------------------------------------------
--*****************************************


SELECT * FROM Departments;

--RESTITUIRE LE PRIME 3 RIGHE 
SELECT TOP 3 * FROM Departments;

--RESTITUIRE IL DIPARTIMENTO DATA ANALYTICS
SELECT * FROM Departments
    WHERE Department_Name='Data Analytics'

    ---oppure
SELECT * FROM Departments
    WHERE DepartmentId=1

        ---oppure
SELECT * FROM Departments
    WHERE Location='Mumbai'

    ----oppure
 SELECT * FROM Departments
    WHERE Department_Name LIKE '%Analytics'


        ----oppure
 SELECT * FROM Departments
    WHERE Department_Name LIKE 'Data%'

    
        ----oppure
 SELECT * FROM Departments
    WHERE Department_Name LIKE 'D%'   --inizia per d


        ----oppure
 SELECT * FROM Departments
    WHERE Department_Name LIKE '%s' --finisce per s


    SELECT * FROM Departments WHERE Department_Name LIKE '%s' AND DepartmentId = 1;

------------------
---rimuovere eventuali duplicati
 SELECT DISTINCT * FROM Employees


 --INNER JOIN Departments CON Employees
 SELECT * 
    FROM Departments AS d
    INNER JOIN Employees AS e
    ON e.DepartmentId=d.DepartmentId

----campi da restituire:

--nome impiegato
--mansione dell'impiegato
--dipartimento
--sede di lavoro


 SELECT 
        e.Employee_Name AS [NOME IMPIEGATO],
        e.Job_Title AS Ruolo,
        e.Salary as Stipendio,
        d.Department_Name AS Dipartimento,
        d.Location AS [SEDE LAVORO]
    FROM Departments AS d
    INNER JOIN Employees AS e
    ON e.DepartmentId=d.DepartmentId


--- PULISCO LE VARIABILII
 SELECT 
        e.Employee_Name AS [NOME IMPIEGATO],
        e.Job_Title AS Ruolo,
        CONCAT(CAST(e.Salary AS INT),' €') as Stipendio,
        d.Department_Name AS Dipartimento,
        d.Location AS [SEDE LAVORO]
    FROM Departments AS d
    INNER JOIN Employees AS e
    ON e.DepartmentId=d.DepartmentId
    
    SELECT 
        e.Employee_Name AS [NOME IMPIEGATO],
        e.Job_Title AS Ruolo,
        CONCAT('€ ',CAST(e.Salary AS INT)) as Stipendio,
        d.Department_Name AS Dipartimento,
        d.Location AS [SEDE LAVORO]
    FROM Departments AS d
    INNER JOIN Employees AS e
    ON e.DepartmentId=d.DepartmentId

--RECUPERARE LA MEDIA DEGLI STIPENDI
---AVG-CALCOLA LA MEDIA DEGLI STIPENDI
--CAST TRASFORMA IN INTERO LO STIPENDIO
--FORMAT TRASFORMA LO STIPENDIO IN FORMATO VALORE IN STILE ITALIANO (SEPARATOERE MIGLIAIA)
--CONCAT AGGIUNGE SIMBOLO EURO AL VALORE DELLO STIPENDIO

SELECT 
  CONCAT(CAST(AVG(Salary) AS INT),' €') AS [MEDIA STIPENDI]
    FROM Employees;
---------AGGIUNGO SEPARATORE MIGLIAIA
SELECT 
  CONCAT(FORMAT(CAST(AVG(Salary) AS INT),'N','it-IT'),' €') AS [MEDIA STIPENDI]
    FROM Employees;

---------------STIPENDIO MASSIMO
SELECT 
  CONCAT(FORMAT(CAST(MAX(Salary) AS INT),'N','it-IT'),' €') AS [MASSIMO STIPENDI]
    FROM Employees;

------------MODIFICARE RECORD DI dbo.Attendance
SELECT * FROM Attendance

UPDATE Attendance
    SET Attendance_Status='Absent'
    WHERE AttendanceId=2;
    ---WHERE EmployeeId=1 AND Attendance_Date='2025-01-03'
--VERIFICO MODIFICA
SELECT *
    FROM Attendance
    WHERE AttendanceId=2;
