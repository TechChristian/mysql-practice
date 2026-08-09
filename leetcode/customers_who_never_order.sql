-- A consulta faz um LEFT JOIN entre as tabelas Customers e Orders,
-- filtra os resultados para incluir apenas aqueles clientes que não têm correspondência na tabela Orders (ou seja, aqueles que nunca fizeram pedidos).

SELECT name AS Customers
FROM Customers
         LEFT JOIN Orders
                   ON Customers.id = Orders.customerId -- dar match entre id do cliente e o id do cliente na tabela Orders
WHERE Orders.customerId IS NULL -- retorna apenas clientes nullos na tabela orders.