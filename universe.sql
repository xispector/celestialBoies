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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    mass_in_mzero bigint,
    size_in_kpc numeric(4,2)
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
    radius_in_km integer,
    orbital_period_in_hours integer,
    planet_id integer
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
-- Name: other_astronomical_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_astronomical_objects (
    other_astronomical_objects_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text
);


ALTER TABLE public.other_astronomical_objects OWNER TO freecodecamp;

--
-- Name: other_astronomical_objects_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_astronomical_objects_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_astronomical_objects_name_seq OWNER TO freecodecamp;

--
-- Name: other_astronomical_objects_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_astronomical_objects_name_seq OWNED BY public.other_astronomical_objects.other_astronomical_objects_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_mt bigint,
    radius_in_km integer,
    is_moon boolean,
    is_ring boolean,
    star_id integer
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
    surface_temperature_in_k bigint,
    radius_in_km bigint,
    age_in_billion numeric(4,2),
    density_in_g_per_cm_u_3 numeric(4,2),
    is_planet boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_astronomical_objects other_astronomical_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_astronomical_objects ALTER COLUMN other_astronomical_objects_id SET DEFAULT nextval('public.other_astronomical_objects_name_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 1150000000000, 26.80);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 1500000000000, 46.56);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'Coma Bernices', NULL, 16.51);
INSERT INTO public.galaxy VALUES (4, 'BodeS Galaxy', 'Ursa Major', NULL, 29.44);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'Sculptor', NULL, 44.23);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'Ursa Major', NULL, 12.52);
INSERT INTO public.galaxy VALUES (7, 'Circinus Galaxy', 'Circinus', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 708, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 7, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 30, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 1560, 85, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 171, 5);
INSERT INTO public.moon VALUES (6, 'Io', 1821, 42, 5);
INSERT INTO public.moon VALUES (7, 'Callistro', 2410, 400, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2574, 382, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, 32, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 198, 22, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 561, 65, 6);
INSERT INTO public.moon VALUES (12, 'Lanpetus', 734, 1903, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 531, 45, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 135, 510, 6);
INSERT INTO public.moon VALUES (15, 'Epimetheus', 29, 16, 6);
INSERT INTO public.moon VALUES (16, 'Telesto', 12, 45, 6);
INSERT INTO public.moon VALUES (17, 'Phoebe', 106, 13213, 6);
INSERT INTO public.moon VALUES (18, 'Miranda', 235, 33, 7);
INSERT INTO public.moon VALUES (19, 'Titania', 788, 208, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1353, 141, 8);


--
-- Data for Name: other_astronomical_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_astronomical_objects VALUES (1, 'Red Ractangle Nebula', 'Nebula');
INSERT INTO public.other_astronomical_objects VALUES (2, 'Pleiades', 'Cluster');
INSERT INTO public.other_astronomical_objects VALUES (3, 'Helleys Comet', 'Comet');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 330010000000000, 2439, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4867500000000000, 6051, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5972168000000000, 6371, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 641710000000000, 3389, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898200000000000000, 69911, true, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568340000000000000, 58232, true, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 86810000000000000, 25362, true, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 102413000000000000, 24622, true, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 13030000000000, 1188, false, false, NULL);
INSERT INTO public.planet VALUES (10, 'Haumea', 4006000000000, 780, false, false, NULL);
INSERT INTO public.planet VALUES (11, 'Makemake', 3100000000000, 715, false, false, NULL);
INSERT INTO public.planet VALUES (12, 'Eirs', 16466000000000, 1163, false, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5772, 696342, 4.60, 1.40, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 3600, 710309700, NULL, NULL, false, 1);
INSERT INTO public.star VALUES (3, 'Antares', 3660, 473076000, NULL, NULL, false, 1);
INSERT INTO public.star VALUES (4, 'Vega', 9602, 1960482, 0.45, NULL, false, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 9940, 1190342, 0.22, NULL, false, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 12100, 54890730, NULL, NULL, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_astronomical_objects_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_astronomical_objects_name_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_astronomical_objects other_astronomical_object_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_astronomical_objects
    ADD CONSTRAINT other_astronomical_object_name UNIQUE (name);


--
-- Name: other_astronomical_objects other_astronomical_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_astronomical_objects
    ADD CONSTRAINT other_astronomical_objects_pkey PRIMARY KEY (other_astronomical_objects_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

