-- COUNT
select count(*)
from sales.funnel -- contagem de todas as linhas dessa tabela.

select count(paid_date) -- conta e verifica valores diferentes de nullos.
from sales.funnel -- contagem das linhas de uma coluna, bom que evita dados nullos.

-- contagem de produtos distintos (exclusivos) visitados em jan/21
select count(distinct product_id)
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31'

--MAX, MIN, AVG
select min(price), max (price), avg(price)
from sales.products

select *
from sales.products
where price = (select max(price) from sales.products) -- retorna todas as informações do carro mais caro da tabela.

-- GROUP BY
/* → O `GROUP BY` pega todas as linhas e cria grupos com os valores iguais.

exemplos:

grupo 1:

chris, chris, chris

grupo 2:

lopes, lopes, lopes
 */
SELECT state, count(*) as contagem_total
FROM sales.customers
group by state -- torna o state parte do grupo da contagem, ou seja me retorna a contagem total de cada 'state'.
order by contagem_total desc

-- adicionamos mais uma coluna.
SELECT state, professional_status, count(*) as contagem_total
FROM sales.customers
group by state, professional_status
order by state,contagem_total desc

-- HAVING
-- filtra como where, porém, o having é utilizado para colunas agregadas.
SELECT
    state,
    count(*)
from sales.customers
where state <> 'DF' -- não é coluna agregada, então funciona.
group by state
having count(*) < 100 -- coluna agregada utiliza having.

SELECT
    state,
    count(*) AS habitantes
from sales.customers
group by state
having count(*) < 100. -- é possível utilizar o having como outros tipos de filtros que não seja agregados.
   and state <> 'RN' -- '<>' operador de diferente.
