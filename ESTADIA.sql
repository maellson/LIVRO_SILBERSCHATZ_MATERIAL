/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     06/08/2015 20:26:41                          */
/*==============================================================*/



-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;

-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/


drop trigger MAELSON.COMPOUNDDELETETRIGGER_ACOMODAC
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_ACOMODAC
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_ACOMODAC
/

drop trigger MAELSON.TIB_ACOMODACAO
/

drop trigger MAELSON.COMPOUNDDELETETRIGGER_TB_BAIRR
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_BAIRR
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_BAIRR
/

drop trigger MAELSON.TIB_TB_BAIRRO
/

drop trigger MAELSON.COMPOUNDDELETETRIGGER_TB_CLIEN
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_CLIEN
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_CLIEN
/

drop trigger MAELSON.TIB_TB_CLIENTES
/

drop trigger MAELSON.COMPOUNDDELETETRIGGER_TB_CLIEN
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_CLIEN
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_CLIEN
/

drop trigger MAELSON.TIB_TB_CLIENTE_BAIRRO
/

drop trigger MAELSON.COMPOUNDDELETETRIGGER_TB_MODEL
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_MODEL
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_MODEL
/

drop trigger MAELSON.TIB_TB_MODELO_ACOMODACAO
/

drop trigger MAELSON.COMPOUNDDELETETRIGGER_TB_TIPO_
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_TIPO_
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_TIPO_
/

drop trigger MAELSON.TIB_TB_TIPO_ACOMODACAI
/

drop trigger COMPOUNDDELETETRIGGER_TB_TIPO_
/

drop trigger COMPOUNDINSERTTRIGGER_TB_TIPO_
/

drop trigger COMPOUNDUPDATETRIGGER_TB_TIPO_
/

drop trigger TIB_TB_TIPO_URUSARIO
/

drop trigger MAELSON.COMPOUNDDELETETRIGGER_TB_USUAR
/

drop trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_USUAR
/

drop trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_USUAR
/

drop trigger MAELSON.TIB_TB_USUARIO
/

drop trigger COMPOUNDDELETETRIGGER_TIPO_CLI
/

drop trigger COMPOUNDINSERTTRIGGER_TIPO_CLI
/

drop trigger COMPOUNDUPDATETRIGGER_TIPO_CLI
/

drop trigger TIB_TIPO_CLIENTE
/

alter table MAELSON.TB_ACOMODACAO
   drop constraint TB_ACOMODACAO_REF_TB_BAIRRO
/

alter table MAELSON.TB_ACOMODACAO
   drop constraint TB_ACOMODACAO_REF_TB_CLIENTE
/

alter table MAELSON.TB_ACOMODACAO
   drop constraint TB_ACOMODACAO_REF_TIPO_ACOM
/

alter table MAELSON.TB_ACOMODACAO
   drop constraint TB_ACOMOD_REF_MODEL_ACOM
/

alter table MAELSON.TB_ACOMODACAO
   drop constraint TB_ACOMOD_REF_TB_TIP_CLIENT
/

alter table MAELSON.TB_CLIENTE_ACOMODACAO
   drop constraint TB_CLIENTE_ACOM_REF_TB_CLIENTE
/

alter table MAELSON.TB_CLIENTE_ACOMODACAO
   drop constraint TB_CLIENT_ACOM_REF_TB_TIP_ACOM
/

alter table MAELSON.TB_CLIENTE_BAIRRO
   drop constraint TB_CLIENT_BAIRRO_TB_BAIRRO
/

alter table MAELSON.TB_CLIENTE_BAIRRO
   drop constraint TB_CLIENT_BAIRRO_TB_CLIENT
/

alter table MAELSON.TB_USUARIO
   drop constraint TB_USUARIO_REF_CLIENTE
/

alter table MAELSON.TB_USUARIO
   drop constraint TB_USUARIO_REF_TIPO_USUARIO
/

drop table MAELSON.TB_ACOMODACAO cascade constraints
/

drop table MAELSON.TB_BAIRRO cascade constraints
/

drop table MAELSON.TB_CLIENTE cascade constraints
/

