-- (Exercício 1)  identifique qual é o gênero mais frequente nos clientes que compraram automóveis no site.
-- obs: utilizar a tabela tem_tables.ibge_genders

select ibge.gender,
       count(fun.paid_date) -- conta quantas compras e agrupam
from sales.funnel as fun
         left join sales.customers as cus
                   on fun.customer_id = cus.customer_id
         left join temp_tables.ibge_genders as ibge
                   on lower(cus.first_name) = ibge.first_name -- lower transforma em minúsculas
group by ibge.gender -- agrupa em duas colunas 'male' ou 'female' a contagem que se repete.


--  (Exercício 2) Identifique de quais regiões são os clientes que mais visitam o site.
-- obs: Utilizar a tabela tem_tables.regions

select reg.region,
       count(fun.visit_page_date) as visitas
from sales.funnel as fun
         left join sales.customers as cus
                   on fun.customer_id = cus.customer_id
         left join temp_tables.regions as reg
                   on lower(cus.city) = lower(reg.city)
                       and lower(cus.state) = lower(reg.state)
group by reg.region
order by visitas desc

-- (Exercício 3) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

select pro.brand,
       count(visit_page_date) as visitas

from sales.funnel as fun
         left join sales.products as pro
                   on fun.product_id = pro.product_id
group by brand
order by visitas

-- (Exercício 4) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
select * from sales.funnel
select * from sales.stores

select stor.store_name,
       count(visit_page_date) as visitas
from sales.funnel as fun
         left join sales.stores as stor
                   on fun.store_id = stor.store_id
group by stor.store_name
order by visitas desc


-- (Exercício 5) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

select * from sales.customers
select * from temp_tables.regions

select reg.size,
       count(*) as contagem
from sales.customers as cus
         left join temp_tables.regions as reg
                   on lower (cus.city) = lower(reg.city)
                       and lower (cus.state) = lower (reg.state)
group by reg.size


