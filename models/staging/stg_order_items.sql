with source as (
    select * from {{ source('bikestores', 'order_items') }}
),

renamed as (
    select
        order_id::int             as order_id,
        item_id::int              as item_id,
        product_id::int           as product_id,
        quantity::int             as quantity,
        list_price::numeric(10, 2) as list_price,
        discount::numeric(4, 2)    as discount,
        -- net revenue for the line (formula centralised in the macro)
        {{ calculate_net_revenue('quantity', 'list_price', 'discount') }} as net_revenue
    from source
)

select * from renamed
