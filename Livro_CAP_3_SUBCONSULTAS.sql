/*
*
*SUBCONSULTAS ANINHADAS
*
*/


select id_curso 
from uepb.secao
where semestre = 'Fall' and ano = 2009 and
     id_curso in (select id_curso
		  from uepb.secao
		  where semestre = 'Spring' and ano = 2010
     ) ;

-------------------------------------------------------------------------------------------------------------------------


     
SELECT distinct  nome
from uepb.instrutor
where nome not in ('Mozart', 'Einstein');



---------------------------------------------------------------------------------------------------------------------------


select count (distinct id_aluno)
from uepb.realiza
where(id_curso, id_sec, semestre, ano) in (select id_curso, id_sec, semestre, ano 
					   from uepb.ministra
					   where ministra.id_instrutor ='10101'
						);

---------------------------------------------------------------------------------------------------------------------------


----COMPARAÇÃO DE CONJUNTO


-------------------------------------------------------------------------------------------------------------------------

select distinct T.nome, T.salario
from uepb.instrutor as T, uepb.instrutor as S
where T.salario > S.salario and S.nome_dept = 'Biology'
order by salario;

-------------------------------------------------------------------------------------------------------------------------
select nome, salario
from uepb.instrutor
where salario >some(select salario
		    from uepb.instrutor
		    where nome_dept= 'Finance');
-------------------------------------------------------------------------------------------------------------------------


select nome, salario
from uepb.instrutor
where salario >all(select salario
		    from uepb.instrutor
		    where nome_dept= 'Finance');


		    
-------------------------------------------------------------------------------------------------------------------------

select nome_dept
from uepb.instrutor
group by nome_dept
having avg (salario) >= all(select avg (salario)
		    from uepb.instrutor
		    group by nome_dept);
-------------------------------------------------------------------------------------------------------------------------

----TESTE DE RELAÇÕES VAZIAS


-------------------------------------------------------------------------------------------------------------------------

select id_curso 
from uepb.secao as S
where semestre = 'Fall' and ano = 2009 and
     exists (select *
		  from uepb.secao as T
		  where semestre = 'Spring' and ano = 2010
		  and S.id_curso = T.id_curso);
 
-------------------------------------------------------------------------------------------------------------------------
select S.id_aluno, S.nome
from uepb.aluno as S
where not exists (

	(
	select id_curso
	from uepb.curso
	where nome_dept= 'Comp. Sci.')
	except
	(select T.id_curso
	from uepb.realiza as T
	where S.id_aluno = T.id_aluno)

	
);
-------------------------------------------------------------------------------------------------------------------------

select T.id_curso
from uepb.curso as T
 Where 1 >= (
	select R.id_curso
	from uepb.secao as R
	where T.id_curso = R.id_curso and R.ano = 2009
	);