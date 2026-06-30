with source as (
    select * from "neondb"."public"."order_items"
),

renamed as (
    select
        cast(order_id as integer)   as order_id,
        cast(item_id as integer)    as item_id,
        cast(product_id as integer) as product_id,
        cast(quantity as integer)   as quantity,
        cast(list_price as numeric)              as list_price,
        cast(discount as numeric)                as discount,
        -- net revenue for the line (formula centralised in the macro)
        
    round(quantity * list_price * (1 - discount), 2)
 as net_revenue
    from source
)

select * from renamed