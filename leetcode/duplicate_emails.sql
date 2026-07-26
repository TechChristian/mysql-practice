/*
 Input:
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

Output:
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
 */

SELECT email
from Person
GROUP BY email -- agrupa os emails iguais
HAVING COUNT(email) > 1 -- HAVING é usado para filtrar os resultados de uma agregação, neste caso, estamos filtrando para mostrar apenas os emails que aparecem mais de uma vez na tabela Person.