/*
*
*SUBCONSULTAS NA CLAUSULA FROM
*
*/
-----------------------------------------------------
--Mostra os salários médios dos instrutores de departamento onde o sala´rio médio é maior do que 42000
--
select nome_dept, sal_medio
from (select nome_dept, avg(salario)
	from uepb.instrutor
	group by nome_dept)
	as media_dept (nome_dept, sal_medio)
where sal_medio > 42000;
-----------------------------------------------------

--mostra as somas dos salários dos instrutores agrupados por departamento
--

select nome_Dept, sum(salario)
from uepb.instrutor
group by nome_dept;

-----------------------------------------------------

--achar dentre todos os departamentos, o máximo do salário total em cada departamento
--

select max(tot_salarios)
from (select nome_Dept, sum(salario)
from uepb.instrutor
group by nome_dept)as total_dept (nome_dept, tot_salarios);


------------------------------------------------------
--o salário mais alto dentre os professores de todos os departamentos
--

select max(tot_dept_sal)
from (select nome_dept,max(salario)
from uepb.instrutor
group by nome_dept)
as total_sal_dept(nome_dept, tot_dept_sal);
------------------------------------------------------
--Mostra a lista dos salários mais altos por departamento

select nome_dept,max(salario)
from uepb.instrutor
group by nome_dept;

----------------------------------------------------
--mostra o nome, o salario e o salario médio do departamento de cada professor
--

select nome, salario, sal_medio
from uepb.instrutor I1, 
lateral (select avg(salario) as sal_medio
from uepb.instrutor I2
where I2.nome_dept = I1.nome_dept) as salario_medio;

----------------------------------------------------
--mostra o orçamento de maior valor dentre os departamentos
--
with orcamento_max(valor) as
(select max(orcamento)
from uepb.departamento)
select orcamento
from uepb.departamento, orcamento_max
where uepb.departamento.orcamento = orcamento_max.valor;

-----------------------------------------------------------
--(não entendi essa questão de cima, pq mulesta fazer um negócio desse tamanho se eu poderia ter feito apenas isso!!??)

select max(orcamento)
from uepb.departamento;

-----------------------------------------------------------

--todos os departamento onde o total de salarios é maior que a média dos salário totais em todos os departamentos.
--
with total_dept(nome_dept, valor) as
(select nome_dept, sum (salario)
from uepb.instrutor
group by nome_dept),
total_dept_medio(valor)as
(select avg(valor)
from total_dept)
select nome_dept
from total_dept, total_dept_medio
where total_dept.valor >= total_dept_medio.valor;

--------------------------------------------------------------
--aqui sou eu destrinchando o código anterior

--Achei as somas dos salários de cada departamento

select nome_dept,sum(salario) as tot_salario
from uepb.instrutor
group by nome_dept
order by tot_salario desc;

--|
--|
--^
-------------------------------------------------------------

--achei a média das somas de todos os salário

select avg(tot_salario)
from (select nome_dept,sum(salario) as tot_salario
from uepb.instrutor
group by nome_dept
order by tot_salario desc) 
as valores;

-------------------------------------------------------------
/*
*
*SUBCONSULTAS ESCALARES
*
*/

------------------------------------------------------------

--lista todos os departamentos junto com o numero de instrutores em cada departamento
--

select nome_dept,
(select count(*) 
from uepb.instrutor as P
where D.nome_dept = P.nome_dept)
as num_professores
from uepb.departamento as D;

-------------------------------------------------------------

