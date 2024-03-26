CREATE TABLE fruits (
    id INTEGER PRIMARY KEY,
    name TEXT,
    price INTEGER,
    season TEXT);

INSERT INTO fruits VALUES (1, "Cactus Pear", 1, "winter");
INSERT INTO fruits VALUES (2, "Passion Fruit", 3, "winter");
INSERT INTO fruits VALUES (3, "Apricot", 2, "spring");
INSERT INTO fruits VALUES (4, "Lychee", 2, "spring");
INSERT INTO fruits VALUES (5, "Guava", 2, "fall");
INSERT INTO fruits VALUES (6, "Pineapple", 4, "fall");
INSERT INTO fruits VALUES (7, "Fig", 1, "summer");
INSERT INTO fruits VALUES (8, "Durian", 10, "summer");

/* What are the cheap fruits? */
SELECT * FROM fruits WHERE price < 4;

/* What are the expensive fruits? */
SELECT * FROM fruits WHERE price > 5;

/* What are the cheap fruits in the summer? */
SELECT * FROM fruits WHERE price < 4 AND season = "summer";

/* What fruits can I get in fall or winter? */
SELECT * FROM fruits WHERE season = "fall" OR season = "winter";
