/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10/08/2015 10:57:04                          */
/*==============================================================*/


alter table TB_ACOMODACAO
   drop constraint TB_ACMD_REF_MODEL_ACMD;

alter table TB_ACOMODACAO
   drop constraint TB_ACMD_REF_TB_BAIRRO;

alter table TB_ACOMODACAO
   drop constraint TB_ACMD_REF_TB_CLIENTE;

alter table TB_ACOMODACAO
   drop constraint TB_ACMD_REF_TB_TIP_CLIENT;

alter table TB_ACOMODACAO
   drop constraint TB_ACMD_REF_TIPO_ACMD;

alter table TB_CLIENTE_ACOMODACAO
   drop constraint TB_CLIENTE_ACOM_REF_TB_CLIENTE;

alter table TB_CLIENTE_ACOMODACAO
   drop constraint TB_CLIENT_ACMD_REF_TB_TIP_ACMD;

alter table TB_CLIENTE_BAIRRO
   drop constraint TB_CLIENT_BAIRRO_TB_BAIRRO;

alter table TB_CLIENTE_BAIRRO
   drop constraint TB_CLIENT_BAIRRO_TB_CLIENT;

alter table TB_USUARIO
   drop constraint TB_USUARIO_REF_CLIENTE;

alter table TB_USUARIO
   drop constraint TB_USUARIO_REF_TIPO_USUARIO;

drop table TB_ACOMODACAO cascade constraints;

drop table TB_BAIRRO cascade constraints;

drop table TB_CLIENTE cascade constraints;

drop table TB_CLIENTE_ACOMODACAO cascade constraints;

drop table TB_CLIENTE_BAIRRO cascade constraints;

drop table TB_MODELO_ACOMODACAO cascade constraints;

drop table TB_TIPO_ACOMODACAO cascade constraints;

drop table TB_TIPO_CLIENTE cascade constraints;

drop table TB_TIPO_USUARIO cascade constraints;

drop table TB_USUARIO cascade constraints;

drop sequence SEQ_ACOMODACAO;

drop sequence SEQ_BAIRRO;

drop sequence SEQ_CLIENTE;

drop sequence SEQ_MODELO_ACOMODACAO;

drop sequence SEQ_TIPO_ACOMODACAO;

drop sequence SEQ_TIPO_CLIENTE;

drop sequence SEQ_TIPO_USUARIO;

drop sequence SEQ_USUARIO;

create sequence SEQ_ACOMODACAO
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_BAIRRO
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_CLIENTE
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_MODELO_ACOMODACAO
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_TIPO_ACOMODACAO
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_TIPO_CLIENTE
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_TIPO_USUARIO
increment by 1
start with 1
 maxvalue 999999
 nocache;

create sequence SEQ_USUARIO
increment by 1
start with 1
 maxvalue 999999
 nocache;

/*==============================================================*/
/* Table: TB_ACOMODACAO                                         */
/*==============================================================*/
create table TB_ACOMODACAO 
(
   SEQ_ACOMODACAO       NUMBER(6)            not null,
   SEQ_MODELO_ACOMODACAO NUMBER(6),
   SEQ_TIPO_ACOMODACAO  NUMBER(6),
   SEQ_BAIRRO           NUMBER(6),
   SEQ_CLIENTE          NUMBER(6),
   SEQ_TIPO_CLIENTE     NUMBER,
   SIT_OCUPADO          VARCHAR2(1)         
      constraint CKC_SIT_OCUPADO_TB_ACOMO check (SIT_OCUPADO is null or (SIT_OCUPADO in ('S','N'))),
   DAT_INICIO_OCUPACAO  DATE,
   NUM_DIAS_OCUPACAO    NUMBER(6)           
      constraint CKC_NUM_DIAS_OCUPACAO_TB_ACOMO check (NUM_DIAS_OCUPACAO is null or (NUM_DIAS_OCUPACAO >= 1)),
   VLR_DIARIA           NUMBER(12,2)         not null,
   QTD_CAMA_EXTRA       NUMBER,
   constraint PK_TB_ACOMODACAO primary key (SEQ_ACOMODACAO)
);

