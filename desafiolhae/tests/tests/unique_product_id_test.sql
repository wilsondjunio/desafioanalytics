SELECT
    productid
FROM
    {{ ref('stg_products') }}
GROUP BY
    productid
HAVING
    COUNT(*) > 1