
  create view "neondb"."dbt_localbike"."stg_orders__dbt_tmp"
    
    
  as (
    with source as (
    select * from "neondb"."public"."orders"
),

renamed as (
    select
        cast(order_id as integer)     as order_id,
        cast(customer_id as integer)  as customer_id,
        cast(store_id as integer)     as store_id,
        cast(staff_id as integer)     as staff_id,
        cast(order_status as integer) as order_status_code,
        cast(order_date as date)                   as order_date,
        cast(required_date as date)                as required_date,
        -- unshipped orders carry the literal string 'NULL' in a text column
        cast(nullif(shipped_date, 'NULL') as date) as shipped_date
    from source
)

select * from renamed
  );