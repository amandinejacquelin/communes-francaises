select *
from {{ ref('fct_population_municipality') }}
qualify row_number() over (
    partition by municipality_id
    order by year desc
) = 1