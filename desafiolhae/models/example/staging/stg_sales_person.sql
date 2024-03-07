with stg_sales_person as (
    select
        businessentityid,
        territoryid,
        salesquota,
        bonus,
        commissionpct,
        salesytd,
        saleslastyear
    from {{ source('raw-data', 'salesperson') }}
)
select *
from stg_sales_person
