{% macro weekly_periods(column_name, date_column_name) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ date_column_name }}
                ORDER BY {{ date_column_name }}
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ) AS avg_7_periods_{{ column_name }}
{% endmacro %}
