-- Create the database
CREATE DATABASE space_observatory;
USE space_observatory;

-- Create schemas
CREATE SCHEMA astronomy;
CREATE SCHEMA agencies;

-- Set search path for convenience (if using PostgreSQL, adjust for your DBMS)
-- For MySQL, we'll explicitly use schema.table format

-- ============================================
-- ASTRONOMY SCHEMA TABLES
-- ============================================

USE space_observatory;

-- GALAXY_CLUSTERS table
CREATE TABLE astronomy.GALAXY_CLUSTERS (
    cluster_id INT PRIMARY KEY,
    cluster_name VARCHAR(100) UNIQUE NOT NULL,
    cluster_type VARCHAR(50),
    cluster_diameter_ly DECIMAL(20, 2)
);

-- GALAXIES table
CREATE TABLE astronomy.GALAXIES (
    galaxy_id INT PRIMARY KEY,
    galaxy_name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_type VARCHAR(50),
    distance_from_earth_ly DECIMAL(20, 2),
    discovered_year INT,
    cluster_id INT,
    FOREIGN KEY (cluster_id) REFERENCES astronomy.GALAXY_CLUSTERS(cluster_id)
);

-- CLUSTER_MEMBERSHIP table (if you want explicit many-to-many relationship)
CREATE TABLE astronomy.CLUSTER_MEMBERSHIP (
    cluster_id INT,
    galaxy_id INT,
    distance_center DECIMAL(20, 2),
    PRIMARY KEY (cluster_id, galaxy_id),
    FOREIGN KEY (cluster_id) REFERENCES astronomy.GALAXY_CLUSTERS(cluster_id),
    FOREIGN KEY (galaxy_id) REFERENCES astronomy.GALAXIES(galaxy_id)
);

-- GALACTIC_FEATURES table
CREATE TABLE astronomy.GALACTIC_FEATURES (
    feature_id INT PRIMARY KEY,
    galaxy_id INT NOT NULL,
    feature_name VARCHAR(100) NOT NULL,
    feature_type VARCHAR(50),
    FOREIGN KEY (galaxy_id) REFERENCES astronomy.GALAXIES(galaxy_id)
);

-- STAR_SYSTEMS table
CREATE TABLE astronomy.STAR_SYSTEMS (
    system_id INT PRIMARY KEY,
    system_name VARCHAR(100),
    galaxy_id INT NOT NULL,
    distance_from_earth_ly DECIMAL(20, 2),
    FOREIGN KEY (galaxy_id) REFERENCES astronomy.GALAXIES(galaxy_id)
);

-- CELESTIAL_BODIES table
CREATE TABLE astronomy.CELESTIAL_BODIES (
    body_id INT PRIMARY KEY,
    body_name VARCHAR(100),
    body_type VARCHAR(50),
    body_mass_kg DECIMAL(30, 2),
    galaxy_id INT,
    system_id INT,
    habitable BOOLEAN,
    FOREIGN KEY (galaxy_id) REFERENCES astronomy.GALAXIES(galaxy_id),
    FOREIGN KEY (system_id) REFERENCES astronomy.STAR_SYSTEMS(system_id)
);

-- ORBITAL_RELATIONSHIPS table
CREATE TABLE astronomy.ORBITAL_RELATIONSHIPS (
    orbit_id INT PRIMARY KEY,
    parent_body_id INT NOT NULL,
    satellite_body_id INT NOT NULL,
    orbital_period_days DECIMAL(20, 2),
    avg_distance_km DECIMAL(30, 2),
    FOREIGN KEY (parent_body_id) REFERENCES astronomy.CELESTIAL_BODIES(body_id),
    FOREIGN KEY (satellite_body_id) REFERENCES astronomy.CELESTIAL_BODIES(body_id)
);

-- GALAXY_OBSERVATIONS table
CREATE TABLE astronomy.GALAXY_OBSERVATIONS (
    obs_id INT PRIMARY KEY,
    galaxy_id INT NOT NULL,
    obs_date DATE,
    wavelength VARCHAR(50),
    telescope VARCHAR(100),
    FOREIGN KEY (galaxy_id) REFERENCES astronomy.GALAXIES(galaxy_id)
);

-- ASTRONAUTS table
CREATE TABLE astronomy.ASTRONAUTS (
    astronaut_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50),
    birth_date DATE,
    status VARCHAR(20)
);

-- ============================================
-- AGENCIES SCHEMA TABLES
-- ============================================

-- SPACE_AGENCIES table
CREATE TABLE agencies.SPACE_AGENCIES (
    agency_id INT PRIMARY KEY,
    agency_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    founded_year INT
);

-- SPACECRAFT table
CREATE TABLE agencies.SPACECRAFT (
    spacecraft_id INT PRIMARY KEY,
    craft_name VARCHAR(100) NOT NULL,
    agency_id INT NOT NULL,
    craft_type VARCHAR(50),
    craft_mass_kg DECIMAL(10, 2),
    FOREIGN KEY (agency_id) REFERENCES agencies.SPACE_AGENCIES(agency_id)
);

-- SPACE_MISSIONS table
CREATE TABLE agencies.SPACE_MISSIONS (
    mission_id INT PRIMARY KEY,
    mission_name VARCHAR(100) NOT NULL,
    agency_id INT NOT NULL,
    spacecraft_id INT NOT NULL,
    launch_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (agency_id) REFERENCES agencies.SPACE_AGENCIES(agency_id),
    FOREIGN KEY (spacecraft_id) REFERENCES agencies.SPACECRAFT(spacecraft_id)
);

-- ============================================
-- CREATE INDEXES FOR BETTER PERFORMANCE
-- ============================================

-- Indexes for astronomy schema
CREATE INDEX idx_galaxies_cluster ON astronomy.GALAXIES(cluster_id);
CREATE INDEX idx_celestial_bodies_galaxy ON astronomy.CELESTIAL_BODIES(galaxy_id);
CREATE INDEX idx_celestial_bodies_system ON astronomy.CELESTIAL_BODIES(system_id);
CREATE INDEX idx_star_systems_galaxy ON astronomy.STAR_SYSTEMS(galaxy_id);
CREATE INDEX idx_features_galaxy ON astronomy.GALACTIC_FEATURES(galaxy_id);
CREATE INDEX idx_observations_galaxy ON astronomy.GALAXY_OBSERVATIONS(galaxy_id);
CREATE INDEX idx_orbital_parent ON astronomy.ORBITAL_RELATIONSHIPS(parent_body_id);
CREATE INDEX idx_orbital_satellite ON astronomy.ORBITAL_RELATIONSHIPS(satellite_body_id);

-- Indexes for agencies schema
CREATE INDEX idx_spacecraft_agency ON agencies.SPACECRAFT(agency_id);
CREATE INDEX idx_missions_agency ON agencies.SPACE_MISSIONS(agency_id);
CREATE INDEX idx_missions_spacecraft ON agencies.SPACE_MISSIONS(spacecraft_id);
