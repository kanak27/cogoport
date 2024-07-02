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

--
-- Data for Name: requirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requirement (id, country_code, business_name, requirements) FROM stdin;
\.


--
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requirements (id, country_code, business_name, requirements) FROM stdin;
1	IN	Lohiya Traders	["PAN", "GST"]
\.


--
-- Name: requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requirements_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

