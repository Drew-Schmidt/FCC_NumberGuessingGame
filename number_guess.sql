--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (60, 'Andrew', 2, 0);
INSERT INTO public.users VALUES (62, 'user_1672334599761', 2, 500);
INSERT INTO public.users VALUES (77, 'user_1672335443606', 2, 501);
INSERT INTO public.users VALUES (61, 'user_1672334599762', 5, 500);
INSERT INTO public.users VALUES (76, 'user_1672335443607', 5, 501);
INSERT INTO public.users VALUES (64, 'user_1672334612753', 2, 500);
INSERT INTO public.users VALUES (65, 'jack', 2, 3);
INSERT INTO public.users VALUES (63, 'user_1672334612754', 6, 13);
INSERT INTO public.users VALUES (79, 'user_1672336189545', 2, 65);
INSERT INTO public.users VALUES (67, 'user_1672334839860', 2, 500);
INSERT INTO public.users VALUES (78, 'user_1672336189546', 5, 917);
INSERT INTO public.users VALUES (66, 'user_1672334839861', 5, 500);
INSERT INTO public.users VALUES (69, 'user_1672334894230', 2, 500);
INSERT INTO public.users VALUES (68, 'user_1672334894231', 5, 500);
INSERT INTO public.users VALUES (71, 'user_1672334916709', 2, 500);
INSERT INTO public.users VALUES (70, 'user_1672334916710', 5, 500);
INSERT INTO public.users VALUES (73, 'user_1672335012757', 2, 501);
INSERT INTO public.users VALUES (72, 'user_1672335012758', 5, 501);
INSERT INTO public.users VALUES (75, 'user_1672335378233', 2, 501);
INSERT INTO public.users VALUES (74, 'user_1672335378234', 5, 501);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 79, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