comment on column TB_ACOMODACAO.SEQ_ACOMODACAO is
'Campo auto_Incremento para a tabela ACOMODACAO, ele serve como chave primaria.';

comment on column TB_ACOMODACAO.SEQ_MODELO_ACOMODACAO is
'SEQUENCIAL DO MODELO DE ACOMODAÇÕES';

comment on column TB_ACOMODACAO.SEQ_TIPO_ACOMODACAO is
'SEQUENCIAL DO TIPO DE ACOMODAÇÃO';

comment on column TB_ACOMODACAO.SEQ_BAIRRO is
'SEQUENCIAL DA TABELA BAIRRO';

comment on column TB_ACOMODACAO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE';

comment on column TB_ACOMODACAO.SEQ_TIPO_CLIENTE is
'SEQUENCIAL TIPO CLIENTE';

comment on column TB_ACOMODACAO.SIT_OCUPADO is
'Flag de ocupado, sim ou nao';

comment on column TB_ACOMODACAO.DAT_INICIO_OCUPACAO is
'Informa a data que a acomodação foi ocupada';

comment on column TB_ACOMODACAO.NUM_DIAS_OCUPACAO is
'Informa o numero de dias que o clientes passará ocupando a acomodação';

comment on column TB_ACOMODACAO.VLR_DIARIA is
'Informa o valor da diária da acomodação';

comment on column TB_ACOMODACAO.QTD_CAMA_EXTRA is
'Mostra a quantidade de camas extras que podem ser colocadas em uma acomodação do tipo apartamento';

/*==============================================================*/
/* Table: TB_BAIRRO                                             */
/*==============================================================*/
create table TB_BAIRRO 
(
   SEQ_BAIRRO           NUMBER(6)            not null,
   NOM_BAIRRO           VARCHAR2(50)         not null,
   constraint PK_TB_BAIRRO primary key (SEQ_BAIRRO)
);

comment on table TB_BAIRRO is
'Penso em colocar um aditivos para bairros de alto nível, isto possibilitaria aumentar o preço de alguns tipos de vagas.
Por exemplo,  uma vaga no catolé seria mais cara do que uma vaga no verdejante.
Pra isto eu teria que definir um nivelamento para bairros, talvez com uma nova tabela.';

comment on column TB_BAIRRO.SEQ_BAIRRO is
'SEQUENCIAL DA TABELA BAIRRO';

comment on column TB_BAIRRO.NOM_BAIRRO is
'NOME DO BAIRRO';

/*==============================================================*/
/* Table: TB_CLIENTE                                            */
/*==============================================================*/
create table TB_CLIENTE 
(
   SEQ_CLIENTE          NUMBER(6)            not null,
   NOM_CLIENTE          VARCHAR2(50)         not null,
   TIP_SEXO             VARCHAR2(1)          not null,
   DAT_NASCIMENTO       DATE,
   DSC_NASCIONALIDADE   VARCHAR2(30),
   DSC_ENDERECO         VARCHAR2(50),
   DSC_OCUPACAO         VARCHAR2(30),
   constraint PK_TB_CLIENTE primary key (SEQ_CLIENTE)
);

comment on column TB_CLIENTE.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE';

comment on column TB_CLIENTE.DSC_ENDERECO is
'Este campo aloca o endereço do cliente, logradouro, e num_logradouro. Acredito que ficaria melhor separadas em tabelas distintas, não inclusas ao clientes, mas isto é coisa par aser analisada posteriormente.';

/*==============================================================*/
/* Table: TB_CLIENTE_ACOMODACAO                                 */
/*==============================================================*/
create table TB_CLIENTE_ACOMODACAO 
(
   SEQ_CLIENTE          NUMBER(6),
   SEQ_TIPO_ACOMODACAO  NUMBER(6),
   COD_PRIORIDADE       NUMBER
);

comment on table TB_CLIENTE_ACOMODACAO is
'Esta tabela armazena um conjunto de prioridades de acomodações de acordo com o usuario.';

