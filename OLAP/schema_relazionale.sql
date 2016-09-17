--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-09-08 16:31:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 237571)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 193 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 193
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 237572)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE anno_accademico (
    "id anno" integer NOT NULL,
    "codice anno" text,
    "nome anno" text
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 237575)
-- Name: anno_accademico_aa_key_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE anno_accademico_aa_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_aa_key_seq OWNER TO postgres;

--
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 174
-- Name: anno_accademico_aa_key_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE anno_accademico_aa_key_seq OWNED BY anno_accademico."id anno";


--
-- TOC entry 175 (class 1259 OID 237577)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE corso (
    nome text,
    cfu numeric,
    ssd text,
    "codice corso" text,
    id integer NOT NULL
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 237583)
-- Name: corso di studi; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "corso di studi" (
    id integer NOT NULL,
    "data inizio validità" date,
    "data fine validità" date,
    "nome CdS" text,
    "tipo CdS" text,
    "nome dipartimento" text,
    "codice dipartimento" numeric,
    "codice corso di studi" numeric,
    durata numeric,
    "Codice ateneo" text
);


ALTER TABLE "corso di studi" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 237589)
-- Name: corso di studi_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "corso di studi_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "corso di studi_id_seq" OWNER TO postgres;

--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 177
-- Name: corso di studi_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "corso di studi_id_seq" OWNED BY "corso di studi".id;


--
-- TOC entry 178 (class 1259 OID 237591)
-- Name: corso_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_id_seq OWNER TO postgres;

--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 178
-- Name: corso_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_id_seq OWNED BY corso.id;


--
-- TOC entry 179 (class 1259 OID 237593)
-- Name: esami; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE esami (
    voto numeric,
    cfu numeric,
    "corso di studi" integer NOT NULL,
    tempo integer NOT NULL,
    studente integer NOT NULL,
    corso integer NOT NULL,
    "anno accademico" integer NOT NULL
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 237780)
-- Name: esami_anno accademico_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "esami_anno accademico_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "esami_anno accademico_seq" OWNER TO postgres;

--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 192
-- Name: esami_anno accademico_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "esami_anno accademico_seq" OWNED BY esami."anno accademico";


--
-- TOC entry 188 (class 1259 OID 237718)
-- Name: esami_corso di studi_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "esami_corso di studi_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "esami_corso di studi_seq" OWNER TO postgres;

--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 188
-- Name: esami_corso di studi_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "esami_corso di studi_seq" OWNED BY esami."corso di studi";


--
-- TOC entry 191 (class 1259 OID 237745)
-- Name: esami_corso_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE esami_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_corso_seq OWNER TO postgres;

--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 191
-- Name: esami_corso_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE esami_corso_seq OWNED BY esami.corso;


--
-- TOC entry 190 (class 1259 OID 237736)
-- Name: esami_studente_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE esami_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_studente_seq OWNER TO postgres;

--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 190
-- Name: esami_studente_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE esami_studente_seq OWNED BY esami.studente;


--
-- TOC entry 189 (class 1259 OID 237727)
-- Name: esami_tempo_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE esami_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE esami_tempo_seq OWNER TO postgres;

--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 189
-- Name: esami_tempo_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE esami_tempo_seq OWNED BY esami.tempo;


--
-- TOC entry 180 (class 1259 OID 237596)
-- Name: ingressi; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE ingressi (
    tempo integer NOT NULL,
    studente integer NOT NULL,
    "corso di studi" integer NOT NULL,
    "anno accademico" integer NOT NULL,
    "punteggio test" integer,
    "tipo immatricolazione" integer NOT NULL
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 237599)
-- Name: lauree; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE lauree (
    studente integer,
    "anno accademico" integer,
    "corso di studi" integer,
    tempo integer,
    "voto laurea" integer
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 237602)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE studente (
    id integer NOT NULL,
    "data di nascita" date,
    coorte numeric,
    "titolo di studio" text,
    sesso text,
    regione text,
    provincia text,
    comune text,
    stato text,
    cittadinanza text,
    "codice fiscale" text,
    "voto scuola media superiore" text,
    "nazione del diploma" text,
    "istituto scuola media superiore" text,
    "anno conseguimento titolo scuola superiore" text
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 237608)
-- Name: studente_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE studente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_id_seq OWNER TO postgres;

