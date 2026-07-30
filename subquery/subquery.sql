-- as subquery servem para consultar dados de outras consultas.
-- seus tipos são: where, with, select, from

-- WHERE
select *
from sales.products
where price = (select min(price) from sales.products) -- subquery

-- WITH
-- calcule a idade média por status profissional.
    with calculo_idade as (
	select professional_status,
		(current_date - birth_date) / 365 as idade -- data de hoje - data de nasc.
from sales.customers
)

select professional_status,
       avg(idade) as idade_media
from calculo_idade
group by professional_status

-- SELECT

-- Na tabela sales.funnel crie uma coluna que informe o numero de visitas acumuladas
-- que a loja visitada recebeu até o momento.
select * from sales.funnel
select
    fun.visit_id,
    fun.visit_page_date,
    sto.store_name,
    (
        select count(*)
        from sales.funnel as fun2
        where fun2.visit_page_date <= fun.visit_page_date
          and fun2.store_id = fun.store_id
    ) as visitas_acumuladas
from sales.funnel as fun
         left join sales.stores as sto
                   on fun.store_id = sto.store_id
order by sto.store_name, fun.visit_page_date