comment on column TB_CLIENTE_ACOMODACAO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE';

comment on column TB_CLIENTE_ACOMODACAO.SEQ_TIPO_ACOMODACAO is
'SEQUENCIAL DO TIPO DE ACOMODAÇÃO';

/*==============================================================*/
/* Table: TB_CLIENTE_BAIRRO                                     */
/*==============================================================*/
create table TB_CLIENTE_BAIRRO 
(
   SEQ_CLIENTE          NUMBER(6),
   SEQ_BAIRRO           NUMBER(6),
   COD_PRIORIDADE       NUMBER               not null
);

comment on column TB_CLIENTE_BAIRRO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE';

comment on column TB_CLIENTE_BAIRRO.SEQ_BAIRRO is
'SEQUENCIAL DA TABELA BAIRRO';

comment on column TB_CLIENTE_BAIRRO.COD_PRIORIDADE is
'Campo que armazena as prioridades de um cliente pelo bairro, quanto menor o nuemro maior será a prioridade. Exemplo, bairros com prioridade 1 são os preferidos pelos clientes.';

/*==============================================================*/
/* Table: TB_MODELO_ACOMODACAO                                  */
/*==============================================================*/
create table TB_MODELO_ACOMODACAO 
(
   SEQ_MODELO_ACOMODACAO NUMBER(6)            not null,
   TIP_MODELO           VARCHAR2(30),
   constraint PK_TB_MODELO_ACOMODACAO primary key (SEQ_MODELO_ACOMODACAO)
);

comment on table TB_MODELO_ACOMODACAO is
'Estou pensando em adicionar o modelo casa, pois quarto, vaga e apartamento são mínimos.
O tipo casa providencia a acomodação do tipo casa de praia.';

comment on column TB_MODELO_ACOMODACAO.SEQ_MODELO_ACOMODACAO is
'SEQUENCIAL DO MODELO DE ACOMODAÇÕES';

/*==============================================================*/
/* Table: TB_TIPO_ACOMODACAO                                    */
/*==============================================================*/
create table TB_TIPO_ACOMODACAO 
(
   SEQ_TIPO_ACOMODACAO  NUMBER(6)            not null,
   TIP_ACOMODACAO       VARCHAR2(30)         not null,
   TAX_DESCONTO         NUMBER(5,2),
   constraint PK_TB_TIPO_ACOMODACAO primary key (SEQ_TIPO_ACOMODACAO)
);

comment on table TB_TIPO_ACOMODACAO is
'o programa de acomodações oferece, para estudantes, descontos, no valor das diárias, que variam de acordo com o tipo da acomodação (Vaga):

Simples – 10%
Confortável – 20%
Luxo – 30%
';

comment on column TB_TIPO_ACOMODACAO.SEQ_TIPO_ACOMODACAO is
'SEQUENCIAL DO TIPO DE ACOMODAÇÃO';

/*==============================================================*/
/* Table: TB_TIPO_CLIENTE                                       */
/*==============================================================*/
create table TB_TIPO_CLIENTE 
(
   SEQ_TIPO_CLIENTE     NUMBER(6)            not null,
   DSC_TIPO_CLIENTE     VARCHAR2(20),
   constraint PK_TB_TIPO_CLIENTE primary key (SEQ_TIPO_CLIENTE)
);

comment on table TB_TIPO_CLIENTE is
'Esta Tabela armazena o TipoCliente (Nacional, Internacional ou Estudante), de acordo com o tipo do cliente, para estudantes, o sistema poderá oferecer descontos, no valor das diárias, que variam de acordo com o tipo da acomodação (Vaga):

Simples – 10%
Confortável – 20%
Luxo – 30%
';

comment on column TB_TIPO_CLIENTE.SEQ_TIPO_CLIENTE is
'SEQUENCIAL TIPO CLIENTE';

