UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_state] = 'RJ'
WHERE [seller_state] = ' rio de janeiro, brasil",RJ'
/*
(1 row affected)
*/
UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_state] = 'RS'
WHERE [seller_state] = ' rio grande do sul, brasil",RS'
/*
(1 row affected)
*/


--são paulo
--santa barbara d´oeste
SELECT [seller_id]
      ,[seller_city]
      ,[seller_state]
	  ,[PK_Seller]
	  FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [PK_Seller] = 2259

-- "4b5f66b7adcf57f1ecc0d3c07dd6b177"	vendas@creditparts.com.br	PR	2259

-- DELETE DO OUTLIER COM E-MAIL NO CAMPO SELLER_CITY

DELETE FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [PK_Seller] = 2259

/*
(1 row affected)
*/

SELECT [seller_id]
      ,[seller_city]
      ,[seller_state]
	  ,[PK_Seller]
	  FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [PK_Seller] = 2259

/*
(0 rows affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'lages - sc'
-- lages - sc	SC

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'lages'
WHERE [seller_city] = 'lages - sc'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'lages - sc'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'auriflama/sp'
-- auriflama/sp	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'auriflama'
WHERE [seller_city] = 'auriflama/sp'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'auriflama/sp'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sao paulo / sao paulo'
-- sao paulo / sao paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'sao paulo'
WHERE [seller_city] = 'sao paulo / sao paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sao paulo / sao paulo'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'são paulo'
-- são paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'sao paulo'
WHERE [seller_city] = 'são paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'são paulo'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'santa barbara d´oeste'
-- santa barbara d´oeste	SP
-- santa barbara d´oeste	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'santa barbara D''Oeste'
WHERE [seller_city] = 'santa barbara d´oeste'

/*
(2 rows affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'santa barbara d´oeste'

-- (0 rows affected)

SELECT [seller_city], [seller_state], [seller_zip_code_prefix]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = '"04482255"'
-- "04482255"	RJ	"22790" | zip_code_prefix 22790 -> city: rio de janeiro 

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'rio de janeiro'
WHERE [seller_city] = '"04482255"'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = '"04482255"'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] LIKE '"%'

-- "novo hamburgo	RS
-- "rio de janeiro	RJ

SELECT REPLACE([seller_city],'"','') LEFT_SPACE_SELLER_CITY, [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] LIKE '"%'

--  novo hamburgo	RS
--  rio de janeiro  RJ
SELECT LTRIM(REPLACE([seller_city],'"','')) LEFT_SPACE_SELLER_CITY, [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] LIKE '"%'

-- novo hamburgo	RS
-- rio de janeiro	RJ

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = LTRIM(REPLACE([seller_city],'"',''))
WHERE [seller_city] LIKE '"%'

-- (2 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] LIKE '"%'

-- (0 rows affected)

SELECT [seller_city], [seller_state], [seller_zip_code_prefix]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sao paulo - sp'

--sao paulo - sp	SP	"05353"
--sao paulo - sp	SP	"04130"
--sao paulo - sp	SP	"04007" 

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'sao paulo'
WHERE [seller_city] = 'sao paulo - sp'

/*
(3 rows affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sao paulo - sp'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'rio de janeiro / rio de janeiro'
-- rio de janeiro / rio de janeiro	RJ

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'rio de janeiro'
WHERE [seller_city] = 'rio de janeiro / rio de janeiro'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'rio de janeiro / rio de janeiro'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'rio de janeiro \rio de janeiro'
-- rio de janeiro \rio de janeiro	RJ

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'rio de janeiro'
WHERE [seller_city] = 'rio de janeiro \rio de janeiro'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'rio de janeiro \rio de janeiro'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'cariacica / es'
-- 'cariacica / es'	   ES

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'cariacica'
WHERE [seller_city] = 'cariacica / es'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'cariacica / es'


-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sbc/sp'
-- sbc/sp	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'sbc'
WHERE [seller_city] = 'sbc/sp'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sbc/sp'

-- (0 rows affected)



SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'santo andre/sao paulo'
-- santo andre/sao paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'santo andre'
WHERE [seller_city] = 'santo andre/sao paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'santo andre/sao paulo'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sp / sp'
-- sp / sp	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'sao paulo'
WHERE [seller_city] = 'sp / sp'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sp / sp'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'maua/sao paulo'
-- maua/sao paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'maua'
WHERE [seller_city] = 'maua/sao paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'maua/sao paulo'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'mogi das cruzes / sp'
-- mogi das cruzes / sp	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'mogi das cruzes'
WHERE [seller_city] = 'mogi das cruzes / sp'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'mogi das cruzes / sp'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'barbacena/ minas gerais'
-- barbacena/ minas gerais	MG

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'barbacena'
WHERE [seller_city] = 'barbacena/ minas gerais'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'barbacena/ minas gerais'

-- (0 rows affected)



SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'andira-pr'
-- andira-pr	PR

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'andira'
WHERE [seller_city] = 'andira-pr'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'andira-pr'

-- (0 rows affected)



SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'pinhais/pr'
-- pinhais/pr	PR

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'pinhais'
WHERE [seller_city] = 'pinhais/pr'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'pinhais/pr'

-- (0 rows affected)

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'pinhais/pr'
-- pinhais/pr	PR

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'pinhais'
WHERE [seller_city] = 'pinhais/pr'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'pinhais/pr'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'ribeirao preto / sao paulo'
-- ribeirao preto / sao paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'ribeirao preto'
WHERE [seller_city] = 'ribeirao preto / sao paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'ribeirao preto / sao paulo'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'carapicuiba / sao paulo'
-- carapicuiba / sao paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'carapicuiba'
WHERE [seller_city] = 'carapicuiba / sao paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'carapicuiba / sao paulo'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sao sebastiao da grama/sp'
-- sao sebastiao da grama/sp	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'sao sebastiao da grama'
WHERE [seller_city] = 'sao sebastiao da grama/sp'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'sao sebastiao da grama/sp'

-- (0 rows affected)


SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'jacarei / sao paulo'
-- jacarei / sao paulo	SP

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'jacarei'
WHERE [seller_city] = 'jacarei / sao paulo'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'jacarei / sao paulo'

-- (0 rows affected)



SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'angra dos reis rj'
-- angra dos reis rj	RJ

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimSellers]
SET [seller_city] = 'angra dos reis'
WHERE [seller_city] = 'angra dos reis rj'

/*
(1 row affected)
*/

SELECT [seller_city], [seller_state]
FROM [Brazilian_Ecommerce_DW].[dim].[DimSellers]
WHERE [seller_city] = 'angra dos reis rj'

-- (0 rows affected)

