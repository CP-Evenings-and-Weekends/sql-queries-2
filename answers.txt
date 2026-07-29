-- 1. Get the count of users per city.

SELECT 
		city, 
		COUNT(DISTINCT profile_id) AS count_of_users
FROM 	userprofile
GROUP BY city
ORDER BY COUNT_OF_USERS DESC;

-- 2. Get the count of users per city, excluding Chicago.

SELECT 
	city, 
	COUNT(DISTINCT profile_id) AS count_of_users
FROM 
	userprofile
WHERE 
	city <> 'Chicago'
GROUP BY 
	city
ORDER BY 
	COUNT_OF_USERS DESC;

-- 3. Get the number of advertisements per date in descending order.

SELECT 
		advertisement_date, 
		COUNT(advertisement_id) AS num_ads
FROM 	advertisement
GROUP BY advertisement_date
ORDER BY NUM_ADS DESC;



-- 4. Get the number of advertisements per date before February 2014, in descending order.

SELECT 
		advertisement_date, 
		COUNT(advertisement_id) AS num_ads
FROM 	advertisement
WHERE 	EXTRACT(YEAR FROM advertisement_date) = 2014
		AND EXTRACT(MONTH FROM advertisement_date) = 2
GROUP BY advertisement_date
ORDER BY NUM_ADS DESC;


-- 5. Get the number of advertisements per month.

SELECT 	DATE_TRUNC('month', advertisement_date) AS ad_month,
		COUNT(advertisement_id) AS num_ads
FROM 
		ADVERTISEMENT 
GROUP BY 
		DATE_TRUNC('month', advertisement_date)
ORDER BY 
		ad_month;


-- 6. What are the first names of users who placed ads in June of 2015?

-- EDA to see if we have data for June 2015; and we don't

SELECT MIN(advertisement_date), MAX(advertisement_date)
FROM ADVERTISEMENT;

-- If I had data for June 2015, this would be my query

SELECT 
		first_name, 
		advertisement_date::date AS just_date
FROM 
		ADVERTISEMENT a
JOIN
		APPUSER au
ON 
		a.SELLER_ACCOUNT_ID = au.ACCOUNT_ID 
WHERE
		advertisement_date >='2015-06-01' 
		AND advertisement_date < '2015-07-01'

-- 7. What are the makes of cars that Wilda Giguere advertised?
		
-- EDA to see what data I have
		
SELECT * FROM APPUSER WHERE last_name ILIKE '%giguere%' LIMIT 5; 
SELECT * FROM ADVERTISEMENT LIMIT 5;
SELECT * FROM CAR LIMIT 5;
SELECT * FROM CARMODEL LIMIT 5; 


SELECT 	
		cm.make, 
		a.first_name, 
		a.last_name, 
		COUNT(ad.ADVERTISEMENT_ID) AS num_ads
FROM 	APPUSER a
JOIN 
		ADVERTISEMENT ad
			ON a.ACCOUNT_ID = ad.SELLER_ACCOUNT_ID 
JOIN
		CAR c
			ON c.CAR_ID = ad.CAR_ID 
JOIN
		CarModel cm
			ON c.CAR_MODEL_ID = cm.CAR_MODEL_ID 
WHERE 
		ad.ADVERTISEMENT_ID > 0 AND a.last_name ILIKE '%giguere%'
GROUP BY 
		cm.make,
		a.last_name,
		a.first_name
ORDER BY 
		num_ads DESC;














