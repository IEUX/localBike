with source as (
    select * from {{ source('bikestores', 'orders') }}
),

renamed as (
    select
        order_id::int      as order_id,
        customer_id::int   as customer_id,
        store_id::int      as store_id,
        staff_id::int      as staff_id,
        order_status::int  as order_status_code,
        order_date::date   as order_date,
        required_date::date as required_date,
        -- unshipped orders carry the literal string 'NULL' in a text column
        nullif(shipped_date, 'NULL')::date as shipped_date
    from source
)

select * from renamed
