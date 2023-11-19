CREATE DATABASE db_feriados;


CREATE TABLE "feriados" (
  "id_feriado" char(36) NOT NULL,
  "id_tipo_feriado" varchar(255) NOT NULL,
  "nome_feriado" varchar(100) NOT NULL,
  "dia" int2,
  "mes" int2 NOT NULL,
  "ano" int2,
  "codigo_semana" int2,
  "ordem_semana" int2,
  PRIMARY KEY ("id_feriado")
);

CREATE TABLE "semana" (
  "codigo_semana" int2 NOT NULL,
  "nome_dia" varchar(50) NOT NULL,
  "sigla" char(2) NOT NULL,
  PRIMARY KEY ("codigo_semana")
);

CREATE TABLE "tipo_feriado" (
  "id_tipo_feriado" int2 NOT NULL,
  "tipo_ferido" varchar(50) NOT NULL,
  PRIMARY KEY ("id_tipo_feriado")
);

ALTER TABLE "feriados" ADD CONSTRAINT "fk_feriados_tipo_feriado_1" FOREIGN KEY ("id_tipo_feriado") REFERENCES "tipo_feriado" ("id_tipo_feriado");
ALTER TABLE "feriados" ADD CONSTRAINT "fk_feriados_semana_1" FOREIGN KEY ("codigo_semana") REFERENCES "semana" ("codigo_semana");

