/*
*
*FUNÇÕES AGREGADAS
*
*/

--MÉDIA: AVG
--MÍNIMO: MIN
--MÁXIMO: MAX
--TOTAL: SUM
--CONTAGEM: COUNT


--       -------------------------
--  AVG  -------------------------
--       -------------------------



select avg(salario) as salario_médio
from uepb.instrutor
where nome_dept like '%Comp.%';

---------------------------------------
---------------------------------------

select count (distinct id_instrutor)
from uepb.ministra
where semestre = 'Spring' and ano = 2010;

------------------------------------------
------------------------------------------
select count(*)
from uepb.curso;
-------------------------------------------
-------------------------------------------
select min(salario) as meu_salario
from uepb.instrutor;


--           -------------------------
--  group by -------------------------
--           -------------------------

select nome_dept, avg(salario)as sal_medio
from uepb.instrutor
group by nome_dept;
