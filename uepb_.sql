--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: universidade; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE universidade WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


\connect universidade

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: uepb; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA uepb;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = uepb, pg_catalog;

SET default_with_oids = false;

--
-- Name: aluno; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE aluno (
    id_aluno character varying(5) NOT NULL,
    nome character varying(20) NOT NULL,
    nome_dept character varying(20),
    tot_cred numeric(3,0),
    CONSTRAINT aluno_tot_cred_check CHECK ((tot_cred >= (0)::numeric))
);


--
-- Name: curso; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE curso (
    id_curso character varying(7) NOT NULL,
    titulo character varying(50),
    nome_dept character varying(20),
    creditos numeric(2,0)
);


--
-- Name: secao; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE secao (
    id_sec character varying(8) NOT NULL,
    id_curso character varying(8) NOT NULL,
    semestre character varying(6) NOT NULL,
    ano numeric(4,0) NOT NULL,
    predio character varying(15),
    numero_sala character varying(7),
    id_periodo character varying(4)
);


--
-- Name: computacao_primavera_2010; Type: VIEW; Schema: uepb; Owner: -
--

CREATE VIEW computacao_primavera_2010 AS
 SELECT curso.id_curso,
    secao.id_sec,
    secao.predio,
    secao.numero_sala,
    secao.ano
   FROM curso,
    secao
  WHERE (((((curso.id_curso)::text = (secao.id_curso)::text) AND ((curso.nome_dept)::text = 'Comp. Sci.'::text)) AND ((secao.semestre)::text = 'Spring'::text)) AND (secao.ano = (2010)::numeric));


--
-- Name: departamento; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE departamento (
    nome_dept character varying(20) NOT NULL,
    predio character varying(15),
    orcamento numeric(12,2),
    CONSTRAINT departamento_orcamento_check CHECK ((orcamento > (0)::numeric))
);


--
-- Name: instrutor; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE instrutor (
    id_instrutor character varying(5) NOT NULL,
    nome character varying(20) NOT NULL,
    nome_dept character varying(20),
    salario numeric(8,2)
);


--
-- Name: docente; Type: VIEW; Schema: uepb; Owner: -
--

CREATE VIEW docente AS
 SELECT instrutor.id_instrutor,
    instrutor.nome,
    instrutor.nome_dept
   FROM instrutor;


--
-- Name: ministra; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE ministra (
    id_instrutor character varying(5) NOT NULL,
    id_curso character varying(8) NOT NULL,
    id_sec character varying(8) NOT NULL,
    semestre character varying(6) NOT NULL,
    ano numeric(4,0) NOT NULL
);


--
-- Name: monitor; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE monitor (
    id_aluno character varying(5) NOT NULL,
    id_instrutor character varying(5)
);


--
-- Name: periodo; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE periodo (
    id_periodo character varying(4) NOT NULL,
    dia character varying(1) NOT NULL,
    hora_inicial time without time zone NOT NULL,
    hora_final time without time zone,
    CONSTRAINT periodo_dia_check CHECK (((dia)::text = ANY ((ARRAY['M'::character varying, 'T'::character varying, 'W'::character varying, 'R'::character varying, 'F'::character varying, 'S'::character varying, 'U'::character varying])::text[])))
);


--
-- Name: prereq; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE prereq (
    id_curso character varying(8) NOT NULL,
    id_prereq character varying(8) NOT NULL
);


--
-- Name: realiza; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE realiza (
    id_aluno character varying(5) NOT NULL,
    id_curso character varying(8) NOT NULL,
    id_sec character varying(8) NOT NULL,
    semestre character varying(6) NOT NULL,
    ano numeric(4,0) NOT NULL,
    nota character varying(2)
);


--
-- Name: sal_total_depts; Type: VIEW; Schema: uepb; Owner: -
--

CREATE VIEW sal_total_depts AS
 SELECT instrutor.nome_dept,
    sum(instrutor.salario) AS salario_total
   FROM instrutor
  GROUP BY instrutor.nome_dept;


--
-- Name: sala; Type: TABLE; Schema: uepb; Owner: -
--

CREATE TABLE sala (
    predio character varying(15) NOT NULL,
    numero_sala character varying(7) NOT NULL,
    capacidade numeric(4,0)
);


--
-- Name: aluno_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id_aluno);


--
-- Name: curso_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (nome_dept);


--
-- Name: instrutor_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY instrutor
    ADD CONSTRAINT instrutor_pkey PRIMARY KEY (id_instrutor);


--
-- Name: ministra_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY ministra
    ADD CONSTRAINT ministra_pkey PRIMARY KEY (id_instrutor, id_curso, id_sec, semestre, ano);


--
-- Name: monitor_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY monitor
    ADD CONSTRAINT monitor_pkey PRIMARY KEY (id_aluno);


--
-- Name: periodo_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (id_periodo, dia, hora_inicial);


--
-- Name: prereq_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY prereq
    ADD CONSTRAINT prereq_pkey PRIMARY KEY (id_curso, id_prereq);


--
-- Name: realiza_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY realiza
    ADD CONSTRAINT realiza_pkey PRIMARY KEY (id_aluno, id_curso, id_sec, semestre, ano);


--
-- Name: sala_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (predio, numero_sala);


--
-- Name: secao_pkey; Type: CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY secao
    ADD CONSTRAINT secao_pkey PRIMARY KEY (id_sec, id_curso, semestre, ano);


--
-- Name: aluno_nome_dept_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_nome_dept_fkey FOREIGN KEY (nome_dept) REFERENCES departamento(nome_dept) ON DELETE SET NULL;


--
-- Name: curso_nome_dept_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_nome_dept_fkey FOREIGN KEY (nome_dept) REFERENCES departamento(nome_dept) ON DELETE SET NULL;


--
-- Name: instrutor_nome_dept_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY instrutor
    ADD CONSTRAINT instrutor_nome_dept_fkey FOREIGN KEY (nome_dept) REFERENCES departamento(nome_dept) ON DELETE SET NULL;


--
-- Name: ministra_id_instrutor_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY ministra
    ADD CONSTRAINT ministra_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor) ON DELETE CASCADE;


--
-- Name: ministra_id_sec_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY ministra
    ADD CONSTRAINT ministra_id_sec_fkey FOREIGN KEY (id_sec, id_curso, semestre, ano) REFERENCES secao(id_sec, id_curso, semestre, ano) ON DELETE CASCADE;


--
-- Name: monitor_id_aluno_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY monitor
    ADD CONSTRAINT monitor_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE;


--
-- Name: monitor_id_instrutor_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY monitor
    ADD CONSTRAINT monitor_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor) ON DELETE SET NULL;


--
-- Name: prereq_id_curso_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY prereq
    ADD CONSTRAINT prereq_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES curso(id_curso) ON DELETE CASCADE;


--
-- Name: prereq_id_prereq_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY prereq
    ADD CONSTRAINT prereq_id_prereq_fkey FOREIGN KEY (id_prereq) REFERENCES curso(id_curso);


--
-- Name: realiza_id_aluno_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY realiza
    ADD CONSTRAINT realiza_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno) ON DELETE CASCADE;


--
-- Name: realiza_id_curso_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY realiza
    ADD CONSTRAINT realiza_id_curso_fkey FOREIGN KEY (id_curso, id_sec, semestre, ano) REFERENCES secao(id_curso, id_sec, semestre, ano) ON DELETE CASCADE;


--
-- Name: secao_id_curso_fkey; Type: FK CONSTRAINT; Schema: uepb; Owner: -
--

ALTER TABLE ONLY secao
    ADD CONSTRAINT secao_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES curso(id_curso) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

