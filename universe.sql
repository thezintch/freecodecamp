--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    angle integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelation_constelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelation_constelation_id_seq OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelation_constelation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_ly integer,
    is_galaxy boolean,
    dist_to_earth_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    is_main boolean,
    diameter_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    is_habitable boolean,
    dist_to_earth_ly numeric(6,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    class character varying(2) NOT NULL,
    galaxy_id integer,
    brightness_k integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constelation_constelation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 1, NULL, NULL);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 1, NULL, NULL);
INSERT INTO public.constellation VALUES (3, 'Taurus', 1, NULL, NULL);
INSERT INTO public.constellation VALUES (4, 'Lyra', 1, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 120000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 37000, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 60000, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Backward', 200000, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Eye of God', 2000, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Bianca', 7, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Portia', 7, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Julia', 7, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Puck', 7, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Mab', 7, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Metis', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Adrastea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Amalthea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Thebe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Epimetheus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Mimas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Janus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Titan', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Proxima b', 16, NULL, 4.3);
INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 17, NULL, 492.0);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 18, NULL, 50.0);
INSERT INTO public.planet VALUES (12, 'Kepler-42 d', 13, NULL, 126.0);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (3, 'Venus', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, 0.0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, NULL, 0.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 1, NULL);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'B', 2, NULL);
INSERT INTO public.star VALUES (11, 'Kepler-32', 'B', 1, NULL);
INSERT INTO public.star VALUES (13, 'Kepler-42', 'B', 1, NULL);
INSERT INTO public.star VALUES (14, 'Kepler-16 A', 'B', 1, NULL);
INSERT INTO public.star VALUES (15, 'Kepler-1 A', 'B', 1, NULL);
INSERT INTO public.star VALUES (16, 'Proxima Centrauri', 'M', 1, NULL);
INSERT INTO public.star VALUES (17, 'Kepler-186', 'M', 1, NULL);
INSERT INTO public.star VALUES (18, '51 Pegasi', 'G', 1, NULL);


--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelation_constelation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: constellation cons_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT cons_pk PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation unique_const_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_const_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_qalaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_qalaxy_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: constellation constelation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constelation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

