with source as (
    select * from {{ source('bikestores', 'order_items') }}
),

renamed as (
    select
        cast(order_id as {{ dbt.type_int() }})   as order_id,
        cast(item_id as {{ dbt.type_int() }})    as item_id,
        cast(product_id as {{ dbt.type_int() }}) as product_id,
        cast(quantity as {{ dbt.type_int() }})   as quantity,
        cast(list_price as numeric)              as list_price,
        cast(discount as numeric)                as discount,
        -- net revenue for the line (formula centralised in the macro)
        {{ calculate_net_revenue('quantity', 'list_price', 'discount') }} as net_revenue
    from source
)

select * from renamed
