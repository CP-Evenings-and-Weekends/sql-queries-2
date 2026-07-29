-- 1
SELECT city, COUNT(*) FROM UserProfile GROUP BY city;
-- 2
SELECT city, COUNT(*) FROM UserProfile WHERE city != 'Chicago' GROUP BY city;
-- 3
SELECT COUNT(*), advertisement_date FROM Advertisement GROUP BY Advertisement_date ORDER BY COUNT(*) DESC;
-- 4
SELECT COUNT(*), advertisement_date FROM Advertisement WHERE Advertisement_date < '2014-02-01' GROUP BY Advertisement_date ORDER BY COUNT(*) DESC;
-- 5
SELECT EXTRACT(MONTH FROM advertisement_date) AS adv_month, COUNT(*) FROM Advertisement GROUP BY adv_month;