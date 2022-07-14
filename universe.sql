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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    name_symbolism character varying,
    celestial_hemisphere character varying
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_ly numeric,
    constellation text,
    distance_from_earth_mly integer,
    scientific_name character varying
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
    name character varying NOT NULL,
    planet_id integer,
    distance_from_planet_km integer,
    has_water boolean
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
    name character varying NOT NULL,
    star_id integer,
    has_moons boolean,
    moon_count integer,
    distance_from_star_au numeric(4,1),
    radius_km numeric(10,1),
    has_water boolean
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
    name character varying NOT NULL,
    galaxy_id integer,
    planet_count integer,
    has_planets boolean,
    star_type character varying,
    constellation character varying
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

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'The Archer', 'Southern');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'The Big Bear', 'Northern');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'The Queen', 'Northern');
INSERT INTO public.constellation VALUES (4, 'Orion', 'The Hunter', 'Both');
INSERT INTO public.constellation VALUES (5, 'Canis Major', 'The Big Dog', 'Both');
INSERT INTO public.constellation VALUES (6, 'Centaurus', 'The Centaur', 'Southern');
INSERT INTO public.constellation VALUES (7, 'Crux', 'The Cross', 'Southern');
INSERT INTO public.constellation VALUES (8, 'Carina', 'The Keel', 'Southern');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Sagittarius', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 'Andromeda', 3, 'M31');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 76000, 'Canes Venatici', 31, 'M51a');
INSERT INTO public.galaxy VALUES (4, 'Pisces Dwarf', NULL, 'Pisces', 3, NULL);
INSERT INTO public.galaxy VALUES (5, 'Lindsay-Shapley Ring', 150000, 'Volans', 300, 'AM 0644-741');
INSERT INTO public.galaxy VALUES (6, 'Circinus', 1400, 'Circinus', 13, 'ESO 97-G13');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1070400, true);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1883000, true);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 670900, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1200000, true);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 23460, false);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 6000, false);
INSERT INTO public.moon VALUES (6, 'Io', 5, 421700, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 238000, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 3560820, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 527108, true);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 377396, true);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 294619, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 185539, true);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 435910, true);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 583520, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 266000, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 191020, true);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 129390, true);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 354759, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, NULL, 0.4, 2439.7, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, NULL, 0.7, 6051.8, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 1, 1.0, 6371.0, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 2, 1.5, 3389.5, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, 80, 5.2, 69911.0, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, 83, 9.5, 58232.0, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, 27, 19.2, 25362.0, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, 14, 30.1, 24622.0, true);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 2, NULL, NULL, 1.0, 9567.0, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 3, NULL, NULL, 0.1, 8291.4, false);
INSERT INTO public.planet VALUES (11, 'WASP-96b', 8, NULL, NULL, 0.0, 83893.0, true);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 9, NULL, NULL, NULL, 15307.0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, true, 'Yellow Dwarf', NULL);
INSERT INTO public.star VALUES (2, 'Kepler-452', 1, 3, true, 'Yellow Dwarf', 'Cygnus');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 3, true, 'Red Dwarf', 'Centaurus');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, NULL, false, 'Yellow Dwarf', 'Centaurus');
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1, NULL, false, 'Orange Dwarf', 'Centaurus');
INSERT INTO public.star VALUES (6, 'Sirius A', 1, NULL, false, 'A-type Main-Sequence', 'Canis Major');
INSERT INTO public.star VALUES (7, 'Sirius B', 1, NULL, false, 'White Dwarf', 'Canis Major');
INSERT INTO public.star VALUES (8, 'WASP-96', 1, 1, true, 'Yellow Dwarf', 'Phoenix');
INSERT INTO public.star VALUES (9, 'Kepler-22', 1, 1, true, 'Yellow Dwarf', 'Cygnus');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

