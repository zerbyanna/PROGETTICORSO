--REVISIONE COMPLETA DEL CORSO SQL SERVER
--CREAZIONE DEL DB Hr_analistic_db
--!!!!!!!!!!!!!!!!!DEVO CREARE DB DENTRO master!!!!!!!!!!!!!!
USE master;
GO

CREATE DATABASE Hr_analistic_db;
GO

--USO IL DATABASE APPENA CREATO

USE Hr_analytics_db;
GO

--CREAZIONE DELLA TABELLA REPARTO -> Departments
CREATE TABLE Departments(
		DepartmentId INT NOT NULL PRIMARY KEY IDENTITY (1,1), --COLONNA CHIAVE INTERA CONTATORE 1 A 1
		Department_Name VARCHAR(100) NOT NULL,
		Location VARCHAR(50) NULL
);


--CREAZIONE DELLA TABELLA Dipendenti-> Employees

CREATE TABLE Employees(
		EmployeeId INT NOT NULL PRIMARY KEY IDENTITY (1,1),
		Employee_Name VARCHAR(100) NOT NULL,

		DepartmentId INT,                
		
		Job_Title VARCHAR(150) NOT NULL,        --titolo di lavoro
		Hire_Date DATE DEFAULT GETDATE() NULL,  --data assunzione 
		Salary DECIMAL(12,2) NULL,				--Stipendio   12 CARATTERI 2 DECIMALI  
		Employee_Statys VARCHAR(50) NULL,		--Stato dell'assunzione

		FOREIGN KEY DepartmentId REFERENCES	Departments(DepartmentId)			--CHIAVE ESTERNA RIFERITA A REPARTO
); 
	


--CREAZIONE TABELLA Partecipanti ->Attendeences
CREATE TABLE Attendance(
		AttendanceId INT NOT NULL PRIMARY KEY IDENTITY (1,1),
		EmployeeId INT NULL ,
		Attendance_Date DATE NULL,
		Attendance_Status VARCHAR(50) NULL,		--STATO AVANZAMENTO

		FOREIGN KEY EmployeeId REFERENCES Employees(EmployeeId)		--CHIAVE ESTERNA RIFERISCE A DIPENDENTI
);


--CREAZIONE TABELLA PROMOZIONI --> 
CREATE TABLE Promotions(
		PromotionId INT NOT NULL PRIMARY KEY IDENTITY (1,1),	--PromotionId 
		EmployeeId INT NULL ,									--dipendente
		Promotion_Date DATE NULL,								--data promozione
		Old_job_title VARCHAR(150) NULL,						--titolo vecchio lavoro
		New_job_title VARCHAR(150) NULL,						--titolo NUOVO lavoro

		FOREIGN KEY EmployeeId REFERENCES Employees(EmployeeId)		--CHIAVE ESTERNA RIFERISCE A DIPENDENTI
);

