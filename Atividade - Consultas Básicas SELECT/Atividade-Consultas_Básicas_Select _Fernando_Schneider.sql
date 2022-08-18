-- 1 - Todos os clientes do estado de MG

select * from customer_address where state = 'MG'

--2 - Todos os clientes do sexo masculino que moram na cidade de São Paulo (capital)

select
	distinct
	c.name,
	c.gender,
	ca.city
from
	customer_address as ca,
	customer as c
where
	c.id = ca.customer_id 
	and ca.city = 'São Paulo'
	and c.gender = 'male'

--3 - Todas as compras acima de R$3.000,00 em ordem crescente

select * from orders where total > 3000 order by total

--4 - Todos os produtos que tenham em seu nome “Sapatilha em Couro Vazada”

-- Para essa questão, fiz duas respostas:
-- na primeira trago a informação exatamente como solicitada.
-- na segunda, corrijo um possivel erro de digitação, pois alguns produtos possuem em seu nome "Sapatilha em Couro Vazado", que pode, ou não ser um produto de mesma categoria.

select * from items where "name" like 'Sapatilha em Couro Vazada%'
select * from items where "name" like 'Sapatilha em Couro Vazad%'