/*==============================================================*/
/* Table: TB_TIPO_USUARIO                                       */
/*==============================================================*/
create table TB_TIPO_USUARIO 
(
   SEQ_TIPO_USUARIO     NUMBER(6)            not null,
   DSC_TIPO_USUARIO     VARCHAR2(20),
   constraint PK_TB_TIPO_USUARIO primary key (SEQ_TIPO_USUARIO)
);

comment on table TB_TIPO_USUARIO is
'Armazenaos tipos de uruários qu poderão utilizar o sistema;';

comment on column TB_TIPO_USUARIO.SEQ_TIPO_USUARIO is
'SEQUENCIAL DO TIPO DE USUÁRIO';

/*==============================================================*/
/* Table: TB_USUARIO                                            */
/*==============================================================*/
create table TB_USUARIO 
(
   SEQ_USUARIO          NUMBER(6)            not null,
   SEQ_CLIENTE          NUMBER(6),
   SEQ_TIPO_USUARIO     NUMBER,
   DSC_LOGIN            VARCHAR2(10),
   DSC_SENHA            VARCHAR2(20),
   constraint PK_TB_USUARIO primary key (SEQ_USUARIO)
);

comment on column TB_USUARIO.SEQ_USUARIO is
'SEQUENCIAL DE USUÁRIO';

comment on column TB_USUARIO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE';

comment on column TB_USUARIO.SEQ_TIPO_USUARIO is
'SEQUENCIAL DO TIPO DE USUÁRIO';

alter table TB_ACOMODACAO
   add constraint TB_ACMD_REF_MODEL_ACMD foreign key (SEQ_MODELO_ACOMODACAO)
      references TB_MODELO_ACOMODACAO (SEQ_MODELO_ACOMODACAO);

alter table TB_ACOMODACAO
   add constraint TB_ACMD_REF_TB_BAIRRO foreign key (SEQ_BAIRRO)
      references TB_BAIRRO (SEQ_BAIRRO);

alter table TB_ACOMODACAO
   add constraint TB_ACMD_REF_TB_CLIENTE foreign key (SEQ_CLIENTE)
      references TB_CLIENTE (SEQ_CLIENTE);

alter table TB_ACOMODACAO
   add constraint TB_ACMD_REF_TB_TIP_CLIENT foreign key (SEQ_TIPO_CLIENTE)
      references TB_TIPO_CLIENTE (SEQ_TIPO_CLIENTE);

alter table TB_ACOMODACAO
   add constraint TB_ACMD_REF_TIPO_ACMD foreign key (SEQ_TIPO_ACOMODACAO)
      references TB_TIPO_ACOMODACAO (SEQ_TIPO_ACOMODACAO);

alter table TB_CLIENTE_ACOMODACAO
   add constraint TB_CLIENTE_ACOM_REF_TB_CLIENTE foreign key (SEQ_CLIENTE)
      references TB_CLIENTE (SEQ_CLIENTE);

alter table TB_CLIENTE_ACOMODACAO
   add constraint TB_CLIENT_ACMD_REF_TB_TIP_ACMD foreign key (SEQ_TIPO_ACOMODACAO)
      references TB_TIPO_ACOMODACAO (SEQ_TIPO_ACOMODACAO);

alter table TB_CLIENTE_BAIRRO
   add constraint TB_CLIENT_BAIRRO_TB_BAIRRO foreign key (SEQ_BAIRRO)
      references TB_BAIRRO (SEQ_BAIRRO);

alter table TB_CLIENTE_BAIRRO
   add constraint TB_CLIENT_BAIRRO_TB_CLIENT foreign key (SEQ_CLIENTE)
      references TB_CLIENTE (SEQ_CLIENTE);

alter table TB_USUARIO
   add constraint TB_USUARIO_REF_CLIENTE foreign key (SEQ_CLIENTE)
      references TB_CLIENTE (SEQ_CLIENTE);

alter table TB_USUARIO
   add constraint TB_USUARIO_REF_TIPO_USUARIO foreign key (SEQ_TIPO_USUARIO)
      references TB_TIPO_USUARIO (SEQ_TIPO_USUARIO);

