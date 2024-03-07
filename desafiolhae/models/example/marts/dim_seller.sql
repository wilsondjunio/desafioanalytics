with seller_info as (
    select
        e.businessentityid as seller_id
        ,CONCAT(p.firstname, COALESCE(CONCAT(' ', p.middlename), ''), COALESCE(CONCAT(' ', p.lastname), '')) as full_name
        ,e.jobtitle
        ,e.hiredate
        ,sp.territoryid
        ,st.territory_name
        ,st.countryregioncode
        ,st.territory_group
        ,sp.salesquota
        ,sp.bonus
        ,sp.commissionpct
        ,sp.salesytd
        ,sp.saleslastyear
    from {{ ref('stg_employee') }} e
    join {{ ref('stg_person') }} p on e.businessentityid = p.businessentityid
    join {{ ref('stg_sales_person') }} sp on e.businessentityid = sp.businessentityid
    join {{ ref('stg_sales_territory') }} st on sp.territoryid = st.territoryid
)
select *
from seller_info

