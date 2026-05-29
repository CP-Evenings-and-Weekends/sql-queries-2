# SQL Queries 2: GROUP BY and Inner Joins

Write SQL queries against the [cars database](https://github.com/CP-Evenings-and-Weekends/cars-database) to answer the questions below.  Save each query in `queries.sql` and the result in `answers.txt`.

## Setup

Make sure the [cars database](https://github.com/CP-Evenings-and-Weekends/cars-database) is running locally (you should still have it from Monday).

Tables you'll touch today: `AppUser`, `UserProfile`, `Car`, `CarModel`, `Advertisement`.

## Requirements

Answer each of the following with a single SQL query:

1. Get the count of users per city.
2. Get the count of users per city, excluding Chicago.
3. Get the number of advertisements per date in descending order.
4. Get the number of advertisements per date before February 2014, in descending order.
5. Get the number of advertisements per month.
6. What are the first names of users who placed ads in June of 2015?
7. What are the makes of cars that Wilda Giguere advertised?

> Hints:
> - Questions **1–5** can be answered with `GROUP BY` against a single table — no `JOIN` needed.
> - Question **6** needs a `JOIN` between `AppUser` and `Advertisement`.
> - Question **7** needs a 3-way `JOIN` (`AppUser` → `Advertisement` → `Car` → `CarModel`).
> - For "per month" questions, look up `EXTRACT(MONTH FROM ...)` or `DATE_TRUNC('month', ...)`.

## Things to think about
- Question 2 ("excluding Chicago") — do you use `WHERE` or `HAVING`?  Why?  Which one runs faster on a large table, and why?
- Question 5 ("per month") — `EXTRACT(MONTH FROM ...)` vs `DATE_TRUNC('month', ...)`.  What's the difference in the output?  Which is more useful for sorting chronologically across multiple years?
- For Question 7 — if Wilda Giguere advertised the same make twice, should it show up once or twice?  Where does `DISTINCT` fit in?

## Stretch
- For each make, find the **average** number of cars per model.  (Two levels of grouping — try a subquery.)
- Find the users who have placed *no* advertisements.  (Hint: `LEFT JOIN` + `WHERE ... IS NULL`, or `NOT EXISTS`.)
- Find the most-advertised car (the `car_id` that appears most often in `Advertisement`).

> Stuck? Have a code error? Use the ["4 Before Me"](https://docs.google.com/document/d/1nseOs5oabYBKNHfwJZNAR7GlU0zkZxNagsw63AD7XV0/edit) debugging checklist to help you solve it!
