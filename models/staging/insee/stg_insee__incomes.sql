{% set incomes_tables = [
    {'year': 2021, 'table': 'revenus_2021'}
] %}

{% for item in incomes_tables %}

select
    {{ item.year }} as year,
    "Code géographique" as municipality_id,
    "Nom géographique GMS" as municipality_name,
    "[DISP] Médiane (€)" as municipality_median_income
from {{ source('insee', item.table) }}


{% if not loop.last %}
union all
{% endif %}

{% endfor %}
