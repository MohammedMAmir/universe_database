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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km numeric(9,1),
    orbit_in_years numeric(6,2),
    near_earth boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq1; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq1 OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq1 OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_light_years numeric(9,0),
    type text,
    visible_in_night_sky boolean NOT NULL,
    age_in_billions_of_years numeric(20,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_g_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_g_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_g_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_g_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_g_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_km integer,
    planet_id integer,
    star_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_m_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_m_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_m_id_seq OWNER TO freecodecamp;

--
-- Name: moon_m_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_m_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    habitable boolean NOT NULL,
    size_in_km numeric(10,1),
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_p_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_p_id_seq OWNER TO freecodecamp;

--
-- Name: planet_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_p_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_km numeric(9,0),
    type character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_s_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_s_id_seq OWNER TO freecodecamp;

--
-- Name: star_s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_s_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq1'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_g_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_m_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_p_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_s_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 469.7, 4.60, false);
INSERT INTO public.asteroid VALUES (2, 'Hawking', 1.0, 3.37, false);
INSERT INTO public.asteroid VALUES (3, '2022 LG5', 0.1, 1.79, true);
INSERT INTO public.asteroid VALUES (4, 'Icarus', 0.5, 1.12, true);
INSERT INTO public.asteroid VALUES (5, 'Geographos', 1.3, 1.39, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 'spiral', true, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 'barred spiral', true, 10.0);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 45000, 'spiral', true, 13.1);
INSERT INTO public.galaxy VALUES (4, 'Virgo-A', 60000, 'elliptical', true, 13.2);
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', 540000, 'elliptical', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Elliptical Galaxy', 5000, 'elliptical', false, 12.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1737, 1, 2);
INSERT INTO public.moon VALUES (2, 'Titan', 2574, 9, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 1560, 3, 2);
INSERT INTO public.moon VALUES (4, 'Io', 1821, 3, 2);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 3, 2);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410, 3, 2);
INSERT INTO public.moon VALUES (7, 'Thebe', 49, 3, 2);
INSERT INTO public.moon VALUES (8, 'Phobos', 11, 2, 2);
INSERT INTO public.moon VALUES (9, 'Deimos', 6, 2, 2);
INSERT INTO public.moon VALUES (10, 'Triton', 1353, 4, 2);
INSERT INTO public.moon VALUES (11, 'Thalassa', 41, 4, 2);
INSERT INTO public.moon VALUES (12, 'Mimas', 198, 9, 2);
INSERT INTO public.moon VALUES (13, 'Tethys', 531, 9, 2);
INSERT INTO public.moon VALUES (14, 'Dione', 561, 9, 2);
INSERT INTO public.moon VALUES (15, 'Enceladus', 252, 9, 2);
INSERT INTO public.moon VALUES (16, 'Rhea', 763, 9, 2);
INSERT INTO public.moon VALUES (17, 'Hyperion', 135, 9, 2);
INSERT INTO public.moon VALUES (18, 'Titania', 788, 10, 2);
INSERT INTO public.moon VALUES (19, 'Oberon', 761, 10, 2);
INSERT INTO public.moon VALUES (20, 'Miranda', 235, 10, 2);
INSERT INTO public.moon VALUES (21, 'Ariel', 578, 10, 2);
INSERT INTO public.moon VALUES (22, 'Umbriel', 584, 10, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 6371.0, 2, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 3389.5, 2, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 69911.0, 2, 80);
INSERT INTO public.planet VALUES (4, 'Neptune', false, 24622.0, 2, 14);
INSERT INTO public.planet VALUES (5, 'Kepler-1649c', true, 6753.3, 8, NULL);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', true, 15290.0, 9, 0);
INSERT INTO public.planet VALUES (7, 'Venus', false, 6051.8, 2, 0);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 2439.7, 2, 0);
INSERT INTO public.planet VALUES (9, 'Saturn', false, 58232.0, 2, 83);
INSERT INTO public.planet VALUES (10, 'Uranus', false, 25362.0, 2, 27);
INSERT INTO public.planet VALUES (11, 'Luyten b', true, 8600.9, 7, NULL);
INSERT INTO public.planet VALUES (12, 'Luyten c', false, 6753.2, 7, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Pistol Star', 212880000, 'blue hypergiant', 1);
INSERT INTO public.star VALUES (2, 'Sol', 696700, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (3, 'Delta Andromedae', 7397426, 'red giant', 2);
INSERT INTO public.star VALUES (5, 'Deneb', 141230000, 'blue-white supergiant', 5);
INSERT INTO public.star VALUES (4, 'Sadr', 104360000, 'yellow-white supergiant', 5);
INSERT INTO public.star VALUES (6, 'Epsilon Virginis', 7374400, 'yellow giant', 4);
INSERT INTO public.star VALUES (8, 'Kepler 1649', 175342, 'red dwarf', 1);
INSERT INTO public.star VALUES (9, 'Kepler 22', 681090, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (7, 'Luytens Star', 59628, 'red dwarf', 1);


--
-- Name: asteroids_asteroid_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq1', 5, true);


--
-- Name: galaxy_g_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_g_id_seq', 6, true);


--
-- Name: moon_m_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_m_id_seq', 22, true);


--
-- Name: planet_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_p_id_seq', 12, true);


--
-- Name: star_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_s_id_seq', 9, true);


--
-- Name: asteroid asteroids_pkey1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey1 PRIMARY KEY (asteroid_id);


--
-- Name: planet constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT constraint_name PRIMARY KEY (planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: star pkey_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT pkey_star PRIMARY KEY (star_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: moon primary_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT primary_key PRIMARY KEY (moon_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: asteroid unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

