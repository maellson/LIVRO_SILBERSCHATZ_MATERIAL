
----------------------------------------------------------------

---------                            ---------
-------    NÃO EXECUTAR ESTE COMANDO!   ----------
---------                            --------
update uepb.instrutor
set salario = case
		when salario <= 100000 then salario*1.05
		else salario *1.03
	     end;
-------------------------------------------------------------


--ESTES PODEM SER EXECUTADOS

---------------------------------------------------------------------



--atribuindo o total de creditos cursados pelos alunos

update uepb.aluno S
set tot_cred = (select sum(creditos)
from uepb.realiza natural join uepb.curso 
where S.id_aluno = realiza.id_aluno and
realiza.nota<>'F' and
realiza.nota is not null);

-----------------------------------------------------------------
update uepb.aluno S
set tot_cred = (
select case 
	when sum(creditos) is not null then sum(creditos)
	else 0
end
from uepb.realiza natural join uepb.curso 
where S.id_aluno = realiza.id_aluno and
realiza.nota<>'F' and
realiza.nota is not null);

----------------------------------------------------------------
