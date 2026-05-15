select
    municipality_id,
    municipality_name,
    department_id,
    region_id
from {{ ref('stg_insee__municipalities') }}
qualify row_number() over (
    partition by municipality_id
    order by year desc
) = 1