drop table MAELSON.TB_CLIENTE_ACOMODACAO cascade constraints
/

drop table MAELSON.TB_CLIENTE_BAIRRO cascade constraints
/

drop table MAELSON.TB_MODELO_ACOMODACAO cascade constraints
/

drop table MAELSON.TB_TIPO_ACOMODACAO cascade constraints
/

drop table TB_TIPO_USUARIO cascade constraints
/

drop table MAELSON.TB_USUARIO cascade constraints
/

drop table TIPO_CLIENTE cascade constraints
/

drop sequence MAELSON.SEQ_ACOMODACAO
/

drop sequence MAELSON.SEQ_BAIRRO
/

drop sequence MAELSON.SEQ_CLIENTE
/

drop sequence MAELSON.SEQ_MODELO_ACOMODACAO
/

drop sequence MAELSON.SEQ_TIPO_ACOMODACAO
/

drop sequence MAELSON.SEQ_TIPO_CLIENTE
/

drop sequence MAELSON.SEQ_TIPO_USUARIO
/

drop sequence MAELSON.SEQ_USUARIO
/

drop user MAELSON
/

/*==============================================================*/
/* User: MAELSON                                                */
/*==============================================================*/
create user MAELSON 
  identified by ""
/

create sequence MAELSON.SEQ_ACOMODACAO
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_BAIRRO
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_CLIENTE
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_MODELO_ACOMODACAO
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_TIPO_ACOMODACAO
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_TIPO_CLIENTE
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_TIPO_USUARIO
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

create sequence MAELSON.SEQ_USUARIO
increment by 1
start with 1
maxvalue 999999
nomaxvalue
 nocache
/

/*==============================================================*/
/* Table: TB_ACOMODACAO                                         */
/*==============================================================*/
create table MAELSON.TB_ACOMODACAO 
(
   SEQ_ACOMODACAO       NUMBER(6)            not null,
   SEQ_MODELO_ACOMODACAO NUMBER(6),
   SEQ_TIPO_ACOMODACAO  NUMBER(6),
   SEQ_BAIRRO           NUMBER(6),
   SEQ_CLIENTE          NUMBER(6),
   SEQ_TIPO_CLIENTE     NUMBER,
   SIT_OCUPADO          VARCHAR2(1),
   DAT_INICIO_OCUPACAO  DATE,
   NUM_DIAS_OCUPACAO    NUMBER(6)           
      constraint CKC_NUM_DIAS_OCUPACAO_TB_ACOMO check (NUM_DIAS_OCUPACAO is null or (NUM_DIAS_OCUPACAO >= 1)),
   VLR_DIARIA           NUMBER(12,2)         not null,
   QTD_CAMA_EXTRA       NUMBER,
   constraint PK_TB_ACOMODACAO primary key (SEQ_ACOMODACAO)
)
/

comment on column MAELSON.TB_ACOMODACAO.SEQ_ACOMODACAO is
'Campo auto_Incremento para a tabela ACOMODACAO, ele serve como chave primaria.'
/

comment on column MAELSON.TB_ACOMODACAO.SEQ_MODELO_ACOMODACAO is
'SEQUENCIAL DO MODELO DE ACOMODAÇÕES'
/

comment on column MAELSON.TB_ACOMODACAO.SEQ_TIPO_ACOMODACAO is
'SEQUENCIAL DO TIPO DE ACOMODAÇÃO'
/

comment on column MAELSON.TB_ACOMODACAO.SEQ_BAIRRO is
'SEQUENCIAL DA TABELA BAIRRO'
/

comment on column MAELSON.TB_ACOMODACAO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE'
/

comment on column MAELSON.TB_ACOMODACAO.SEQ_TIPO_CLIENTE is
'SEQUENCIAL TIPO CLIENTE'
/

comment on column MAELSON.TB_ACOMODACAO.SIT_OCUPADO is
'infroma a situacao da acomodação, se estará ocupada ou não.'
/

comment on column MAELSON.TB_ACOMODACAO.DAT_INICIO_OCUPACAO is
'Informa a data que a acomodação foi ocupada'
/

