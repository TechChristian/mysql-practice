-- exercícios combinar duas tabelas, tabela person e address, utilizei LEFT JOIN para trazer todos os registros da tabela person e os registros correspondentes da tabela address, caso existam.
SELECT
    person.firstName,
    person.lastName,
    address.city,
    address.state
FROM person
         LEFT JOIN address
                   on person.personId = address.personId