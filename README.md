# LocalBike — Analytics Engineering (dbt)

Data model for **Local Bike**, a US bike retailer (the *BikeStores* dataset). As Data Engineers we
model the raw operational data with **dbt** so the operations team can **optimise sales and maximise
revenue**, with full **tests + documentation** for the models behind the Operations Dashboard.

Production runs on **dbt Cloud → BigQuery**; the project is developed and tested **locally** against
the source **Postgres** (Neon) database. SQL is kept portable (dbt cross-db macros) across both.

## Analysis axes (the dashboard)

| # | Axis | Reporting model |
|---|------|-----------------|
| 1 | Revenue / sales over time | `rpt_sales_monthly` |
| 2 | Product performance | `rpt_product_performance` |
| 3 | Customer value | `rpt_customer_value` |
| 4 | Store & staff performance | `rpt_store_performance`, `rpt_staff_performance` |
| 5 | Inventory / stock | `rpt_inventory_status` |
| 6 | Order fulfillment | `rpt_order_fulfillment` |

## Architecture

```
sources (neondb.public.*)                9 raw tables
  └─ staging/      stg_*      (views)     1:1 cleaned, casted, renamed
       └─ intermediate/ int_* (ephemeral) reusable joins
            └─ marts/
                 core/     dim_* / fct_*  conformed dims + facts (fct_order_items is incremental)
                 analysis/ rpt_*          one model per analysis axis → exposure: operations_dashboard
```

dbt features used (per the brief — "reuse everything from the TDs"): **sources**, layered
**staging / intermediate / marts**, materializations (**view / ephemeral / table / incremental**),
**generic tests** (unique, not_null, relationships, accepted_values, dbt_utils ranges &
unique-combination), **singular tests**, the **dbt_utils** package, a custom **macro**
(`calculate_net_revenue`), a **seed** (`seed_order_status`), an SCD2 **snapshot**
(`orders_status_snapshot`), **doc blocks** + column descriptions, and an **exposure**.

> Build status: **25 models · 1 snapshot · 1 seed · 1 exposure · 116 data tests — all passing.**

## Run it locally

The system `dbt` is **dbt-fusion**, which has no Postgres adapter, so local runs use **dbt-core +
dbt-postgres** in a virtualenv. Connection lives in a gitignored `profiles.yml`.

```bash
python3 -m venv .venv && .venv/bin/pip install dbt-postgres
.venv/bin/dbt deps  --profiles-dir .
.venv/bin/dbt debug --profiles-dir .          # -> All checks passed!
.venv/bin/dbt build --profiles-dir .          # models + seeds + snapshot + tests
.venv/bin/dbt docs generate --profiles-dir .  # documentation catalog
```

Models build into the isolated schema **`dbt_localbike`** (source tables are never written to).

See **`CLAUDE.md`** for full setup notes, the source-data quirks, and conventions.
