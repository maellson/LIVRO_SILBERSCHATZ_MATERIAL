/*
*
*OPERAÇÕES COM STRINGS
*
*/

/*
select nome_dept
from uepb.departamento
where predio LIKE 'ab\%cd%' escape '\';
--(Aqui é usado uma barra invertida para demonstrar o caractere de escape.)
--(Combina com todas as Strings começando com "ab%cd")
*/
--
--

select nome_dept
from uepb.departamento
where predio LIKE 'Wat%';