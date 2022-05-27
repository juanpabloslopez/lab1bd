DROP DATABASE IF EXISTS "lab1";
CREATE DATABASE "lab1"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF-8'
    CONNECTION LIMIT = -1;

DROP TABLE IF EXISTS "Cliente";
DROP TABLE IF EXISTS "Comuna";

CREATE TABLE public."Comuna"(
    nombre_com name NOT NULL,
    id_com integer NOT NULL,
    CONSTRAINT comuna_pkey PRIMARY KEY (id_com)
);

ALTER TABLE IF EXISTS public."Comuna"
    OWNER to postgres;

CREATE TABLE public."Cliente"(
    tipo_cl text NOT NULL,
    n_medidor integer NOT NULL,
    nombre_cl name NOT NULL,
    rut_cl integer NOT NULL,
    consumo_men integer NOT NULL,
    id_comu integer NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (n_medidor),
    CONSTRAINT fk_comuna FOREIGN KEY (id_comu)
        REFERENCES public."Comuna" (id_com) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE IF EXISTS public."Cliente"
    OWNER to postgres;

/* CREATE TABLE public."Cliente"( */

/* ); */

/* ALTER TABLE IF EXISTS public."Cliente" */
/*     OWNER to postgres; */

/* CREATE TABLE public."Cliente"( */

/* ); */

/* ALTER TABLE IF EXISTS public."Cliente" */
/*     OWNER to postgres; */
/* CREATE TABLE public."Cliente"( */


/* ); */

/* ALTER TABLE IF EXISTS public."Cliente" */
/*     OWNER to postgres; */

/* CREATE TABLE public."Cliente"( */

/* ); */

/* ALTER TABLE IF EXISTS public."Cliente" */
/*     OWNER to postgres; */
