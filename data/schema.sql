--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: requirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requirement (
    id integer NOT NULL,
    country_code character varying NOT NULL,
    business_name character varying,
    requirements jsonb
);


ALTER TABLE public.requirement OWNER TO postgres;

--
-- Name: requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requirements (
    id integer NOT NULL,
    country_code character varying NOT NULL,
    business_name character varying NOT NULL,
    requirements jsonb NOT NULL
);


ALTER TABLE public.requirements OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requirements_id_seq OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;


--
-- Name: requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);


--
-- Name: requirement requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirement
    ADD CONSTRAINT requirement_pkey PRIMARY KEY (id);


--
-- Name: requirements requirements_country_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_country_code_key UNIQUE (country_code);


--
-- Name: requirements requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- Name: idx_country_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_country_code ON public.requirements USING btree (country_code);


--
-- PostgreSQL database dump complete
--

