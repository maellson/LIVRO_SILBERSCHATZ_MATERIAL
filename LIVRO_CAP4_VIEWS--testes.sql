select curso.id_curso, id_sec, predio, numero_sala, ano
from uepb.curso, uepb.secao
where curso.id_curso = secao.id_curso
	and curso.nome_dept = 'Comp. Sci.'
	and secao.semestre = 'Spring'
	and secao.ano = 2010;

----

select id_curso, numero_sala
from uepb.Computacao_primavera_2010
where predio = 'Watson';

------

