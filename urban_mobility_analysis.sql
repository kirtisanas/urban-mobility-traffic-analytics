=========================================================
-- URBAN MOBILITY & TRAFFIC ANALYTICS
-- MySQL Project
-- =========================================================

-- =========================================================
-- 1. DATABASE SETUP
-- =========================================================

CREATE DATABASE IF NOT EXISTS devasvi;
USE devasvi;

-- Drop child tables first to avoid foreign-key errors
DROP TABLE IF EXISTS traffic;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS routes;


-- =========================================================
-- 2. ROUTES TABLE
-- =========================================================

CREATE TABLE routes (
    routes_id INT PRIMARY KEY,
    routes_name VARCHAR(30),
    start_location VARCHAR(30),
    end_location VARCHAR(30),
    distance_km FLOAT
);

INSERT INTO routes
(routes_id, routes_name, start_location, end_location, distance_km)
VALUES
(1, 'Mumbai-Thane', 'Mumbai', 'Thane', 25.4),
(2, 'Thane-Navi', 'Thane', 'Navi Mumbai', 28.7),
(3, 'Mumbai-Navi', 'Mumbai', 'Navi Mumbai', 32.5),
(4, 'Pune-Mumbai', 'Pune', 'Mumbai', 31.8),
(5, 'Kalyan-Dombivali', 'Kalyan', 'Dombivali', 24.6),
(6, 'Mumbai-Bandra', 'Mumbai', 'Bandra', 12.8);


-- =========================================================
-- 3. TRIPS TABLE
-- =========================================================

CREATE TABLE trips (
    trip_id INT PRIMARY KEY,
    routes_id INT,
    trip_date DATE,
    trip_time TIME,
    vehicle_type VARCHAR(20),
    travel_time INT,
    FOREIGN KEY (routes_id) REFERENCES routes(routes_id)
);

INSERT INTO trips
(trip_id, routes_id, trip_date, trip_time, vehicle_type, travel_time)
VALUES
(1, 1, '2026-07-01', '08:15:00', 'Bus', 75),
(2, 1, '2026-07-01', '18:30:00', 'Car', 82),
(3, 1, '2026-07-02', '09:00:00', 'Auto', 68),
(4, 1, '2026-07-03', '17:45:00', 'Bus', 88),
(5, 1, '2026-07-04', '10:30:00', 'Taxi', 70),
(6, 1, '2026-07-05', '19:00:00', 'Car', 85),
(7, 1, '2026-07-06', '08:45:00', 'Bus', 79),
(8, 1, '2026-07-07', '18:15:00', 'Auto', 73),

(9, 2, '2026-07-01', '08:30:00', 'Bus', 92),
(10, 2, '2026-07-02', '18:15:00', 'Car', 105),
(11, 2, '2026-07-03', '10:00:00', 'Taxi', 78),
(12, 2, '2026-07-04', '19:00:00', 'Bus', 110),
(13, 2, '2026-07-05', '08:15:00', 'Auto', 88),
(14, 2, '2026-07-06', '17:30:00', 'Car', 102),
(15, 2, '2026-07-07', '09:45:00', 'Bus', 96),
(16, 2, '2026-07-08', '18:45:00', 'Taxi', 108),

(17, 3, '2026-07-01', '08:00:00', 'Car', 95),
(18, 3, '2026-07-02', '17:30:00', 'Bus', 115),
(19, 3, '2026-07-03', '12:00:00', 'Taxi', 82),
(20, 3, '2026-07-04', '18:45:00', 'Car', 108),
(21, 3, '2026-07-05', '09:15:00', 'Bus', 100),
(22, 3, '2026-07-06', '19:15:00', 'Taxi', 120),
(23, 3, '2026-07-07', '08:30:00', 'Car', 98),
(24, 3, '2026-07-08', '17:45:00', 'Bus', 112),

(25, 4, '2026-07-01', '06:30:00', 'Bus', 185),
(26, 4, '2026-07-02', '09:15:00', 'Car', 205),
(27, 4, '2026-07-03', '16:00:00', 'Taxi', 175),
(28, 4, '2026-07-04', '18:30:00', 'Bus', 220),
(29, 4, '2026-07-05', '07:45:00', 'Car', 195),
(30, 4, '2026-07-06', '17:15:00', 'Bus', 215),
(31, 4, '2026-07-07', '10:00:00', 'Taxi', 180),
(32, 4, '2026-07-08', '19:00:00', 'Car', 225),

(33, 5, '2026-07-01', '07:45:00', 'Car', 85),
(34, 5, '2026-07-02', '11:00:00', 'Bus', 92),
(35, 5, '2026-07-03', '17:15:00', 'Taxi', 105),
(36, 5, '2026-07-04', '19:00:00', 'Car', 98),
(37, 5, '2026-07-05', '08:30:00', 'Bus', 90),
(38, 5, '2026-07-06', '18:00:00', 'Car', 108),
(39, 5, '2026-07-07', '09:45:00', 'Taxi', 88),
(40, 5, '2026-07-08', '17:30:00', 'Bus', 100),