comment on column MAELSON.TB_ACOMODACAO.NUM_DIAS_OCUPACAO is
'Informa o numero de dias que o clientes passará ocupando a acomodação'
/

comment on column MAELSON.TB_ACOMODACAO.VLR_DIARIA is
'Informa o valor da diária da acomodação'
/

comment on column MAELSON.TB_ACOMODACAO.QTD_CAMA_EXTRA is
'Mostra a quantidade de camas extras que podem ser colocadas em uma acomodação do tipo apartamento'
/

/*==============================================================*/
/* Table: TB_BAIRRO                                             */
/*==============================================================*/
create table MAELSON.TB_BAIRRO 
(
   SEQ_BAIRRO           NUMBER(6)            not null,
   NOM_BAIRRO           VARCHAR2(50)         not null,
   constraint PK_TB_BAIRRO primary key (SEQ_BAIRRO)
)
/

comment on table MAELSON.TB_BAIRRO is
'Penso em colocar um aditivos para bairros de alto nível, isto possibilitaria aumentar o preço de alguns tipos de vagas.
Por exemplo,  uma vaga no catolé seria mais cara do que uma vaga no verdejante.
Pra isto eu teria que definir um nivelamento para bairros, talvez com uma nova tabela.'
/

comment on column MAELSON.TB_BAIRRO.SEQ_BAIRRO is
'SEQUENCIAL DA TABELA BAIRRO'
/

comment on column MAELSON.TB_BAIRRO.NOM_BAIRRO is
'NOME DO BAIRRO'
/

/*==============================================================*/
/* Table: TB_CLIENTE                                            */
/*==============================================================*/
create table MAELSON.TB_CLIENTE 
(
   SEQ_CLIENTE          NUMBER(6)            not null,
   NOM_CLIENTE          VARCHAR2(50)         not null,
   TIP_SEXO             VARCHAR2(1)          not null,
   DAT_NASCIMENTO       DATE,
   DSC_NASCIONALIDADE   VARCHAR2(30),
   DSC_ENDERECO         VARCHAR2(50),
   DSC_OCUPACAO         VARCHAR2(30),
   constraint PK_TB_CLIENTE primary key (SEQ_CLIENTE)
)
/

comment on column MAELSON.TB_CLIENTE.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE'
/

comment on column MAELSON.TB_CLIENTE.DSC_ENDERECO is
'Este campo aloca o endereço do cliente, logradouro, e num_logradouro. Acredito que ficaria melhor separadas em tabelas distintas, não inclusas ao clientes, mas isto é coisa par aser analisada posteriormente.'
/

/*==============================================================*/
/* Table: TB_CLIENTE_ACOMODACAO                                 */
/*==============================================================*/
create table MAELSON.TB_CLIENTE_ACOMODACAO 
(
   SEQ_CLIENTE          NUMBER(6),
   SEQ_TIPO_ACOMODACAO  NUMBER(6),
   COD_PRIORIDADE       NUMBER
)
/

comment on table MAELSON.TB_CLIENTE_ACOMODACAO is
'Esta tabela armazena um conjunto de prioridades de acomodações de acordo com o usuario.'
/

comment on column MAELSON.TB_CLIENTE_ACOMODACAO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE'
/

comment on column MAELSON.TB_CLIENTE_ACOMODACAO.SEQ_TIPO_ACOMODACAO is
'SEQUENCIAL DO TIPO DE ACOMODAÇÃO'
/

/*==============================================================*/
/* Table: TB_CLIENTE_BAIRRO                                     */
/*==============================================================*/
create table MAELSON.TB_CLIENTE_BAIRRO 
(
   SEQ_CLIENTE          NUMBER(6),
   SEQ_BAIRRO           NUMBER(6),
   COD_PRIORIDADE       NUMBER               not null
)
/

comment on column MAELSON.TB_CLIENTE_BAIRRO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE'
/

comment on column MAELSON.TB_CLIENTE_BAIRRO.SEQ_BAIRRO is
'SEQUENCIAL DA TABELA BAIRRO'
/

