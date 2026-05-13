select
    distinct region_id,
    region_name
from {{ ref('stg_insee__municipalities') }}
qualify row_number() over (
    partition by municipality_id
    order by year desc
) = 1