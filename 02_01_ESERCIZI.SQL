USE ScuolaDb;
GO

SELECT * FROM Studenti;

    INSERT INTO Studenti 
            (
             Nome, 
             Cognome, 
             DataNascita, 
             Email, 
             Telefono,
             CodiceFiscale
             )
        VALUES 
            ('yliana','gonzales','19801112', 'yliana@libero.it','035871228','ylianagonzalescf'),
            ('mario','sabato','19901111', 'mario@libero.it','0123456787','cffffmariof'),
            ('ernestina','chiumera','19801112', 'ernestina@libero.it','06587489907','erenstinacf'),
            ('alessandro','capone','19901101', 'ale@libero.it','01258745','cffffalessandro'),
            ('claudia','difiore','19961112', 'claudia@libero.it','036525','claudiaCf');
