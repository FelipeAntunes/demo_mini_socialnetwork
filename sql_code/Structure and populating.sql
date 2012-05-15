CREATE DATABASE MiniSocialNetwork2

use MiniSocialNetwork2 

CREATE TABLE Usuario
	(
		UsuarioID bigint identity(1,1) PRIMARY KEY,
		Nome varchar(100) NOT NULL,
		Sobrenome varchar(100) NOT NULL
	)
	
CREATE TABLE Relacionamentos
	(
		UsuarioOrigemID bigint FOREIGN KEY REFERENCES Usuario(UsuarioID),
		UsuarioDestinoID bigint FOREIGN KEY REFERENCES Usuario(UsuarioID),
		CONSTRAINT PK PRIMARY KEY (UsuarioOrigemID,UsuarioDestinoID)
	)

--- Populando
INSERT INTO Usuario(Nome,Sobrenome)		
SELECT TOP 50000
	'Nome_' + CAST(ROW_NUMBER() OVER (ORDER BY N1.ID) as varchar),
	'Sobrenome_' + CAST(ROW_NUMBER() OVER (ORDER BY N1.ID) as varchar)  
FROM 
(
(SELECT * FROM  
	(VALUES (''),(''),(''),(''),(''),(''),(''),(''),(''),('')) Usuarios(ID)
) N1 CROSS JOIN  
(SELECT * FROM  
	(VALUES (''),(''),(''),(''),(''),(''),(''),(''),(''),('')) Usuarios(ID)
) N2 CROSS JOIN  
(SELECT * FROM  
	(VALUES (''),(''),(''),(''),(''),(''),(''),(''),(''),('')) Usuarios(ID)
) N3 CROSS JOIN  
(SELECT * FROM  
	(VALUES (''),(''),(''),(''),(''),(''),(''),(''),(''),('')) Usuarios(ID)
) N4 CROSS JOIN  
(SELECT * FROM  
	(VALUES (''),(''),(''),(''),(''),(''),(''),(''),(''),('')) Usuarios(ID)
) N5
) 



-- Populando relacionamentos (50 por usuario)
INSERT INTO Relacionamentos
SELECT 
	U.UsuarioID, A.UsuarioID 
FROM 
	Usuario U
INNER JOIN Usuario A 
ON   A.UsuarioID BETWEEN  U.UsuarioID - 25 AND U.UsuarioID + 25 
AND A.UsuarioID <> U.UsuarioID 
 
	