comment on column MAELSON.TB_CLIENTE_BAIRRO.COD_PRIORIDADE is
'Campo que armazena as prioridades de um cliente pelo bairro, quanto menor o nuemro maior será a prioridade. Exemplo, bairros com prioridade 1 são os preferidos pelos clientes.'
/

/*==============================================================*/
/* Table: TB_MODELO_ACOMODACAO                                  */
/*==============================================================*/
create table MAELSON.TB_MODELO_ACOMODACAO 
(
   SEQ_MODELO_ACOMODACAO NUMBER(6)            not null,
   TIP_MODELO           VARCHAR2(30),
   constraint PK_TB_MODELO_ACOMODACAO primary key (SEQ_MODELO_ACOMODACAO)
)
/

comment on table MAELSON.TB_MODELO_ACOMODACAO is
'Estou pensando em adicionar o modelo casa, pois quarto, vaga e apartamento são mínimos.
O tipo casa providencia a acomodação do tipo casa de praia.'
/

comment on column MAELSON.TB_MODELO_ACOMODACAO.SEQ_MODELO_ACOMODACAO is
'SEQUENCIAL DO MODELO DE ACOMODAÇÕES'
/

/*==============================================================*/
/* Table: TB_TIPO_ACOMODACAO                                    */
/*==============================================================*/
create table MAELSON.TB_TIPO_ACOMODACAO 
(
   SEQ_TIPO_ACOMODACAO  NUMBER(6)            not null,
   TIP_ACOMODACAO       VARCHAR2(30)         not null,
   TAX_DESCONTO         NUMBER(5,2),
   constraint PK_TB_TIPO_ACOMODACAO primary key (SEQ_TIPO_ACOMODACAO)
)
/

comment on table MAELSON.TB_TIPO_ACOMODACAO is
'o programa de acomodações oferece, para estudantes, descontos, no valor das diárias, que variam de acordo com o tipo da acomodação (Vaga):

Simples – 10%
Confortável – 20%
Luxo – 30%
'
/

comment on column MAELSON.TB_TIPO_ACOMODACAO.SEQ_TIPO_ACOMODACAO is
'SEQUENCIAL DO TIPO DE ACOMODAÇÃO'
/

/*==============================================================*/
/* Table: TB_TIPO_USUARIO                                       */
/*==============================================================*/
create table TB_TIPO_USUARIO 
(
   SEQ_TIPO_USUARIO     NUMBER               not null,
   DSC_TIPO_USUARIO     VARCHAR2(20),
   constraint PK_TB_TIPO_USUARIO primary key (SEQ_TIPO_USUARIO)
)
/

comment on table TB_TIPO_USUARIO is
'Armazenaos tipos de uruários qu poderão utilizar o sistema;'
/

comment on column TB_TIPO_USUARIO.SEQ_TIPO_USUARIO is
'SEQUENCIAL DO TIPO DE USUÁRIO'
/

/*==============================================================*/
/* Table: TB_USUARIO                                            */
/*==============================================================*/
create table MAELSON.TB_USUARIO 
(
   SEQ_USUARIO          NUMBER(6)            not null,
   SEQ_CLIENTE          NUMBER(6),
   SEQ_TIPO_USUARIO     NUMBER,
   DSC_LOGIN            VARCHAR2(10),
   DSC_SENHA            VARCHAR2(20),
   constraint PK_TB_USUARIO primary key (SEQ_USUARIO)
)
/

comment on column MAELSON.TB_USUARIO.SEQ_USUARIO is
'SEQUENCIAL DE USUÁRIO'
/

comment on column MAELSON.TB_USUARIO.SEQ_CLIENTE is
'SEQUENCIAL DO CLIENTE'
/

comment on column MAELSON.TB_USUARIO.SEQ_TIPO_USUARIO is
'SEQUENCIAL DO TIPO DE USUÁRIO'
/

/*==============================================================*/
/* Table: TIPO_CLIENTE                                          */
/*==============================================================*/
create table TIPO_CLIENTE 
(
   SEQ_TIPO_CLIENTE     NUMBER               not null,
   DSC_TIPO_CLIENTE     VARCHAR2(20),
   constraint PK_TIPO_CLIENTE primary key (SEQ_TIPO_CLIENTE)
)
/

