with stg_sales_territory as (
    select
        territoryid,
        name as territory_name,
        countryregioncode,
        `group` as territory_group 
    from {{ source('raw-data', 'salesterritory') }}
)
select *
from stg_sales_territory

