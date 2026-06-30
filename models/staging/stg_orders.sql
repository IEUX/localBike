with source as (
    select * from {{ source('bikestores', 'orders') }}
),

renamed as (
    select
        cast(order_id as {{ dbt.type_int() }})     as order_id,
        cast(customer_id as {{ dbt.type_int() }})  as customer_id,
        cast(store_id as {{ dbt.type_int() }})     as store_id,
        cast(staff_id as {{ dbt.type_int() }})     as staff_id,
        cast(order_status as {{ dbt.type_int() }}) as order_status_code,
        cast(order_date as date)                   as order_date,
        cast(required_date as date)                as required_date,
        -- unshipped orders carry the literal string 'NULL' in a text column
        cast(nullif(shipped_date, 'NULL') as date) as shipped_date
    from source
)

select * from renamed
