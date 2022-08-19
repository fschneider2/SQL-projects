--1 - Todos os clientes do estado de MG que tenham comprado o produto que contenha em seu nome “Sapatilha em Couro Vazada”

select 
	c.name,
	i.name,
	ca.state,
	o.id
from 
	customer c
join
	customer_address ca
on 
	ca.state = 'MG'
	and c.id = ca.customer_id 
join 
	orders o 
on 
	c.id = o.customer_id 
join 
	items i 
on 
	o.id = i.id
	and i.name like 'Sapatilha em Couro Vazad%'
--	and i.name like 'Sapatilha em Couro Vazada%'
	
-- Entendendo que pode ter um erro de digitação no banco de dados, fiz duas opções, uma exatamente como solicitado, 
--que não traz nenhuma respota, e uma com o Sapatilha em couro Vazad%, 
--que traz uma resposta, pois o item comprado é sapatilha em couro vazado com a letra o. 
	

--2 - Todos os nomes e telefones dos clientes do estado de SP que efetuaram compras cuja faixa de valor esteja acima de R$8.000

select 
	c.name,
	c.phone,
	ca.state,
	o.total
from 
	customer c 
join
	customer_address ca 
on 
	ca.state = 'SP'
	and c.id = ca.customer_id 
join 
	orders o
on 
	o.total > 8000
	and c.id = o.customer_id 
	

--3 - O nome do cliente que teve o maior desconto em sua compra e o valor do desconto obtido

select 
	c.name,
	max(discount)
from 
	customer c, orders o
where 
	c.id = o.customer_id 
group by 
	c."name" 
order by 
	max
desc 
limit 1
	