(41, 6, '2026-07-01', '08:15:00', 'Bus', 115),
(42, 6, '2026-07-02', '09:30:00', 'Car', 125),
(43, 6, '2026-07-03', '17:45:00', 'Taxi', 135),
(44, 6, '2026-07-04', '18:15:00', 'Bus', 145),
(45, 6, '2026-07-05', '08:45:00', 'Car', 120),
(46, 6, '2026-07-06', '19:00:00', 'Taxi', 140),
(47, 6, '2026-07-07', '10:15:00', 'Bus', 118),
(48, 6, '2026-07-08', '17:30:00', 'Car', 130),
(49, 6, '2026-07-09', '09:00:00', 'Bus', 122),
(50, 6, '2026-07-10', '18:45:00', 'Taxi', 138);


-- =========================================================
-- 4. TRAFFIC TABLE
-- =========================================================

CREATE TABLE traffic (
    traffic_id INT PRIMARY KEY,
    routes_id INT,
    date DATE,
    peak_hour TIME,
    traffic_level VARCHAR(20),
    delay_minutes INT,
    FOREIGN KEY (routes_id) REFERENCES routes(routes_id)
);

INSERT INTO traffic
(traffic_id, routes_id, date, peak_hour, traffic_level, delay_minutes)
VALUES
(1,1,'2026-07-01','08:15:00','High',28),
(2,1,'2026-07-01','18:30:00','High',35),
(3,1,'2026-07-02','09:00:00','Medium',18),
(4,1,'2026-07-03','17:45:00','High',32),
(5,1,'2026-07-04','10:30:00','Low',8),
(6,1,'2026-07-05','19:00:00','High',30),
(7,1,'2026-07-06','08:45:00','Medium',20),
(8,1,'2026-07-07','18:15:00','High',34),

(9,2,'2026-07-01','08:30:00','High',38),
(10,2,'2026-07-02','18:15:00','High',45),
(11,2,'2026-07-03','10:00:00','Medium',22),
(12,2,'2026-07-04','19:00:00','High',48),
(13,2,'2026-07-05','08:15:00','Medium',25),
(14,2,'2026-07-06','17:30:00','High',42),
(15,2,'2026-07-07','09:45:00','Medium',24),
(16,2,'2026-07-08','18:45:00','High',46),

(17,3,'2026-07-01','08:00:00','High',40),
(18,3,'2026-07-02','17:30:00','High',52),
(19,3,'2026-07-03','12:00:00','Medium',20),
(20,3,'2026-07-04','18:45:00','High',47),
(21,3,'2026-07-05','09:15:00','Medium',26),
(22,3,'2026-07-06','19:15:00','High',55),
(23,3,'2026-07-07','08:30:00','High',43),
(24,3,'2026-07-08','17:45:00','High',50),

(25,4,'2026-07-01','06:30:00','Medium',30),
(26,4,'2026-07-02','09:15:00','High',58),
(27,4,'2026-07-03','16:00:00','Medium',25),
(28,4,'2026-07-04','18:30:00','High',65),
(29,4,'2026-07-05','07:45:00','High',50),
(30,4,'2026-07-06','17:15:00','High',62),
(31,4,'2026-07-07','10:00:00','Medium',28),
(32,4,'2026-07-08','19:00:00','High',68),

(33,5,'2026-07-01','07:45:00','Medium',18),
(34,5,'2026-07-02','11:00:00','Low',7),
(35,5,'2026-07-03','17:15:00','High',35),
(36,5,'2026-07-04','19:00:00','Medium',24),
(37,5,'2026-07-05','08:30:00','Medium',20),
(38,5,'2026-07-06','18:00:00','High',38),
(39,5,'2026-07-07','09:45:00','Low',9),
(40,5,'2026-07-08','17:30:00','High',33),

(41,6,'2026-07-01','08:15:00','High',36),
(42,6,'2026-07-02','09:30:00','High',42),
(43,6,'2026-07-03','17:45:00','High',48),
(44,6,'2026-07-04','18:15:00','High',55),
(45,6,'2026-07-05','08:45:00','Medium',27),
(46,6,'2026-07-06','19:00:00','High',52),
(47,6,'2026-07-07','10:15:00','Medium',23),
(48,6,'2026-07-08','17:30:00','High',45),
(49,6,'2026-07-09','09:00:00','Medium',29),
(50,6,'2026-07-10','18:45:00','High',50);


-- =========================================================
-- 5. SQL ANALYSIS QUERIES
-- =========================================================

-- Query 1: Display route names and distances
SELECT routes_name, distance_km
FROM routes;

-- Query 2: Find routes longer than 30 km
SELECT *
FROM routes
WHERE distance_km > 30;

-- Query 3: Find the longest route by distance
SELECT MAX(distance_km) AS longest_route
FROM routes;

-- Query 4: Find the shortest route by distance
SELECT MIN(distance_km) AS shortest_route
FROM routes;

-- Query 5: Display Bus trips
SELECT *
FROM trips
WHERE vehicle_type = 'Bus';

-- Query 6: Find trips with travel time greater than 100 minutes
SELECT *
FROM trips
WHERE travel_time > 100;

