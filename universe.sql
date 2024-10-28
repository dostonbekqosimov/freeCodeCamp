--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    type text,
    age_in_billions numeric,
    contains_life boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter numeric,
    distance_from_planet integer,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    mass numeric,
    distance_from_star integer,
    has_rings boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    size_class text,
    temperature integer,
    is_visible_from_earth boolean NOT NULL
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
-- Name: universe_observations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_observations (
    observation_id integer NOT NULL,
    description text NOT NULL,
    galaxy_observed integer,
    observation_date date,
    telescope_used character varying(60)
);


ALTER TABLE public.universe_observations OWNER TO freecodecamp;

--
-- Name: universe_observations_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_observations_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_observations_observation_id_seq OWNER TO freecodecamp;

--
-- Name: universe_observations_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_observations_observation_id_seq OWNED BY public.universe_observations.observation_id;


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
-- Name: universe_observations observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_observations ALTER COLUMN observation_id SET DEFAULT nextval('public.universe_observations_observation_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.51, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12.0, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13.0, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 12.0, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13.3, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 0, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.4, 9, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, 24, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 422, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, 671, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1070, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, 1883, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1222, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 238, false);
INSERT INTO public.moon VALUES (10, 'Miranda', 7, 471, 130, false);
INSERT INTO public.moon VALUES (11, 'Ariel', 7, 1158, 191, false);
INSERT INTO public.moon VALUES (12, 'Umbriel', 7, 1169, 266, false);
INSERT INTO public.moon VALUES (13, 'Triton', 8, 2706, 355, true);
INSERT INTO public.moon VALUES (14, 'Proxima Centauri b Moon 1', 9, 1000, 0, false);
INSERT INTO public.moon VALUES (15, 'Proxima Centauri b Moon 2', 9, 800, 0, false);
INSERT INTO public.moon VALUES (16, 'Alpha Centauri Bb Moon', 10, 1200, 0, false);
INSERT INTO public.moon VALUES (17, 'Kepler-442b Moon', 11, 1800, 0, false);
INSERT INTO public.moon VALUES (18, 'HD 189733 b Moon 1', 12, 1300, 0, true);
INSERT INTO public.moon VALUES (19, 'HD 189733 b Moon 2', 12, 1100, 0, false);
INSERT INTO public.moon VALUES (20, 'HD 189733 b Moon 3', 12, 1000, 0, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055, 58, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, 108, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.0, 149, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107, 228, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.8, 778, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.2, 1427, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.5, 2871, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.1, 4495, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 1.17, 0, false);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 6, 1.27, 23, false);
INSERT INTO public.planet VALUES (11, 'Kepler-442b', 7, 2.36, 1120, false);
INSERT INTO public.planet VALUES (12, 'HD 189733 b', 12, 1.14, 63, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 5778, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'M-type', 3042, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 9940, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 'Red Giant', 3500, true);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 'Blue Supergiant', 11000, true);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 2, 'G-type', 5790, true);
INSERT INTO public.star VALUES (7, 'Vega', 1, 'A-type', 9602, true);
INSERT INTO public.star VALUES (8, 'Antares', 4, 'Red Supergiant', 3200, false);
INSERT INTO public.star VALUES (9, 'Arcturus', 1, 'K-type', 4286, true);
INSERT INTO public.star VALUES (10, 'Aldebaran', 5, 'K-type', 3910, true);
INSERT INTO public.star VALUES (11, 'Polaris', 6, 'F-type', 6015, false);
INSERT INTO public.star VALUES (12, 'Canopus', 6, 'A-type', 7350, true);


--
-- Data for Name: universe_observations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_observations VALUES (1, 'Observed spiral arms and central bulge structure', 1, '2023-07-15', 'Hubble Space Telescope');
INSERT INTO public.universe_observations VALUES (2, 'Detected signs of possible exoplanets orbiting stars', 2, '2022-11-22', 'James Webb Space Telescope');
INSERT INTO public.universe_observations VALUES (3, 'Measured distance and size of the galaxy cluster', 3, '2024-01-10', 'Very Large Telescope');
INSERT INTO public.universe_observations VALUES (4, 'Analyzed light spectrum for potential life indicators', 1, '2023-04-18', 'Hubble Space Telescope');
INSERT INTO public.universe_observations VALUES (5, 'Studied gravitational lensing effect around galaxy', 5, '2021-08-09', 'Keck Observatory');
INSERT INTO public.universe_observations VALUES (6, 'Recorded high-energy gamma rays near galaxy core', 6, '2023-02-03', 'Fermi Gamma-ray Space Telescope');


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: universe_observations_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_observations_observation_id_seq', 6, true);


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
-- Name: universe_observations universe_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_observations
    ADD CONSTRAINT universe_observations_pkey PRIMARY KEY (observation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: universe_observations universe_observations_galaxy_observed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_observations
    ADD CONSTRAINT universe_observations_galaxy_observed_fkey FOREIGN KEY (galaxy_observed) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

