select
    year,
    municipality_id,
    municipality_median_income
from {{ ref('stg_insee__incomes') }}
order by municipality_id

