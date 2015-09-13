/*
*
*PREDICADOS DA CLÁUSULA 'WHERE'
*
*/

select nome 
from uepb.instrutor
where salario between 90000 and 100000;

--
-- OU
--
select nome 
from uepb.instrutor
where salario not between 90000 and 100000;

--
--predicado
--

select nome as nome_instrutor, id_curso
from uepb.instrutor as I, uepb.ministra as M
where I.id_instrutor = M.id_instrutor and nome_dept = 'Biology';


--
--OUTRA FORMA-PREDICADO 
--

select nome as nome_instrutor, id_curso
from uepb.instrutor as I, uepb.ministra as M
where (I.id_instrutor, nome_dept) = (M.id_instrutor,'Biology');


