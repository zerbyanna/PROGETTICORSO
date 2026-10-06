
-- =============================================
-- Author:		anna zerbin
-- Create date: 06/10/2026
-- Description:	restituire lo studente in base al nome passato nel parametro
-- =============================================


CREATE PROCEDURE sp_GetStudenteByName -- definisce il nome della procedura	
	@NomeRicerca NVARCHAR(100)
AS
BEGIN
	SELECT 
		ISNULL(Nome + ' ' + Cognome, 'Studente non asseganto') AS [Nome completo dello Studente],
		ISNULL(CONVERT(VARCHAR, DataNascita, 105), 'N/D') AS [Data di Nascita],
		ISNULL(CodiceFiscale, 'CF00000') AS [CF],
		ISNULL(Email, 'Email non definita') AS Email,
		ISNULL(Telefono, '000000') AS Telefono
	FROM Studenti
	WHERE Nome=@NomeRicerca
END
GO