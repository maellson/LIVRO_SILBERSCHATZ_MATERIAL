create table if not exists uepb.sala
(
predio varchar (15),
numero_sala varchar(7),
capacidade numeric(4,0),
primary key (predio, numero_sala)
);

create table if not exists uepb.departamento
(
nome_dept varchar(20),
predio varchar(15),
orcamento numeric(12,2) check (orcamento > 0),
primary key (nome_dept)
);


create table if not exists uepb.aluno
(id_aluno varchar (5),
nome varchar(20) not null,
nome_dept varchar(20),
tot_cred numeric (3,0) check (tot_cred >=0),
primary key (id_aluno),
foreign key (nome_dept)references uepb.departamento (nome_dept) on delete set null
);

create table if not exists uepb.realiza
(
id_aluno varchar(5),
id_curso varchar(8),
id_sec varchar (8),
semestre varchar(6),
ano numeric(4,0),
nota varchar(2),
primary key (id_aluno, id_curso, id_sec, semestre,ano),
foreign key (id_curso, id_sec, semestre, ano) references uepb.secao(id_curso, id_sec, semestre, ano) on delete cascade, 
foreign key (id_aluno) references uepb.aluno(id_aluno) on delete cascade
);

create table if not exists uepb.monitor
(
id_aluno varchar(5),
id_instrutor varchar (5),
primary key (id_aluno),
foreign key (id_instrutor) references uepb.instrutor (id_instrutor) on delete set null,
foreign key (id_aluno) references uepb.aluno(id_aluno) on delete cascade
);

create table if not exists uepb.prereq
(
id_curso varchar(8),
id_prereq varchar(8),
primary key (id_curso, id_prereq),
foreign key (id_curso) references uepb.curso (id_curso) on delete cascade,
foreign key (id_prereq) references uepb.curso(id_curso)
);

create table if not exists uepb.periodo
(
id_periodo varchar(4),
dia varchar(1) check (dia in ('M', 'T','W','R','F','S','U')),
hora_inicial time,
hora_final time,
primary key (id_periodo, dia, hora_inicial)
);