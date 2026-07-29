1. SELECT COUNT(city) FROM UserProfile;
2. SELECT COUNT(*) FROM UserProfile WHERE NOT city = 'Chicago';
3. SELECT COUNT(*), advertisement_date FROM Advertisement GROUP BY advertisement_date ORDER BY COUNT(*) DESC;
4. SELECT COUNT(*), advertisement_date FROM Advertisement WHERE advertisement_date < '2014-02-01' GROUP BY advertisement_date ORDER BY COUNT(*) DESC;
5. SELECT EXTRACT(MONTH FROM advertisement_date) AS adv_month, COUNT(*) FROM Advertisement GROUP BY adv_month;
6. SELECT AppUser.first_name, TO_CHAR(Advertisement.advertisement_date, '06-DD-2015') AS month_june FROM AppUser JOIN Advertisement ON AppUser.account_id = Advertisement.seller_account_id;