comment on table TIPO_CLIENTE is
'Esta Tabela armazena o TipoCliente (Nacional, Internacional ou Estudante), de acordo com o tipo do cliente, para estudantes, o sistema poderá oferecer descontos, no valor das diárias, que variam de acordo com o tipo da acomodação (Vaga):

Simples – 10%
Confortável – 20%
Luxo – 30%
'
/

comment on column TIPO_CLIENTE.SEQ_TIPO_CLIENTE is
'SEQUENCIAL TIPO CLIENTE'
/

alter table MAELSON.TB_ACOMODACAO
   add constraint TB_ACOMODACAO_REF_TB_BAIRRO foreign key (SEQ_BAIRRO)
      references MAELSON.TB_BAIRRO (SEQ_BAIRRO)
/

alter table MAELSON.TB_ACOMODACAO
   add constraint TB_ACOMODACAO_REF_TB_CLIENTE foreign key (SEQ_CLIENTE)
      references MAELSON.TB_CLIENTE (SEQ_CLIENTE)
/

alter table MAELSON.TB_ACOMODACAO
   add constraint TB_ACOMODACAO_REF_TIPO_ACOM foreign key (SEQ_TIPO_ACOMODACAO)
      references MAELSON.TB_TIPO_ACOMODACAO (SEQ_TIPO_ACOMODACAO)
/

alter table MAELSON.TB_ACOMODACAO
   add constraint TB_ACOMOD_REF_MODEL_ACOM foreign key (SEQ_MODELO_ACOMODACAO)
      references MAELSON.TB_MODELO_ACOMODACAO (SEQ_MODELO_ACOMODACAO)
/

alter table MAELSON.TB_ACOMODACAO
   add constraint TB_ACOMOD_REF_TB_TIP_CLIENT foreign key (SEQ_TIPO_CLIENTE)
      references TIPO_CLIENTE (SEQ_TIPO_CLIENTE)
/

alter table MAELSON.TB_CLIENTE_ACOMODACAO
   add constraint TB_CLIENTE_ACOM_REF_TB_CLIENTE foreign key (SEQ_CLIENTE)
      references MAELSON.TB_CLIENTE (SEQ_CLIENTE)
/

alter table MAELSON.TB_CLIENTE_ACOMODACAO
   add constraint TB_CLIENT_ACOM_REF_TB_TIP_ACOM foreign key (SEQ_TIPO_ACOMODACAO)
      references MAELSON.TB_TIPO_ACOMODACAO (SEQ_TIPO_ACOMODACAO)
/

alter table MAELSON.TB_CLIENTE_BAIRRO
   add constraint TB_CLIENT_BAIRRO_TB_BAIRRO foreign key (SEQ_BAIRRO)
      references MAELSON.TB_BAIRRO (SEQ_BAIRRO)
/

alter table MAELSON.TB_CLIENTE_BAIRRO
   add constraint TB_CLIENT_BAIRRO_TB_CLIENT foreign key (SEQ_CLIENTE)
      references MAELSON.TB_CLIENTE (SEQ_CLIENTE)
/

alter table MAELSON.TB_USUARIO
   add constraint TB_USUARIO_REF_CLIENTE foreign key (SEQ_CLIENTE)
      references MAELSON.TB_CLIENTE (SEQ_CLIENTE)
/

alter table MAELSON.TB_USUARIO
   add constraint TB_USUARIO_REF_TIPO_USUARIO foreign key (SEQ_TIPO_USUARIO)
      references TB_TIPO_USUARIO (SEQ_TIPO_USUARIO)
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_ACOMODAC
for delete on MAELSON.TB_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_ACOMODAC
for insert on MAELSON.TB_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_ACOMODAC
for update on MAELSON.TB_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_ACOMODACAO before insert
on MAELSON.TB_ACOMODACAO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_ACOMODACAO" uses sequence MAELSON.SEQ_ACOMODACAO
    select MAELSON.SEQ_ACOMODACAO.NEXTVAL INTO :new.SEQ_ACOMODACAO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_TB_BAIRR