-- Query 7: Count total trips
SELECT COUNT(*) AS total_trips
FROM trips;

-- Query 8: Find average travel time
SELECT AVG(travel_time) AS average_travel_time
FROM trips;

-- Query 9: Count trips by vehicle type
SELECT vehicle_type,
       COUNT(*) AS total_trips
FROM trips
GROUP BY vehicle_type;

-- Query 10: Find average travel time by vehicle type
SELECT vehicle_type,
       AVG(travel_time) AS average_travel_time
FROM trips
GROUP BY vehicle_type
ORDER BY average_travel_time DESC;

-- Query 11: Count trips for each route
SELECT routes_id,
       COUNT(*) AS total_trips
FROM trips
GROUP BY routes_id
ORDER BY total_trips DESC;

-- Query 12: Find average travel time for each route
SELECT routes_id,
       AVG(travel_time) AS average_travel_time
FROM trips
GROUP BY routes_id
ORDER BY average_travel_time DESC;

-- Query 13: Find routes having more than 7 trips
SELECT routes_id,
       COUNT(*) AS total_trips
FROM trips
GROUP BY routes_id
HAVING COUNT(*) > 7;

-- Query 14: Display route names with trip details
SELECT r.routes_name,
       r.start_location,
       r.end_location,
       t.vehicle_type,
       t.travel_time
FROM routes r
JOIN trips t
    ON r.routes_id = t.routes_id;

-- Query 15: Count trips for each route name
SELECT r.routes_name,
       COUNT(t.trip_id) AS total_trips
FROM routes r
JOIN trips t
    ON r.routes_id = t.routes_id
GROUP BY r.routes_id, r.routes_name
ORDER BY total_trips DESC;

-- Query 16: Find routes with average travel time above 100 minutes
SELECT r.routes_name,
       AVG(t.travel_time) AS average_travel_time
FROM routes r
JOIN trips t
    ON r.routes_id = t.routes_id
GROUP BY r.routes_id, r.routes_name
HAVING AVG(t.travel_time) > 100;

-- Query 17: Find the longest individual trip and its route
SELECT r.routes_name,
       t.trip_id,
       t.vehicle_type,
       t.travel_time
FROM routes r
JOIN trips t
    ON r.routes_id = t.routes_id
ORDER BY t.travel_time DESC
LIMIT 1;

-- Query 18: Display traffic details with route names
SELECT r.routes_name,
       tr.date,
       tr.peak_hour,
       tr.traffic_level,
       tr.delay_minutes
FROM routes r
JOIN traffic tr
    ON r.routes_id = tr.routes_id;

-- Query 19: Find average traffic delay for each route
SELECT r.routes_name,
       AVG(tr.delay_minutes) AS average_delay
FROM routes r
JOIN traffic tr
    ON r.routes_id = tr.routes_id
GROUP BY r.routes_id, r.routes_name
ORDER BY average_delay DESC;

-- Query 20: Find routes with average delay above 30 minutes
SELECT r.routes_name,
       AVG(tr.delay_minutes) AS average_delay
FROM routes r
JOIN traffic tr
    ON r.routes_id = tr.routes_id
GROUP BY r.routes_id, r.routes_name
HAVING AVG(tr.delay_minutes) > 30;

-- Query 21: Find the route with the highest average traffic delay
SELECT r.routes_name,
       AVG(tr.delay_minutes) AS average_delay
FROM routes r
JOIN traffic tr
    ON r.routes_id = tr.routes_id
GROUP BY r.routes_id, r.routes_name
ORDER BY average_delay DESC
LIMIT 1;

-- Query 22: Count traffic records by traffic level
SELECT traffic_level,
       COUNT(*) AS total_records
FROM traffic
GROUP BY traffic_level
ORDER BY total_records DESC;

-- Query 23: Find trips above the overall average travel time
SELECT *
FROM trips
WHERE travel_time > (
    SELECT AVG(travel_time)
    FROM trips
);

-- Query 24: Find the busiest route by number of trips
SELECT r.routes_name,
       COUNT(t.trip_id) AS total_trips
FROM routes r
JOIN trips t
    ON r.routes_id = t.routes_id
GROUP BY r.routes_id, r.routes_name
ORDER BY total_trips DESC
LIMIT 1;

-- Query 25: Classify routes based on average traffic delay
SELECT r.routes_name,
       AVG(tr.delay_minutes) AS average_delay,
       CASE
           WHEN AVG(tr.delay_minutes) <= 20 THEN 'Low Delay'
           WHEN AVG(tr.delay_minutes) <= 40 THEN 'Medium Delay'
           ELSE 'High Delay'
       END AS delay_category
FROM routes r
JOIN traffic tr
    ON r.routes_id = tr.routes_id
GROUP BY r.routes_id, r.routes_name;

-- Query 26: Rank routes by average traffic delay
SELECT r.routes_name,
       AVG(tr.delay_minutes) AS average_delay,
       RANK() OVER (
           ORDER BY AVG(tr.delay_minutes) DESC
       ) AS delay_rank
FROM routes r
JOIN traffic tr
    ON r.routes_id = tr.routes_id
GROUP BY r.routes_id, r.routes_name;