--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 183
-- Name: studente_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE studente_id_seq OWNED BY studente.id;


--
-- TOC entry 184 (class 1259 OID 237610)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE tempo (
    date date,
    anno double precision,
    mese double precision,
    "nome del mese" text,
    giorno double precision,
    "giorno dell'anno" double precision,
    "giorno della settimana" text,
    "settimana del calendario" double precision,
    "mese dell'anno" text,
    id integer NOT NULL,
    "inizio mese" boolean,
    "fine mese" boolean,
    weekend boolean
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 237616)
-- Name: tempo_tempo_key_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tempo_tempo_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo_tempo_key_seq OWNER TO postgres;

--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 185
-- Name: tempo_tempo_key_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tempo_tempo_key_seq OWNED BY tempo.id;


--
-- TOC entry 186 (class 1259 OID 237618)
-- Name: tipo immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres; Tablespace: 
--

CREATE TABLE "tipo immatricolazione" (
    "tipo immatricolazione" text,
    id integer NOT NULL
);


ALTER TABLE "tipo immatricolazione" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 237621)
-- Name: tipo immatricolazione_id_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE "tipo immatricolazione_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "tipo immatricolazione_id_seq" OWNER TO postgres;

--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo immatricolazione_id_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE "tipo immatricolazione_id_seq" OWNED BY "tipo immatricolazione".id;


--
-- TOC entry 1941 (class 2604 OID 237623)
-- Name: id anno; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN "id anno" SET DEFAULT nextval('anno_accademico_aa_key_seq'::regclass);


--
-- TOC entry 1942 (class 2604 OID 237624)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN id SET DEFAULT nextval('corso_id_seq'::regclass);


--
-- TOC entry 1943 (class 2604 OID 237625)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "corso di studi" ALTER COLUMN id SET DEFAULT nextval('"corso di studi_id_seq"'::regclass);


--
-- TOC entry 1944 (class 2604 OID 237720)
-- Name: corso di studi; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN "corso di studi" SET DEFAULT nextval('"esami_corso di studi_seq"'::regclass);


--
-- TOC entry 1945 (class 2604 OID 237729)
-- Name: tempo; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN tempo SET DEFAULT nextval('esami_tempo_seq'::regclass);


--
-- TOC entry 1946 (class 2604 OID 237738)
-- Name: studente; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN studente SET DEFAULT nextval('esami_studente_seq'::regclass);


--
-- TOC entry 1947 (class 2604 OID 237747)
-- Name: corso; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN corso SET DEFAULT nextval('esami_corso_seq'::regclass);


--
-- TOC entry 1948 (class 2604 OID 237782)
-- Name: anno accademico; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami ALTER COLUMN "anno accademico" SET DEFAULT nextval('"esami_anno accademico_seq"'::regclass);


--
-- TOC entry 1949 (class 2604 OID 237626)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN id SET DEFAULT nextval('studente_id_seq'::regclass);


--
-- TOC entry 1950 (class 2604 OID 237627)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN id SET DEFAULT nextval('tempo_tempo_key_seq'::regclass);


--
-- TOC entry 1951 (class 2604 OID 237628)
-- Name: id; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "tipo immatricolazione" ALTER COLUMN id SET DEFAULT nextval('"tipo immatricolazione_id_seq"'::regclass);


--
-- TOC entry 1953 (class 2606 OID 237630)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY ("id anno");


--
-- TOC entry 1957 (class 2606 OID 237632)
-- Name: corso di studi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "corso di studi"
    ADD CONSTRAINT "corso di studi_pkey" PRIMARY KEY (id);


--
-- TOC entry 1955 (class 2606 OID 237634)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (id);


--
-- TOC entry 1959 (class 2606 OID 237791)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY ("corso di studi", tempo, studente, "anno accademico", corso);


--
-- TOC entry 1961 (class 2606 OID 237793)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (tempo, studente, "corso di studi", "anno accademico", "tipo immatricolazione");


--
-- TOC entry 1963 (class 2606 OID 237636)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (id);


--
-- TOC entry 1965 (class 2606 OID 237638)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (id);


--
-- TOC entry 1967 (class 2606 OID 237640)
-- Name: tipo immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tipo immatricolazione"
    ADD CONSTRAINT "tipo immatricolazione_pkey" PRIMARY KEY (id);


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-08 16:31:14

--
-- PostgreSQL database dump complete
--

