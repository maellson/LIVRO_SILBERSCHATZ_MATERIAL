/**
*
*Algumas dicas
*
*/
--
--ATRIBUTO CLÁUSULA SELECT
--
select I.*
from uepb.instrutor as I, uepb.ministra as M
where I.id_instrutor = M.id_instrutor;


--
--ORDEM DE CLASSIFICAÇÃO
--
select nome as nome_professor, nome_dept as departamento
from uepb.instrutor as Professor
where nome_dept like 'Phy%'
order by nome_professor;

select *
from uepb.instrutor as p
order by salario desc, nome asc;
--(Aqui, instrutor em ordem decrescente de salário, mas caso vários instrutores tenham o mesmo salário, serão ordenados de forma crescente.)