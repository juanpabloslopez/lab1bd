/* [Parte dos */

/* Eliminamos las tablas en caso de existir, esto esta basicamente */
/* porque como constantemente editaba la base den datos */
DROP TABLE IF EXISTS Cliente CASCADE;
DROP TABLE IF EXISTS Historial CASCADE;
DROP TABLE IF EXISTS Fuente_de_Agua CASCADE;
DROP TABLE IF EXISTS Empresa CASCADE;
DROP TABLE IF EXISTS Comuna CASCADE;

CREATE TABLE public.Comuna(
    nombre_com name NOT NULL,
    id_com integer NOT NULL,
    CONSTRAINT comuna_pkey PRIMARY KEY (id_com)
);

ALTER TABLE IF EXISTS public.Comuna
    OWNER to postgres;

CREATE TABLE public.Cliente(
    tipo_cl text NOT NULL,
    n_medidor integer NOT NULL,
    nombre_cl name NOT NULL,
    rut_cl integer NOT NULL,
    consumo_men integer NOT NULL,
    id_com integer NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (n_medidor),
    CONSTRAINT fk_comuna FOREIGN KEY (id_com)
        REFERENCES public.Comuna (id_com) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE IF EXISTS public.Cliente
    OWNER to postgres;

CREATE TABLE public.Empresa(
    id_emp integer NOT NULL,
    nombre_emp name NOT NULL,
    id_com integer NOT NULL,
    CONSTRAINT empresa_pkey PRIMARY KEY (id_emp),
    CONSTRAINT fk_comuna FOREIGN KEY (id_com)
        REFERENCES public.Comuna (id_com) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE IF EXISTS public.Empresa
    OWNER to postgres;

CREATE TABLE public.Fuente_de_Agua(
    id_fuente integer NOT NULL,
    nombre_fuente name NOT NULL,
    id_emp integer NOT NULL,
    CONSTRAINT fuente_de_agua_pkey PRIMARY KEY (id_fuente),
    CONSTRAINT fk_empresa FOREIGN KEY (id_emp)
        REFERENCES public.Empresa (id_emp) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE IF EXISTS public.Fuente_de_Agua
    OWNER to postgres;

CREATE TABLE public.Historial(
    fecha_consumo date NOT NULL,
    consumo integer NOT NULL,
    id_fuente integer NOT NULL,
    CONSTRAINT historial_pkey PRIMARY KEY (fecha_consumo),
    CONSTRAINT fk_fuente_de_agua FOREIGN KEY (id_fuente)
        REFERENCES public.Fuente_de_Agua (id_fuente) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE IF EXISTS public.Historial
    OWNER to postgres;

/* Parte dos] */

/* [Parte tres */

INSERT INTO public.Comuna(
    nombre_com, id_com)
    VALUES ('Providencia', 7500000);

INSERT INTO public.Comuna(
    nombre_com, id_com)
    VALUES ('QuintaNormal', 8500000);

INSERT INTO public.Comuna(
    nombre_com, id_com)
    VALUES ('Ñuñoa', 7750000);


INSERT INTO public.Cliente(
    tipo_cl, n_medidor, nombre_cl, rut_cl, consumo_men, id_com)
    VALUES ('Particular', 1, 'Pablito', 201234567, 100, 7500000);

INSERT INTO public.Cliente(
    tipo_cl, n_medidor, nombre_cl, rut_cl, consumo_men, id_com)
    VALUES ('Particular', 2, 'Leopoldo', 207654321, 2500, 7750000);

INSERT INTO public.Cliente(
    tipo_cl, n_medidor, nombre_cl, rut_cl, consumo_men, id_com)
    VALUES ('Restaurant', 3, 'Cristobalin', 203211234, 1800, 8500000);


INSERT INTO public.Empresa(
    id_emp, nombre_emp, id_com)
    VALUES (777, 'LosSanguches', 7500000);

INSERT INTO public.Empresa(
    id_emp, nombre_emp, id_com)
    VALUES (666, 'Biblioteca', 7750000);

INSERT INTO public.Empresa(
    id_emp, nombre_emp, id_com)
    VALUES (555, 'Liquidos', 8500000);


INSERT INTO public.Fuente_de_Agua(
    id_fuente, nombre_fuente, id_emp)
    VALUES (212, 'FuentesLiq', 555);

INSERT INTO public.Fuente_de_Agua(
    id_fuente, nombre_fuente, id_emp)
    VALUES (323, 'FuentesSan', 777);

INSERT INTO public.Fuente_de_Agua(
    id_fuente, nombre_fuente, id_emp)
    VALUES (434, 'FuentesBib', 666);


INSERT INTO public.Historial(
    fecha_consumo, consumo, id_fuente)
    VALUES ('23/12/2022', 1000, 323);

INSERT INTO public.Historial(
    fecha_consumo, consumo, id_fuente)
    VALUES ('11/10/2021', 2000, 434);

INSERT INTO public.Historial(
    fecha_consumo, consumo, id_fuente)
    VALUES ('16/6/2023', 5000, 212);

/* Parte tres] */
