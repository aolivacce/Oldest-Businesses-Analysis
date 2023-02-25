-- import dataset

%%sql 
postgresql:///oldestbusinesses

-- view tables 
SELECT *
FROM categories;

SELECT *
FROM countries;

SELECT *
FROM businesses;

-- Select the oldest and newest founding years from the businesses table

SELECT MIN(year_founded), MAX(year_founded)
FROM businesses;

-- Select all columns from businesses where the founding year was before 1000

SELECT *
FROM businesses
WHERE year_founded < 1000
ORDER BY year_founded;

-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest

SELECT bus.business, bus.year_founded, bus.country_code, cat.category
FROM businesses AS bus
INNER JOIN categories AS cat
ON bus.category_code = cat.category_code
  WHERE year_founded < 1000
    ORDER BY year_founded;
    
-- Select the category and count of category 
-- arranged by descending count, limited to 10 most common categories
SELECT category, COUNT(category) AS n
    FROM categories AS cat
    INNER JOIN businesses AS bus
        ON cat.category_code = bus.category_code
    GROUP BY category
    ORDER BY n DESC
    LIMIT 10;
    
-- Select the oldest founding year (as "oldest") from businesses, 
-- and continent from countries
-- for each continent, ordered from oldest to newest 

SELECT MIN(bus.year_founded) AS oldest, cou.continent
FROM businesses AS bus
INNER JOIN countries AS cou
ON bus.country_code = cou.country_code
GROUP BY cou.continent
ORDER BY oldest;

-- Select the business, founding year, category, country, and continent

SELECT bus.business, bus.year_founded, cat.category, cou.country, cou.continent
FROM categories AS cat
INNER JOIN businesses AS bus 
ON cat.category_code = bus.category_code
INNER JOIN countries AS cou
ON bus.country_code = cou.country_code;

-- Count the number of businesses in each continent and category

SELECT cou.continent, cat.category, COUNT(*) AS n
FROM categories AS cat
INNER JOIN businesses AS bus 
ON cat.category_code = bus.category_code
INNER JOIN countries AS cou
ON bus.country_code = cou.country_code
GROUP BY cou.continent, cat.category;





