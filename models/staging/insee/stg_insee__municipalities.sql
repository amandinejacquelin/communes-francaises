{% set communes_tables = [
    {'year': 2022, 'table': 'communes_2022'},
    {'year': 2023, 'table': 'communes_2023'},
    {'year': 2024, 'table': 'communes_2024'},
    {'year': 2025, 'table': 'communes_2025'}
] %}

{% for item in communes_tables %}

select
    {{ item.year }} as year,
    code_insee as municipality_id,
    nom_standard as municipality_name,
    population as municipality_population,
    dep_code as department_id,
    dep_nom as department_name,
    reg_code as region_id,
    reg_nom as region_name
from {{ source('insee', item.table) }}


{% if not loop.last %}
union all
{% endif %}

{% endfor %}