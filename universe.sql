DROP DATABASE universe;


CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE,
  size INT NOT NULL,
  mass NUMERIC,
  has_black_hole BOOLEAN NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE,
  galaxy_id INT,
  temperature INT NOT NULL,
  is_supernova BOOLEAN NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) ON DELETE CASCADE
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE,
  star_id INT,
  radius INT NOT NULL,
  has_life BOOLEAN NOT NULL,
  FOREIGN KEY (star_id) REFERENCES star(star_id) ON DELETE CASCADE
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE,
  planet_id INT,
  surface TEXT NOT NULL,
  is_inhabited BOOLEAN NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id) ON DELETE CASCADE
);




-- Galaxy
INSERT INTO galaxy (name, size, mass, has_black_hole) VALUES
('Milky Way', 100000, 1.5, TRUE),
('Andromeda', 110000, 1.2, FALSE),
('Triangulum', 50000, 0.7, FALSE),
('Sombrero', 30000, 0.5, TRUE),
('Whirlpool', 60000, 0.9, FALSE),
('Pinwheel', 70000, 1.0, TRUE);

-- Star
INSERT INTO star (name, galaxy_id, temperature, is_supernova) VALUES
('Sun', 1, 5500, FALSE),
('Sirius', 1, 9940, FALSE),
('Rigel', 2, 11000, FALSE),
('Betelgeuse', 2, 3600, TRUE),
('Vega', 3, 9600, FALSE),
('Proxima Centauri', 3, 3000, FALSE);

-- Planet
INSERT INTO planet (name, star_id, radius, has_life) VALUES
('Earth', 1, 6371, TRUE),
('Mars', 1, 3389, FALSE),
('Jupiter', 1, 69911, FALSE),
('Venus', 2, 6051, FALSE),
('Saturn', 2, 58232, FALSE),
('Uranus', 2, 25362, FALSE),
('Neptune', 3, 24622, FALSE),
('Mercury', 3, 4879, FALSE),
('Exoplanet1', 4, 12000, FALSE),
('Exoplanet2', 4, 8000, FALSE),
('Exoplanet3', 5, 5000, FALSE),
('Exoplanet4', 6, 10000, FALSE);

-- Moon
INSERT INTO moon (name, planet_id, surface, is_inhabited) VALUES
('Moon', 1, 'Rocky', FALSE),
('Phobos', 2, 'Dusty', FALSE),
('Deimos', 2, 'Dusty', FALSE),
('Io', 3, 'Volcanic', FALSE),
('Europa', 3, 'Icy', FALSE),
('Ganymede', 3, 'Icy', FALSE),
('Callisto', 3, 'Rocky', FALSE),
('Titan', 5, 'Methane Lakes', FALSE),
('Rhea', 5, 'Icy', FALSE),
('Iapetus', 5, 'Rocky', FALSE),
('Oberon', 6, 'Icy', FALSE),
('Titania', 6, 'Rocky', FALSE),
('Miranda', 6, 'Chaotic Terrain', FALSE),
('Triton', 7, 'Nitrogen Ice', FALSE),
('Nereid', 7, 'Irregular', FALSE),
('Charon', 8, 'Icy', FALSE),
('Styx', 8, 'Small and Irregular', FALSE),
('Nix', 8, 'Small and Irregular', FALSE),
('Kerberos', 8, 'Small and Irregular', FALSE),
('Hydra', 8, 'Small and Irregular', FALSE);



CREATE TABLE asteroid (
  asteroid_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  diameter INT NOT NULL,
  composition TEXT,
  is_hazardous BOOLEAN NOT NULL
);

INSERT INTO asteroid (name, galaxy_id, diameter, composition, is_hazardous) VALUES
('Ceres', 1, 940, 'Rocky', FALSE),
('Pallas', 1, 512, 'Metallic', FALSE),
('Vesta', 2, 525, 'Rocky', TRUE);
