{#
    Net revenue for an order line: units × unit price, less the discount fraction.
    Centralised here so the revenue definition is identical everywhere it is used.
#}
{% macro calculate_net_revenue(quantity, list_price, discount) %}
    round({{ quantity }} * {{ list_price }} * (1 - {{ discount }}), 2)
{% endmacro %}
