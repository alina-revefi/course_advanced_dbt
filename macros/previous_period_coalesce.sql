{% macro previous_period_coalesce(lag_column_name, order_column_name, default_value, column_name) %}
    COALESCE(
            LAG({{ lag_column_name }}) OVER (PARTITION BY user_id, subscription_id ORDER BY {{ order_column_name }}),
            {{ default_value }}
        ) AS {{ column_name }}
{% endmacro %}
