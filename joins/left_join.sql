-- identifique qual é o gênero mais frequente nos clientes que compraram automóveis no site.
-- obs: utilizar a tabela tem_tables.ibge_genders

select ibge.gender,
       count(fun.paid_date) -- conta quantas compras e agrupam
from sales.funnel as fun
         left join sales.customers as cus
                   on fun.customer_id = cus.customer_id
         left join temp_tables.ibge_genders as ibge
                   on lower(cus.first_name) = ibge.first_name -- lower transforma em minúsculas
group by ibge.gender -- agrupa em duas colunas 'male' ou 'female' a contagem que se repete.
