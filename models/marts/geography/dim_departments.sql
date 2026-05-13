select
    distinct department_id,
    department_name,
    region_id
from {{ ref('stg_insee__municipalities') }}
qualify row_number() over (
    partition by municipality_id
    order by year desc
) = 1