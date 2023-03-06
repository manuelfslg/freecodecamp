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
    orbital_period_in_years integer,
    avg_distance_from_sun_in_au numeric(3,1),
    has_tail boolean
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
    distance_in_light_years integer,
    type character varying(30),
    diameter_in_light_years integer,
    nr_of_stars_in_billions integer
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
    planet_name character varying(20),
    distance_from_planet_in_km integer,
    mass_in_earth_masses numeric(12,11),
    surface_temperature_in_k character varying(10),
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_sun_in_au numeric(4,2),
    mass_in_earth_masses numeric(5,3),
    atmosphere_composition text,
    diameter_in_earth_diameters numeric(5,3),
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
    distance_in_light_years integer,
    spectral_class character varying(10),
    main_sequence boolean,
    galaxy_id integer,
    apparent_magnitude numeric(4,2)
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

INSERT INTO public.comet VALUES (1, 'Halley', 76, 17.8, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2500, 35.1, true);
INSERT INTO public.comet VALUES (3, 'ATLAS', 6000, 20.2, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', 100000, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, 'Spiral', 220000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2700000, 'Spiral', 60000, 40);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 290000, 'Spiral', 50000, 100);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 27000000, 'Ring', 150000, 1000);
INSERT INTO public.galaxy VALUES (6, 'Sculptor', 11000000, 'Dwarf Elliptical', 4000, 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth', 59565, 0.51515000000, '197', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 9565, 0.23415000000, '-55 to -4', 8);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 1231, 0.12412000000, '-64 to 10', 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter', 12312, 0.12400000000, '124', 2);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Jupiter', 31414, 0.14100000000, '141', 2);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter', 13414, 0.12410000000, '35143', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Jupiter', 3241, 0.12400000000, '140', 10);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn', 341, 0.41240000000, '356', 3);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Saturn', 34134, 0.14124000000, '124', 11);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Saturn', 1341, 0.14100000000, '1241', 2);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Saturn', 2342, 0.51500000000, '134', 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn', 23154, 0.51510000000, '-14', 7);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Saturn', 1341, 0.14000000000, '-141', 8);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'Saturn', 1241244, 0.51500000000, '-180', 4);
INSERT INTO public.moon VALUES (15, 'Phoebe', 'Saturn', 1341, 0.14100000000, '141', 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Uranus', 1341, 0.15100000000, '.15150', 2);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Uranus', 3414, 0.51500000000, '341', 12);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Uranus', 1414, 0.14140000000, '124', 1);
INSERT INTO public.moon VALUES (19, 'Triton', 'Neptune', 12414, 0.00001000000, '-124', 10);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Neptune', 314, 0.41000000000, '1414', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.39, 0.055, 'None', 0.383, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 0.72, 0.815, '96% CO2, 3%N2', 0.949, 5);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1.000, '78% N2, 21% O2', 1.000, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 1.52, 0.107, 'aefadfaef', 0.532, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.20, 5.000, 'qfefeqe', 5.000, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', 5.00, 8.000, 'egavgaeg', 5.000, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 5.60, 8.230, 'aefaef', 9.900, 5);
INSERT INTO public.planet VALUES (8, 'Neptune', 5.36, 4.210, 'efwjifenwef', 0.320, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 1.20, 4.300, 'wgwefewf', 4.500, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 8.80, 2.300, 'wegwegwg', 6.400, 6);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 4.40, 6.300, 'efqef', 1.200, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 0.34, 4.200, 'wegweg', 0.500, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 'G2V', true, 1, -26.70);
INSERT INTO public.star VALUES (2, 'Sirius', 9, 'AV1', true, 2, -1.46);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4, 'M5Ve', false, 5, 11.05);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 4, 'G2V', true, 3, 0.01);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 4, 'K1V', true, 6, 1.33);
INSERT INTO public.star VALUES (6, 'Barnard Star', 6, 'M4V', false, 4, 9.54);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: comet unique_name_comet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_name_comet UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

