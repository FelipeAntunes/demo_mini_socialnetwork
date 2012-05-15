/* 
E onde o modelo Graph se encaixa melhor do que o relacional? Um bem óbvio é o de 
redes sociais. Vamos colocar um exemplo simples 

Média: São 100.000 de usuários, com 50 conexões entre si.

Para se obter os amigos
*/

set statistics io on 

SELECT
	U.Nome,U.Sobrenome
FROM 
	Relacionamentos R (NOLOCK)
INNER JOIN Usuario U ON R.UsuarioDestinoID = U.UsuarioID 
WHERE
	UsuarioOrigemID  = 25000

-- Obtendo Amigos dos Amigos

SELECT
	A.Nome + ' ' + A.Sobrenome Amigo,
	AA.Nome + ' ' + AA.Sobrenome AmigoDoAmigo
FROM 
	Relacionamentos R 
INNER JOIN Relacionamentos R2 ON R.UsuarioDestinoID = R2.UsuarioOrigemID 
INNER JOIN Usuario A ON R.UsuarioDestinoID = A.UsuarioID 
INNER JOIN Usuario AA ON R2.UsuarioDestinoID = AA.UsuarioID 
WHERE
	R.UsuarioOrigemID  = 25000
	

-- Amigos dos Amigos dos Amigos
SELECT DISTINCT 
	A.Nome + ' ' + A.Sobrenome Amigo,
	AA.Nome + ' ' + AA.Sobrenome AmigoDoAmigo,
	AAA.Nome + ' ' + AAA.Sobrenome AmigoDoAmigoDOAmigo
FROM 
	Relacionamentos R 
INNER JOIN Relacionamentos R2 ON R.UsuarioDestinoID = R2.UsuarioOrigemID 
INNER JOIN Relacionamentos R3 ON R2.UsuarioDestinoID = R3.UsuarioOrigemID 
INNER JOIN Usuario A ON R.UsuarioDestinoID = A.UsuarioID 
INNER JOIN Usuario AA ON R2.UsuarioDestinoID = AA.UsuarioID 
INNER JOIN Usuario AAA ON R3.UsuarioDestinoID = AAA.UsuarioID 
WHERE
	R.UsuarioOrigemID  = 25000
	


-- Amigos dos Amigos dos Amigos
SELECT DISTINCT 
	AAA.Nome + ' ' + AAA.Sobrenome AmigoDoAmigoDOAmigo
FROM 
	Relacionamentos R 
INNER JOIN Relacionamentos R2 ON R.UsuarioDestinoID = R2.UsuarioOrigemID 
INNER JOIN Relacionamentos R3 ON R2.UsuarioDestinoID = R3.UsuarioOrigemID 
INNER JOIN Usuario A ON R.UsuarioDestinoID = A.UsuarioID 
INNER JOIN Usuario AA ON R2.UsuarioDestinoID = AA.UsuarioID 
INNER JOIN Usuario AAA ON R3.UsuarioDestinoID = AAA.UsuarioID 
WHERE
	R.UsuarioOrigemID  = 25000
	


	
/




People you may know

