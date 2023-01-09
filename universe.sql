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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    perdiod_in_years integer,
    distance_from_sun integer,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_milions_of_years integer,
    galaxy_types character varying(40)
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
    description text,
    distance_from_earth numeric,
    is_spherical boolean,
    age_in_milions_of_years integer
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
    planet_type character varying(30),
    has_life boolean,
    age_in_milions_of_years integer,
    diameter integer,
    distance_from_star double precision
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
    description text,
    age_in_milions_of_years integer,
    mass double precision,
    temperature double precision,
    radius double precision,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'A periodic comet visible from Earth every 76 years', 76, 6, 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'A non-periodic comet visible from Earth in 1997', NULL, 7, 2);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 'A non-periodic comet visible from Earth in 1996', NULL, 8, 3);
INSERT INTO public.comet VALUES (4, 'Shoemaker-Levy 9', 'A comet that collided with Jupiter in 1994', NULL, 7, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'A spiral galaxy located 2.537 million light-years from Earth', 10000, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy', 'A spiral galaxy located 2.73 million light-years from Earth', 6000, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'A lenticular galaxy located 28 million light-years from Earth', 30000, 'Lenticular galaxy');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'An elliptical galaxy located 400 million light-years from Earth', 60000, 'Elliptical galaxy');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'A barred spiral galaxy located 11.7 million light-years from Earth', 14000, 'Barred spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'A spiral galaxy located 23 million light-years from Earth', 35000, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'A spiral galaxy located 21 million light-years from Earth', 25000, 'Spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s natural satellite', 0.3844, true, 4550);
INSERT INTO public.moon VALUES (2, 'Triton', 8, 'Neptune''s largest moon', 3548, true, 4000);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 'Jupiter''s fourth-largest moon', 670.9, true, 3500);
INSERT INTO public.moon VALUES (4, 'Titan', 6, 'Saturn''s largest moon', 1221.8, true, 3000);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 'Jupiter''s largest moon', 1070.4, true, 2500);
INSERT INTO public.moon VALUES (6, 'Io', 5, 'Jupiter''s third-largest moon', 421.6, true, 2000);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Jupiter''s second-largest moon', 1883.5, true, 1500);
INSERT INTO public.moon VALUES (8, 'Methone', 6, 'Small, dark, and shaped like a potato', 114000, true, 1500);
INSERT INTO public.moon VALUES (9, 'Pandora', 6, 'Named after the Greek mythological figure', 110000, true, 1600);
INSERT INTO public.moon VALUES (10, 'Pan', 6, 'Named after the Greek mythological figure', 131000, true, 1500);
INSERT INTO public.moon VALUES (11, 'Prometheus', 6, 'Named after the Greek mythological figure', 106000, true, 1600);
INSERT INTO public.moon VALUES (12, 'Janus', 6, 'Named after the Roman mythological figure', 151000, true, 1700);
INSERT INTO public.moon VALUES (13, 'Epimetheus', 6, 'Named after the Greek mythological figure', 116000, true, 1600);
INSERT INTO public.moon VALUES (14, 'Atlas', 6, 'Named after the Greek mythological figure', 136000, true, 1700);
INSERT INTO public.moon VALUES (15, 'Polydeuces', 6, 'Named after the Greek mythological figure', 122000, true, 1500);
INSERT INTO public.moon VALUES (16, 'Helene', 6, 'Named after the Greek mythological figure', 128000, true, 1600);
INSERT INTO public.moon VALUES (17, 'Daphnis', 6, 'Named after the Greek mythological figure', 123000, true, 1500);
INSERT INTO public.moon VALUES (18, 'Methone', 6, 'Named after the Greek mythological figure', 114000, true, 1500);
INSERT INTO public.moon VALUES (19, 'Pandora', 6, 'Named after the Greek mythological figure', 110000, true, 1600);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'Largest moon of Neptune', 354759, true, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Mars', 3, 'Terrestrial', false, 4000, 12104, 0.62);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, 'Gas giant', false, 5000, 142984, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 3, 'Gas giant', false, 4500, 120536, 9.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 'Ice giant', false, 4000, 51118, 19.2);
INSERT INTO public.planet VALUES (8, 'Neptune', 3, 'Ice giant', false, 3500, 49528, 30.1);
INSERT INTO public.planet VALUES (9, 'Pluto', 3, 'Dwarf planet', false, 3000, 2370, 39.4);
INSERT INTO public.planet VALUES (1, 'Mercury', 3, 'Terrestrial', false, 4500, 4880, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 3, 'Terrestrial', false, 3000, 4880, 0.39);
INSERT INTO public.planet VALUES (10, 'Proxima b', 4, 'Terrestrial', false, 4000, 4880, 0.39);
INSERT INTO public.planet VALUES (11, 'Proxima c', 4, 'Terrestrial', false, 4000, 4880, 0.39);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 5, 'Super-Jupiter', false, 9000, 4880, 0.39);
INSERT INTO public.planet VALUES (13, 'Sirius b', 10, 'White dwarf', false, 20000, 4880, 0.39);
INSERT INTO public.planet VALUES (14, 'VY Canis Majoris b', 12, 'Super-Jupiter', false, 7000, 4880, 0.39);
INSERT INTO public.planet VALUES (15, 'RW Cephei b', 13, 'Super-Jupiter', false, 6500, 4880, 0.39);
INSERT INTO public.planet VALUES (16, 'Eta Carinae b', 14, 'Super-Jupiter', false, 6500, 4880, 0.39);
INSERT INTO public.planet VALUES (17, 'Antares b', 15, 'Super-Jupiter', false, 7000, 4880, 0.39);
INSERT INTO public.planet VALUES (18, 'Rigel b', 16, 'Super-Jupiter', false, 7500, 4880, 0.39);
INSERT INTO public.planet VALUES (19, 'Bellatrix b', 17, 'Super-Jupiter', false, 6500, 4880, 0.39);
INSERT INTO public.planet VALUES (20, 'Capella b', 18, 'Super-Jupiter', false, 6000, 4880, 0.39);
INSERT INTO public.planet VALUES (21, 'Aldebaran b', 19, 'Super-Jupiter', false, 6500, 4880, 0.39);
INSERT INTO public.planet VALUES (3, 'Earth', 3, 'Terrestrial', true, 5000, 4880, 0.39);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 'A star in the Alpha Centauri triple star system', 5, 1.105, 5790, 1227000000, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 'A star in the Alpha Centauri triple star system', 5, 0.907, 5260, 1147000000, 1);
INSERT INTO public.star VALUES (3, 'Sol', 'The star at the center of the Solar System', 5, 1.989e+30, 5778, 695700000, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'The nearest star to the Solar System', 5, 0.123, 3050, 721600000, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant star in the constellation Orion', 9, 10, 3500, 197800000000, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant star in the constellation Orion', 8, 20, 12000, 263900000000, 2);
INSERT INTO public.star VALUES (7, 'Sun', 'The star at the center of the Solar System', 5000, 1.989, 5778, 695342, 1);
INSERT INTO public.star VALUES (8, 'Polaris', 'The brightest star in the constellation Ursa Minor', 20, 2.02, 7200, 44.72, 2);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 'A red supergiant star in the constellation Orion', 100, 20, 3200, 870, 3);
INSERT INTO public.star VALUES (10, 'Sirius', 'The brightest star in the night sky', 300, 2.06, 9940, 864, 4);
INSERT INTO public.star VALUES (11, 'Proxima Centauri', 'The nearest star to the Solar System', 4000, 0.123, 3042, 0.14, 5);
INSERT INTO public.star VALUES (12, 'VY Canis Majoris', 'A red hypergiant star in the constellation Canis Major', 1000, 40, 3500, 1400, 6);
INSERT INTO public.star VALUES (13, 'RW Cephei', 'A red supergiant star in the constellation Cepheus', 500, 25, 3200, 1200, 6);
INSERT INTO public.star VALUES (14, 'Eta Carinae', 'A luminous blue variable star in the constellation Carina', 400, 150, 40000, 1700, 6);
INSERT INTO public.star VALUES (15, 'Antares', 'A red supergiant star in the constellation Scorpius', 700, 15, 3200, 850, 6);
INSERT INTO public.star VALUES (16, 'Rigel', 'A blue supergiant star in the constellation Orion', 800, 17, 12000, 78, 7);
INSERT INTO public.star VALUES (17, 'Bellatrix', 'A blue giant star in the constellation Orion', 600, 8, 20000, 35, 7);
INSERT INTO public.star VALUES (18, 'Capella', 'A yellow giant star in the constellation Auriga', 400, 2.5, 5200, 23, 7);
INSERT INTO public.star VALUES (19, 'Aldebaran', 'A red giant star in the constellation Taurus', 300, 1.7, 4200, 44, 7);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

