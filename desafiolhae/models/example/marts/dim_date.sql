WITH date_sequence AS (
    SELECT 
        DATE AS date
    FROM 
        UNNEST(GENERATE_DATE_ARRAY('2011-01-30', '2014-12-30', INTERVAL 1 DAY)) AS DATE
),
date_attributes AS (
    SELECT
        date,
        EXTRACT(YEAR FROM date) AS year,
        EXTRACT(MONTH FROM date) AS month,
        EXTRACT(DAY FROM date) AS day,
        EXTRACT(ISOWEEK FROM date) AS week_of_year,
        FORMAT_DATE('%A', date) AS day_of_week,
        EXTRACT(DAYOFWEEK FROM date) AS day_of_week_num,
        EXTRACT(QUARTER FROM date) AS quarter,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM date) IN (6, 7) THEN TRUE 
            ELSE FALSE 
        END AS is_weekend
        
    FROM
        date_sequence
)

SELECT * FROM date_attributes

