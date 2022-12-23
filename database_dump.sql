--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '9e9ff09e-a5b7-4837-b357-cc579a80f11e', 1, '2022-12-23 20:20:51.05314');
INSERT INTO public.sessions VALUES (2, '42611cbd-ccaa-47d8-92a7-6b4a02e6aca4', 2, '2022-12-23 20:32:19.371134');
INSERT INTO public.sessions VALUES (3, 'e6275880-45a4-47a1-8557-1647d2d61b84', 3, '2022-12-23 20:34:11.032624');
INSERT INTO public.sessions VALUES (4, '10d892de-b486-4462-bd37-5600d5c6a9eb', 12, '2022-12-23 20:39:06.067008');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'https://especiais.magazineluiza.com.br/pixdalu', 'qpi38hLf', 1, 1, '2022-12-23 20:21:14.568163');
INSERT INTO public.urls VALUES (2, 'https://especiais.magazineluiza.com.br/pixdalu', 'AXbWqp8n', 2, 4, '2022-12-23 20:32:37.986714');
INSERT INTO public.urls VALUES (3, 'https://especiais.magazineluiza.com.br/pixdalu', 'MgvuU0Yf', 2, 1, '2022-12-23 20:33:09.78129');
INSERT INTO public.urls VALUES (4, 'https://especiais.magazineluiza.com.br/pixdalu', 'BbyL6rAc', 3, 3, '2022-12-23 20:34:31.810582');
INSERT INTO public.urls VALUES (5, 'https://especiais.magazineluiza.com.br/pixdalu', 'MtDaT8Lu', 12, 0, '2022-12-23 20:39:33.412075');
INSERT INTO public.urls VALUES (6, 'https://especiais.magazineluiza.com.br/pixdalu', 'NnEUkMZ0', 12, 0, '2022-12-23 20:39:35.808954');
INSERT INTO public.urls VALUES (7, 'https://especiais.magazineluiza.com.br/pixdalu', '3-GRkLfI', 12, 8, '2022-12-23 20:39:37.846052');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Lunara', 'lunara@driven.com.br', '$2b$10$Ptq/Z8zi1W3vu6dYcpxumuFh6WptloGTHhdzGfvw0rW4pIqp2V9Rq', '2022-12-23 20:20:05.314752');
INSERT INTO public.users VALUES (2, 'Paulo', 'paulo@driven.com.br', '$2b$10$icA8pUPjbnVpNigsNchPVOqhTt3QRNNth2Xp8Ipcd8A.SsyxmuJzm', '2022-12-23 20:32:04.975155');
INSERT INTO public.users VALUES (3, 'João', 'joao@driven.com.br', '$2b$10$bVzi3MWGO2Pi5Ut9WHVhie6nCpwkFmez86Ho0NAeYSaGGgAWE6a3m', '2022-12-23 20:33:51.496126');
INSERT INTO public.users VALUES (4, 'Felipe', 'felipe@driven.com.br', '$2b$10$OU4brIUrFZieRoXMgQ2x2.YuadYuGrBO0xfplcJeB4R7SSeIKlleS', '2022-12-23 20:35:40.631537');
INSERT INTO public.users VALUES (5, 'Joy', 'joy@driven.com.br', '$2b$10$7bC.SdR4N61kOr6BhjtMaewPTbjjPZpeNICVb855N7Y1jcYT9vLja', '2022-12-23 20:36:06.053367');
INSERT INTO public.users VALUES (6, 'Lee', 'lee@driven.com.br', '$2b$10$xh4suJuuCbMzJR3LggoLVep2P5HoKnGbOF1dav5uRbrpnaV4/0kKO', '2022-12-23 20:36:24.196582');
INSERT INTO public.users VALUES (7, 'Alê', 'ale@driven.com.br', '$2b$10$y1wy9i1UWcka63m98qlwre0OmzRW07ZCdMnWoOzhyN2c2377BACxy', '2022-12-23 20:36:36.655544');
INSERT INTO public.users VALUES (8, 'Wandinha', 'wandinha@driven.com.br', '$2b$10$hdrxzUztm330Tenul7ix1etd4ekD9o22iks6XAD9vsk84yXdBkgnS', '2022-12-23 20:36:51.06363');
INSERT INTO public.users VALUES (9, 'Luke', 'luke@driven.com.br', '$2b$10$XBwIjo0J2ZH0H9qi50pdhu12CmDgzWqQBVauwm8YGcpLc2W6rkkEG', '2022-12-23 20:37:13.018834');
INSERT INTO public.users VALUES (10, 'Alice', 'alice@driven.com.br', '$2b$10$ULvgi5uHuQX1lklpy/iVW.wEje/kCTVxsidYMA9UrlEpHWE4Nflx6', '2022-12-23 20:37:22.292071');
INSERT INTO public.users VALUES (11, 'Maria', 'maria@driven.com.br', '$2b$10$i65EOWVYj8IcJqRwtI66EOMS5gcZwDexyWmpd5isFhsSpB4Se5SU2', '2022-12-23 20:38:40.474053');
INSERT INTO public.users VALUES (12, 'Liz', 'liz@driven.com.br', '$2b$10$PfaJuD0.hMqprpwrMT9lAeZTYKoz6pSVr5jryPxkYTFMBXOkH0oj.', '2022-12-23 20:38:48.935649');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO santosjack;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

