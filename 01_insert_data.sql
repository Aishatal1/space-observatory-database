-- ============================================
-- INSERT SAMPLE DATA - SPACE OBSERVATORY
-- ============================================
-- Run this AFTER the schema (00_schema.sql)
-- ============================================

USE space_observatory;

-- ============================================
-- GALAXY_CLUSTERS
-- ============================================
INSERT INTO astronomy.GALAXY_CLUSTERS VALUES 
(1, 'Virgo Cluster', 'Rich Cluster', 11000000.00),
(2, 'Local Group', 'Poor Cluster', 10000000.00),
(3, 'Coma Cluster', 'Rich Cluster', 20000000.00),
(4, 'Fornax Cluster', 'Poor Cluster', 6000000.00),
(5, 'Centaurus Cluster', 'Rich Cluster', 15000000.00);

-- ============================================
-- GALAXIES
-- ============================================
INSERT INTO astronomy.GALAXIES VALUES 
(1, 'Milky Way', 'Spiral', 0.00, 1610, 2),
(2, 'Andromeda', 'Spiral', 2537000.00, 964, 2),
(3, 'Triangulum', 'Spiral', 2730000.00, 1654, 2),
(4, 'Messier 87', 'Elliptical', 53500000.00, 1781, 1),
(5, 'Sombrero Galaxy', 'Spiral', 29300000.00, 1781, 1),
(6, 'Whirlpool Galaxy', 'Spiral', 23000000.00, 1773, 3),
(7, 'Cartwheel Galaxy', 'Ring', 500000000.00, 1941, 4);

-- ============================================
-- STAR_SYSTEMS
-- ============================================
INSERT INTO astronomy.STAR_SYSTEMS VALUES 
(1, 'Solar System', 1, 0.00),
(2, 'Alpha Centauri', 1, 4.37),
(3, 'Sirius System', 1, 8.60),
(4, 'Proxima Centauri', 1, 4.24),
(5, 'Andromeda System A', 2, 2537000.00);

-- ============================================
-- CELESTIAL_BODIES
-- ============================================
INSERT INTO astronomy.CELESTIAL_BODIES VALUES 
(1, 'Sun', 'Star', 1.989e30, 1, 1, FALSE),
(2, 'Earth', 'Planet', 5.972e24, 1, 1, TRUE),
(3, 'Mars', 'Planet', 6.39e23, 1, 1, FALSE),
(4, 'Jupiter', 'Planet', 1.898e27, 1, 1, FALSE),
(5, 'Moon', 'Moon', 7.35e22, 1, 1, FALSE),
(6, 'Proxima Centauri', 'Star', 2.43e29, 1, 4, FALSE),
(7, 'Proxima b', 'Planet', 7.0e24, 1, 4, TRUE),
(8, 'Andromeda Star A', 'Star', 3.2e30, 2, 5, FALSE);

-- ============================================
-- ORBITAL_RELATIONSHIPS
-- ============================================
INSERT INTO astronomy.ORBITAL_RELATIONSHIPS VALUES 
(1, 1, 2, 365.25, 149600000.00),   -- Earth orbits Sun
(2, 1, 3, 687.00, 227900000.00),    -- Mars orbits Sun
(3, 1, 4, 4333.00, 778500000.00),   -- Jupiter orbits Sun
(4, 2, 5, 27.30, 384400.00),        -- Moon orbits Earth
(5, 6, 7, 11.20, 7000000.00);       -- Proxima b orbits Proxima Centauri

-- ============================================
-- SPACE_AGENCIES
-- ============================================
INSERT INTO agencies.SPACE_AGENCIES VALUES 
(1, 'NASA', 'USA', 1958),
(2, 'ESA', 'Europe', 1975),
(3, 'CNSA', 'China', 1993),
(4, 'Roscosmos', 'Russia', 1992),
(5, 'ISRO', 'India', 1969),
(6, 'JAXA', 'Japan', 2003),
(7, 'SpaceX', 'USA', 2002);

-- ============================================
-- SPACECRAFT
-- ============================================
INSERT INTO agencies.SPACECRAFT VALUES 
(1, 'Apollo 11', 1, 'Lunar Lander', 43800.00),
(2, 'James Webb', 1, 'Space Telescope', 6200.00),
(3, 'Hubble', 1, 'Space Telescope', 11110.00),
(4, 'Voyager 1', 1, 'Probe', 825.00),
(5, 'International Space Station', 2, 'Space Station', 419725.00),
(6, 'Chang'e 4', 3, 'Lunar Rover', 3800.00),
(7, 'Falcon 9', 7, 'Rocket', 549054.00);

-- ============================================
-- SPACE_MISSIONS
-- ============================================
INSERT INTO agencies.SPACE_MISSIONS VALUES 
(1, 'Apollo Program', 1, 1, '1969-07-16', '1969-07-24', 'Completed'),
(2, 'JWST Launch', 1, 2, '2021-12-25', NULL, 'Active'),
(3, 'Hubble Deployment', 1, 3, '1990-04-24', NULL, 'Active'),
(4, 'Voyager Interstellar', 1, 4, '1977-09-05', NULL, 'Active'),
(5, 'Chang'e 4 Mission', 3, 6, '2018-12-07', NULL, 'Active');

-- ============================================
-- ASTRONAUTS
-- ============================================
INSERT INTO astronomy.ASTRONAUTS VALUES 
(1, 'Neil', 'Armstrong', 'USA', '1930-08-05', 'Deceased'),
(2, 'Buzz', 'Aldrin', 'USA', '1930-01-20', 'Retired'),
(3, 'Michael', 'Collins', 'USA', '1930-10-31', 'Deceased'),
(4, 'Yuri', 'Gagarin', 'Russia', '1934-03-09', 'Deceased'),
(5, 'Valentina', 'Tereshkova', 'Russia', '1937-03-06', 'Retired'),
(6, 'Samantha', 'Cristoforetti', 'Italy', '1977-04-26', 'Active'),
(7, 'Tim', 'Peake', 'UK', '1972-04-07', 'Retired'),
(8, 'Mae', 'Jemison', 'USA', '1956-10-17', 'Retired');
