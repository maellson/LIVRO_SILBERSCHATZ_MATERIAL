/*
*Operações básica adicionais
*/
--RENOMEAR
/*
SELECT nome AS nome_instrutor, id_curso
FROM uepb.instrutor, uepb.ministra
WHERE instrutor.id_instrutor = ministra.id_instrutor;
*/

--
--

/*
SELECT T.nome, M.id_curso
FROM uepb.instrutor AS T, uepb.ministra AS M
WHERE T.id_instrutor = M.id_instrutor;
*/

--
--

select distinct T.nome
from uepb.instrutor as T, uepb.instrutor as I
where T.salario > I.salario and I.nome_dept='History';
--(Encontre o nome dos instrutores que tem um salário maior do que o menor salário de um instrutor de história)





