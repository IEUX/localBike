
      update "neondb"."dbt_localbike"."orders_status_snapshot"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "orders_status_snapshot__dbt_tmp153403821798" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "neondb"."dbt_localbike"."orders_status_snapshot".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "neondb"."dbt_localbike"."orders_status_snapshot".dbt_valid_to is null;
      


    insert into "neondb"."dbt_localbike"."orders_status_snapshot" ("order_id", "order_status_code", "shipped_date", "store_id", "staff_id", "order_date", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."order_id",DBT_INTERNAL_SOURCE."order_status_code",DBT_INTERNAL_SOURCE."shipped_date",DBT_INTERNAL_SOURCE."store_id",DBT_INTERNAL_SOURCE."staff_id",DBT_INTERNAL_SOURCE."order_date",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "orders_status_snapshot__dbt_tmp153403821798" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  