with stg_employee as (
    select
        businessentityid,
        jobtitle,
        hiredate,
        birthdate,
        maritalstatus,
        gender
    from {{ source('raw-data', 'employee') }}
)
select *
from stg_employee
