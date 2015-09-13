/*
*
*CAPÍTULO 4 - SQL INTERMEDIÁRIA
*
*/

--condições de join

select * 
from uepb.aluno join uepb.realiza on aluno.id_aluno = realiza.id_aluno;

--

select *
from uepb.aluno, uepb.realiza
where aluno.id_aluno = realiza.id_aluno;

---
select *
from uepb.aluno natural left outer join uepb.realiza;

----

select *
from uepb.aluno natural left outer join uepb.realiza
where id_curso is null;

----

select *
from uepb.realiza natural right outer join uepb.aluno;

---
select *
from (select* 
	from uepb.aluno
	where nome_dept = 'Comp. Sci.') as alunos
    natural full outer join 
     (select *
	from uepb.realiza
	where semestre = 'Spring' and ano = 2009) as realiza;
----

select *
  from (select* 
	from uepb.aluno
	where nome_dept = 'Comp. Sci.') as alunos_Comp
    natural right outer join
     (select *
	from uepb.realiza
	where semestre = 'Spring' and ano = 2009) as realiza_Spring;
---

select *
from uepb.aluno left outer join uepb.realiza
on aluno.id_aluno = realiza.id_aluno;

---

select *
from uepb.aluno left outer join uepb.realiza on true
where aluno.id_aluno = realiza.id_aluno;

---

--alguns testes por fora
select count (distinct id_instrutor)
from uepb.ministra 
where semestre = 'Spring' and ano= 2010;

--continuação

-------------------------------------------------------------------------------------------\
select *
from uepb.aluno join uepb.realiza on aluno.id_aluno = realiza.id_aluno;

--é igual a:
select*
from uepb.aluno join uepb.realiza using(id_aluno);
--que é igual a:
select *
from uepb.aluno inner join uepb.realiza using(id_aluno);


--já assim gera o produto cartesiano
select *
from uepb.aluno join uepb.realiza on true;

-------------------------------------------------------------------------------------------\