for delete on MAELSON.TB_BAIRRO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_BAIRR
for insert on MAELSON.TB_BAIRRO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_BAIRR
for update on MAELSON.TB_BAIRRO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_TB_BAIRRO before insert
on MAELSON.TB_BAIRRO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_BAIRRO" uses sequence MAELSON.SEQ_BAIRRO
    select MAELSON.SEQ_BAIRRO.NEXTVAL INTO :new.SEQ_BAIRRO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_TB_CLIEN
for delete on MAELSON.TB_CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_CLIEN
for insert on MAELSON.TB_CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_CLIEN
for update on MAELSON.TB_CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_TB_CLIENTES before insert
on MAELSON.TB_CLIENTE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_CLIENTE" uses sequence MAELSON.SEQ_CLIENTE
    select MAELSON.SEQ_CLIENTE.NEXTVAL INTO :new.SEQ_CLIENTE from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_TB_CLIEN
for delete on MAELSON.TB_CLIENTE_BAIRRO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_CLIEN
for insert on MAELSON.TB_CLIENTE_BAIRRO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_CLIEN
for update on MAELSON.TB_CLIENTE_BAIRRO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_TB_CLIENTE_BAIRRO before insert
on MAELSON.TB_CLIENTE_BAIRRO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_TB_MODEL
for delete on MAELSON.TB_MODELO_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_MODEL
for insert on MAELSON.TB_MODELO_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_MODEL
for update on MAELSON.TB_MODELO_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_TB_MODELO_ACOMODACAO before insert
on MAELSON.TB_MODELO_ACOMODACAO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_MODELO_ACOMODACAO" uses sequence MAELSON.SEQ_MODELO_ACOMODACAO
    select MAELSON.SEQ_MODELO_ACOMODACAO.NEXTVAL INTO :new.SEQ_MODELO_ACOMODACAO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_TB_TIPO_
for delete on MAELSON.TB_TIPO_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_TIPO_
for insert on MAELSON.TB_TIPO_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_TIPO_
for update on MAELSON.TB_TIPO_ACOMODACAO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_TB_TIPO_ACOMODACAI before insert
on MAELSON.TB_TIPO_ACOMODACAO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_TIPO_ACOMODACAO" uses sequence MAELSON.SEQ_TIPO_ACOMODACAO
    select MAELSON.SEQ_TIPO_ACOMODACAO.NEXTVAL INTO :new.SEQ_TIPO_ACOMODACAO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_TB_TIPO_
for delete on TB_TIPO_USUARIO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_TB_TIPO_
for insert on TB_TIPO_USUARIO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_TB_TIPO_
for update on TB_TIPO_USUARIO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_TB_TIPO_URUSARIO before insert
on TB_TIPO_USUARIO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_TIPO_USUARIO" uses sequence MAELSON.SEQ_TIPO_USUARIO
    select MAELSON.SEQ_TIPO_USUARIO.NEXTVAL INTO :new.SEQ_TIPO_USUARIO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger MAELSON.COMPOUNDDELETETRIGGER_TB_USUAR
for delete on MAELSON.TB_USUARIO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDINSERTTRIGGER_TB_USUAR
for insert on MAELSON.TB_USUARIO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger MAELSON.COMPOUNDUPDATETRIGGER_TB_USUAR
for update on MAELSON.TB_USUARIO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger MAELSON.TIB_TB_USUARIO before insert
on MAELSON.TB_USUARIO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_USUARIO" uses sequence MAELSON.SEQ_USUARIO
    select MAELSON.SEQ_USUARIO.NEXTVAL INTO :new.SEQ_USUARIO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_TIPO_CLI
for delete on TIPO_CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_TIPO_CLI
for insert on TIPO_CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_TIPO_CLI
for update on TIPO_CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_TIPO_CLIENTE before insert
on TIPO_CLIENTE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "SEQ_TIPO_CLIENTE" uses sequence MAELSON.SEQ_TIPO_CLIENTE
    select MAELSON.SEQ_TIPO_CLIENTE.NEXTVAL INTO :new.SEQ_TIPO_CLIENTE from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/

