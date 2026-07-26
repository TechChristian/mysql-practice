
-- WHERE
select *
from sales.products
where price >= 100000 -- condição.

-- IN
select *
from sales.products
where brand in ('HONDA', 'TOYOTA') -- me retorna carros das marcas passadas nas listas.

-- LIKE (retorna valores que contenham o padrão passado)
SELECT distinct first_name
from sales.customers
where first_name like 'ANA%' -- retorno "anailton, anac, anadir"

-- IS NULL
where 'nome tabela' is null -- retorna dados nulos.