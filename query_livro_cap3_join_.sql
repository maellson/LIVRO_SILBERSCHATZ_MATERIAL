--(Aqui a junção natural de instrutor e ministra é calculada, e depois é feito um produto cartesiano desse resultado)

/*select nome, titulo
from uepb.instrutor natural join uepb.ministra, uepb.curso
order by ministra.id_curso;
where uepb.ministra.id_curso = uepb.curso.id_curso; */



--

/*(Aqui são comparados os atributos node_dept e id_curso, diferentement da query à cima onde é feito o produto cartesiano, neste caso se os 
instrutores atuarem em departamentos diferentes dos de origem não apareceram na query)*/

/*SELECT nome, titulo
FROM uepb.instrutor natural join uepb.ministra natural join uepb.curso;*/


--


--(Aqui eu consigo especificar exatamente quais colunas devem ser igualadas, neste caso deixando de lado nome_dept e igualando apenas id_curso)

select nome, titulo
from (uepb.instrutor natural join uepb.ministra) join uepb.curso using (id_curso);
