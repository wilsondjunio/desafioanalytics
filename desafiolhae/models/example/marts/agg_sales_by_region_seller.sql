WITH sales_by_region_seller AS (
    SELECT
        s.territory_name,
        s.full_name,
        COUNT(o.salesorderid) AS total_orders,
        SUM(o.unitprice * o.orderqty) AS total_sales_value
    FROM {{ ref('fct_orders') }} o
    JOIN {{ ref('dim_seller') }} s ON o.seller_fk = s.seller_id
    GROUP BY s.territory_name, s.full_name
)

SELECT
    territory_name,
    full_name,
    total_orders,
    total_sales_value
FROM sales_by_region_seller
