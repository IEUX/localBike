
      
        
        
        delete from "neondb"."dbt_localbike"."fct_order_items" as DBT_INTERNAL_DEST
        where (order_item_key) in (
            select distinct order_item_key
            from "fct_order_items__dbt_tmp153403885527" as DBT_INTERNAL_SOURCE
        );

    

    insert into "neondb"."dbt_localbike"."fct_order_items" ("order_item_key", "order_id", "item_id", "order_date", "order_status_code", "customer_id", "store_id", "staff_id", "product_id", "brand_id", "category_id", "quantity", "list_price", "discount", "net_revenue")
    (
        select "order_item_key", "order_id", "item_id", "order_date", "order_status_code", "customer_id", "store_id", "staff_id", "product_id", "brand_id", "category_id", "quantity", "list_price", "discount", "net_revenue"
        from "fct_order_items__dbt_tmp153403885527"
    )
  