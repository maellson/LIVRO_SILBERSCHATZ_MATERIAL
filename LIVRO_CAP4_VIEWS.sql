/*
*
*
*VIEWS DIA 01/07/2015
*
*/

--CRIANDO A PRIMEIRA VIEW

create view uepb.Docente as 
select id_instrutor, nome, nome_dept
from uepb.instrutor;

----------
create view uepb.Computacao_primavera_2010 as 
select curso.id_curso, id_sec, predio, numero_sala, ano
from uepb.curso, uepb.secao
where curso.id_curso = secao.id_curso
	and curso.nome_dept = 'Comp. Sci.'
	and secao.semestre = 'Spring'
	and secao.ano = 2010;
	
---------

select id_curso
from uepb.Computacao_primavera_2010
where predio = 'Watson';

----------------

create view uepb.sal_total_depts(nome_dept, salario_total) as
select nome_dept, sum (salario)
from uepb.instrutor
group by nome_dept;

----------------------------

/*----------------------------------\
*
*TRANSAÇÕES
*
*/
------------------------------------\

/*Commit work: 
confirma a transação atual, ou seja, torna as atualizações realizadas 
pela transação permanentes no banco de dados.*/

----------------------------------------------------------

/*RollBack work: 
Faz com que a transação atual seja revertida, ou seja, desfaz todas as 
atualizações realizadas pelos comandos SQL na transação.
Assim o estado do banco de dados é restaurado ao que era antes que o 
primeiro comando da transação fosse executado.*/
