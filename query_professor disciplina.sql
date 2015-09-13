select  instrutor.id_instrutor, nome, instrutor.nome_dept, curso.id_curso,curso.titulo
from uepb.instrutor, uepb.curso, uepb.ministra
where instrutor.id_instrutor=ministra.id_instrutor and ministra.id_curso=curso.id_curso 
order by instrutor.id_instrutor