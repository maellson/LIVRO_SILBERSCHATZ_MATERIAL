ALTER TABLE uepb.ministra
drop CONSTRAINT ministra_id_instrutor_fkey,
drop CONSTRAINT ministra_id_sec_fkey;



--/*
alter table uepb.ministra
add FOREIGN KEY (id_instrutor)
      REFERENCES uepb.instrutor (id_instrutor) on delete cascade,
add FOREIGN KEY (id_sec, id_curso, semestre, ano)
      REFERENCES uepb.secao (id_sec, id_curso, semestre, ano) on delete cascade;