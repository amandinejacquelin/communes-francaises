select
    year,
    municipality_id,
    municipality_population
from {{ ref('stg_insee__municipalities') }}
