--
-- PostgreSQL database cluster dump
--

-- Started on 2016-09-07 23:20:19

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS VALID UNTIL 'infinity';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5244af1e2823d5eaeeffc42c5096d8260';






--
-- Database creation
--

CREATE DATABASE "CrudDB" WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE "TestEJB" WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE cukiernia WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "CrudDB"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-09-07 23:20:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 188 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 188
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 65547)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 65554)
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dishes (
    id integer NOT NULL,
    description character varying(255),
    name character varying(255),
    price double precision NOT NULL,
    categories_id integer
);


ALTER TABLE dishes OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16454)
-- Name: dogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dogs (
    id integer NOT NULL,
    name character varying(255),
    weight double precision NOT NULL
);


ALTER TABLE dogs OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16418)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 73739)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    name character varying(255),
    dish_id integer
);


ALTER TABLE ingredients OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 32779)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    order_id integer NOT NULL,
    payment boolean NOT NULL,
    price integer NOT NULL
);


ALTER TABLE orders OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16459)
-- Name: revinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE revinfo OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16464)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2148 (class 0 OID 65547)
-- Dependencies: 185
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name) FROM stdin;
1	breakfast
2	meat
3	fish
4	soups
11	DupaKategoria
13	DupaKategoria2
\.


--
-- TOC entry 2149 (class 0 OID 65554)
-- Dependencies: 186
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dishes (id, description, name, price, categories_id) FROM stdin;
3	salmon	salmon with rise	32	3
1	scrambled egg	scrambled egg with bacon	10	1
2	beef	wellington beef	29	2
4	pumpkin cream soup	pumpkin cream soup	14	4
5	tomato sour cream	tomato sour cream soup	15	4
6	tuna sandwich	tuna sandwich	12	1
7	cooked loin	cooked loin with spinach	21	2
8	tuna steak with lemon	tuna steak with lemon	39	3
\.


--
-- TOC entry 2144 (class 0 OID 16454)
-- Dependencies: 181
-- Data for Name: dogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dogs (id, name, weight) FROM stdin;
10	pies	37
\.


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 180
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 13, true);


--
-- TOC entry 2150 (class 0 OID 73739)
-- Dependencies: 187
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingredients (id, name, dish_id) FROM stdin;
1	egg	1
2	beef	2
3	salmon	3
4	rise	3
5	pumpkin	4
6	cream	4
8	tuna	6
7	cream	5
9	spinach	6
10	tomato	5
11	bacon	1
12	tuna	8
13	mozarella	8
14	lemon	8
\.


--
-- TOC entry 2147 (class 0 OID 32779)
-- Dependencies: 184
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (order_id, payment, price) FROM stdin;
\.


--
-- TOC entry 2145 (class 0 OID 16459)
-- Dependencies: 182
-- Data for Name: revinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY revinfo (rev, revtstmp) FROM stdin;
\.


--
-- TOC entry 2146 (class 0 OID 16464)
-- Dependencies: 183
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, name, password, role) FROM stdin;
1	jc@jc.com	Jesus Christ	jc	ADMIN
2	hh@hh.com	Herb Herb	hh	USER
\.


--
-- TOC entry 2018 (class 2606 OID 65553)
-- Name: categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 2020 (class 2606 OID 65551)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 65563)
-- Name: dishes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dishes
    ADD CONSTRAINT dishes_name_key UNIQUE (name);


--
-- TOC entry 2024 (class 2606 OID 65561)
-- Name: dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- TOC entry 2008 (class 2606 OID 16458)
-- Name: dogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dogs
    ADD CONSTRAINT dogs_pkey PRIMARY KEY (id);


--
-- TOC entry 2026 (class 2606 OID 73743)
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 2016 (class 2606 OID 32783)
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 2010 (class 2606 OID 16463)
-- Name: revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- TOC entry 2012 (class 2606 OID 16473)
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 2014 (class 2606 OID 16471)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 73746)
-- Name: fk2ef5ca2a9a1e9cc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT fk2ef5ca2a9a1e9cc FOREIGN KEY (dish_id) REFERENCES dishes(id);


--
-- TOC entry 2027 (class 2606 OID 65564)
-- Name: fk78350fc84087d0c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dishes
    ADD CONSTRAINT fk78350fc84087d0c FOREIGN KEY (categories_id) REFERENCES categories(id);


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-07 23:20:21

--
-- PostgreSQL database dump complete
--

\connect "TestEJB"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-09-07 23:20:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 180 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-07 23:20:22

--
-- PostgreSQL database dump complete
--

\connect cukiernia

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-09-07 23:20:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 180 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-07 23:20:24

--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-09-07 23:20:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2095 (class 1262 OID 12373)
-- Dependencies: 2094
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 181 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 181
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 180 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-07 23:20:25

--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-09-07 23:20:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2094 (class 1262 OID 1)
-- Dependencies: 2093
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- TOC entry 180 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-07 23:20:28

--
-- PostgreSQL database dump complete
--

-- Completed on 2016-09-07 23:20:28

--
-- PostgreSQL database cluster dump complete
--

