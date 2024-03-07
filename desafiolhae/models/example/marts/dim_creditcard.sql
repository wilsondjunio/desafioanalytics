with dim_creditcard as (
    select 
        row_number() over (order by sales_order_header.creditcardid) as creditcard_key 
        , sales_order_header.creditcardid 
        , credit_card.cardtype 
    from (
        select 
            distinct creditcardid 
        from {{ ref('stg_sales_order_header') }} 
        where creditcardid is not null 
    ) as sales_order_header
    left join {{ ref('stg_creditcard') }} as credit_card on sales_order_header.creditcardid = credit_card.creditcardid
    where sales_order_header.creditcardid is not null
)
select *
from dim_creditcard