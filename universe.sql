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
    name character varying(10) NOT NULL,
    distance_in_million_light_year numeric(5,2),
    type character varying(20),
    description text
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
    planet_id integer,
    surface_type text,
    orbit_shape text,
    name character varying(20) NOT NULL,
    age integer
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
-- Name: moon_surface; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_surface (
    name character varying(20) NOT NULL,
    moon_surface_id integer NOT NULL,
    description text
);


ALTER TABLE public.moon_surface OWNER TO freecodecamp;

--
-- Name: moon_surface_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_surface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_surface_id_seq OWNER TO freecodecamp;

--
-- Name: moon_surface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_surface_id_seq OWNED BY public.moon_surface.moon_surface_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    type text,
    age_in_billion_years numeric(10,2),
    has_life boolean,
    has_moon boolean,
    number_of_moon integer,
    star_id integer,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    galaxy_id integer,
    age_in_million_years numeric(10,1),
    type text
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
-- Name: moon_surface moon_surface_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface ALTER COLUMN moon_surface_id SET DEFAULT nextval('public.moon_surface_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, 'Barred Spiral', 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'M31', 2.54, 'Spiral', 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (3, 'M33', 2.73, 'Spiral', 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (4, 'M104', 31.10, 'Spiral/Unbarred', 'Sombrero Galaxy');
INSERT INTO public.galaxy VALUES (5, 'M51', 23.16, 'Grand Design Spiral', 'Whirlpool Galaxy');
INSERT INTO public.galaxy VALUES (7, 'E350', 500.00, 'lenticular/ring', 'Cartwheel Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Rocky, Dusty', 'Eclliptical', 'Earths Moon', 1);
INSERT INTO public.moon VALUES (2, 5, 'Icy', 'Elliptical', 'Ganymede', 1);
INSERT INTO public.moon VALUES (3, 6, 'Icy', 'Elliptical', 'Titan', 1);
INSERT INTO public.moon VALUES (4, 5, 'Icy', 'Volcanically', 'Io', 1);
INSERT INTO public.moon VALUES (6, 5, 'Icy', 'Elliptical', 'Europa', 1);
INSERT INTO public.moon VALUES (7, 5, 'Icy', 'Circular', 'Callisto', 1);
INSERT INTO public.moon VALUES (8, 6, 'Icy', 'Elliptical', 'Enceladus', 1);
INSERT INTO public.moon VALUES (9, 8, 'Icy', 'Retrograde', 'Triton', 1);
INSERT INTO public.moon VALUES (10, 6, 'Icy', 'Circular', 'Rhea', 1);
INSERT INTO public.moon VALUES (11, 6, 'Icy', 'Circular', 'Mimas', 1);
INSERT INTO public.moon VALUES (12, 7, 'Icy', 'Circular', 'Oberon', 1);
INSERT INTO public.moon VALUES (13, 7, 'Icy', 'Circular', 'Titania', 1);
INSERT INTO public.moon VALUES (14, 6, 'Icy', 'Circular', 'Dione', 1);
INSERT INTO public.moon VALUES (15, 6, 'Icy', 'Circular', 'Tethys', 1);
INSERT INTO public.moon VALUES (16, 6, 'Icy', 'Elliptical', 'Lapetus', 1);
INSERT INTO public.moon VALUES (17, 4, 'Spiral', 'Circular', 'Phobos', 1);
INSERT INTO public.moon VALUES (18, 4, 'Rocky', 'Circular', 'Deimos', 1);
INSERT INTO public.moon VALUES (19, 6, 'Icy', 'Chaotic', 'Hyperion', 1);
INSERT INTO public.moon VALUES (20, 7, 'Icy', 'Circular', 'Miranda', 1);
INSERT INTO public.moon VALUES (21, 7, 'Icy', 'Circular', 'Ariel', 1);


--
-- Data for Name: moon_surface; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_surface VALUES ('Rocky', 1, NULL);
INSERT INTO public.moon_surface VALUES ('Icy', 2, NULL);
INSERT INTO public.moon_surface VALUES ('Volcanic', 3, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'Terrestial', 4.60, false, false, 0, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 'Terrestial', 4.60, false, false, 0, 1, 2);
INSERT INTO public.planet VALUES ('Earth', 'Terrestial', 4.60, true, true, 1, 1, 3);
INSERT INTO public.planet VALUES ('Mars', 'Terrestial', 4.60, false, true, 2, 1, 4);
INSERT INTO public.planet VALUES ('Jupiter', 'Gas Giant', 4.60, false, true, 79, 1, 5);
INSERT INTO public.planet VALUES ('Saturn', 'Gas Giant', 4.60, false, true, 2, 1, 6);
INSERT INTO public.planet VALUES ('Uranus', 'Ice Giant', 4.60, false, true, 27, 1, 7);
INSERT INTO public.planet VALUES ('Neptune', 'Ice Giant', 4.60, false, true, 14, 1, 8);
INSERT INTO public.planet VALUES ('Kepler-22b', 'Super Earth', 0.00, false, false, 0, 9, 10);
INSERT INTO public.planet VALUES ('Kepler-186', 'Earth-size, rocky', 0.00, false, false, 0, 10, 11);
INSERT INTO public.planet VALUES ('TRAPPIST-1System', 'Earth-size, rocky', 0.00, false, false, 0, 11, 12);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 'Earth-size, rocky', 0.00, false, false, 0, 12, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5.0, 'Yellow Dwarf');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 5.0, 'Yellow Dwarf');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 200.0, 'White Main-Sequence Star');
INSERT INTO public.star VALUES (4, 'Vega', 1, 455.0, 'White Main-sequence Star');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 8.5, 'Red Supergiant');
INSERT INTO public.star VALUES (6, 'Acturus', 1, 7.0, 'Orange Giant');
INSERT INTO public.star VALUES (7, 'Rigel', 1, 9.0, 'Blue Supergiant');
INSERT INTO public.star VALUES (8, 'Alpheratz', 2, 60.0, 'spectroscopic binary star');
INSERT INTO public.star VALUES (9, 'Kepler-22', 1, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Kepler-186', 1, NULL, NULL);
INSERT INTO public.star VALUES (11, 'TRAPPIST-1', 1, NULL, NULL);
INSERT INTO public.star VALUES (12, 'Proxima Centauri', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moon_surface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_surface_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_surface moon_surface_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface
    ADD CONSTRAINT moon_surface_name_key UNIQUE (name);


--
-- Name: moon_surface moon_surface_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_surface
    ADD CONSTRAINT moon_surface_pkey PRIMARY KEY (moon_surface_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

