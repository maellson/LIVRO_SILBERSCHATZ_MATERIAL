select nome_dept, count(distinct id_instrutor)as Contador_Instrutor
from uepb.instrutor natural join uepb.ministra
where semestre = 'Spring' and ano = 2010
group by nome_dept;