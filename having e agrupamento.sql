--utilizando o clausula having com o agrupamento group by.


select id_curso, semestre, ano, id_sec,count(id_aluno), avg (tot_cred)
from uepb.realiza natural join uepb.aluno
where ano =2009
group by id_curso, semestre, ano, id_sec
having count (id_aluno)>=2;


-- Caso queira ver a tabela join inteira
/*select *
from uepb.aluno natural join uepb.realiza
order by ano;
*/
