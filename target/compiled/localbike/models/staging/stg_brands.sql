with source as (
    select * from "neondb"."public"."brands"
),

renamed as (
    select
        cast(brand_id as integer)            as brand_id,
        cast(trim(brand_name) as TEXT) as brand_name
    from source
)

select * from renamed