/*
*
*OPERAÇÕES DE CONJUNTO
*
*/


--       -------------------------
--UNIÃO  -------------------------
--       -------------------------

--CONJUNTO DE TODOS OS CURSOS MINISTRADOS NO SEMESTRE fall DE 2009
select id_curso
from uepb.secao
where (semestre, ano)= ('Fall', 2009);
--(Aqui existe diferenca ente maiúsculas e minúsculas);


--CONJUNTO DE TODOS OS CURSOS MINISTRADOS NO SEMESTRE spring DE 2009
select id_curso
from uepb.secao
where (semestre, ano)= ('Spring', 2010);
--(Aqui existe diferenca ente maiúsculas e minúsculas);

(select id_curso
from uepb.secao
where (semestre, ano)= ('Fall', 2009)
--(Aqui existe diferenca ente maiúsculas e minúsculas)
)
union all -- O ALL pode ser removido caso queira remover as duplicatas
(
select id_curso
from uepb.secao
where (semestre, ano)= ('Spring', 2010)
--(Aqui existe diferenca ente maiúsculas e minúsculas)
);



--            -------------------------
--INTERSECÇÃO -------------------------
--            -------------------------

(select id_curso
from uepb.secao
where (semestre, ano)= ('Fall', 2009)
--(Aqui existe diferenca ente maiúsculas e minúsculas)
)
intersect --(Poderria ser inserida a cláusula: ALL)
(
select id_curso
from uepb.secao
where (semestre, ano)= ('Spring', 2010)
--(Aqui existe diferenca ente maiúsculas e minúsculas)
);


--            -------------------------
-- EXCLUSÃO   -------------------------
--            -------------------------

(select id_curso
from uepb.secao
where (semestre, ano)= ('Fall', 2009)
--(Aqui existe diferenca ente maiúsculas e minúsculas)
)
EXCEPT
(
select id_curso
from uepb.secao
where (semestre, ano)= ('Spring', 2010)
--(Aqui existe diferenca ente maiúsculas e minúsculas)
);


--                 -------------------------
-- VALORES NULOS   -------------------------
--            	   -------------------------
select nome
from uepb.instrutor
where salario is not null;
