
-- =============================================
-- Author:		anna zerbin
-- Create date: 06/10/2026
-- Description:	restituire la lista di tutti gli studenti
-- =============================================
/*
CREATE PROCEDURE <NOME POCEDURA>
	AS   <- VA SEMPRE
	BEGIN  ---INIZIO DELLA PROCEDURA
		RIGHE DI COMANDO DELLA PROCEDURA
		...
		...

	END  --FINE DELLA PROCEDURA
GO
*/
CREATE PROCEDURE sp_select_all_studenti -- definisce il nome della procedura
AS
BEGIN
	SELECT 
		ISNULL(Nome + ' ' + Cognome, 'Studente non asseganto') AS [Nome completo dello Studente],
		ISNULL(CONVERT(VARCHAR, DataNascita, 105), 'N/D') AS [Data di Nascita],
		ISNULL(CodiceFiscale, 'CF00000') AS [CF],
		ISNULL(Email, 'Email non definita') AS Email,
		ISNULL(Telefono, '000000') AS Telefono
	FROM Studenti
END
GO
