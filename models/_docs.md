{% docs __overview__ %}

# LocalBike — Analytics dbt project

This project models LocalBike's raw retail data (the *BikeStores* dataset) into a clean,
documented and tested warehouse that powers the **Operations Dashboard**.

**Layers**
- **staging** — one cleaned view per source table (`stg_*`), light casting/renaming only.
- **intermediate** — reusable joins (`int_*`), compiled inline (ephemeral).
- **marts/core** — conformed dimensions (`dim_*`) and fact tables (`fct_*`).
- **marts/analysis** — one reporting model (`rpt_*`) per business analysis axis, consumed by the dashboard.

**Analysis axes** (objective #1): sales over time · product performance · customer value ·
store performance · staff performance · inventory status · order fulfillment.

See `CLAUDE.md` for connection / run instructions.

{% enddocs %}


{% docs net_revenue %}
Net revenue for an order line, defined consistently across the project as
`quantity × list_price × (1 − discount)`, rounded to 2 decimals
(see the `calculate_net_revenue` macro).
{% enddocs %}


{% docs order_status_code %}
Order workflow status code from the source system:

| code | meaning    |
|------|------------|
| 1    | Pending    |
| 2    | Processing |
| 3    | Rejected   |
| 4    | Completed  |

The human-readable label is joined in from the `seed_order_status` seed.
{% enddocs %}
