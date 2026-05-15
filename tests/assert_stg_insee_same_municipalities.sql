with a as (
    select distinct municipality_id from {{ ref('stg_insee__municipalities') }}
),

b as (
    select distinct municipality_id from {{ ref('stg_insee__incomes') }}
)

select *
from (
    select municipality_id from a
    except
    select municipality_id from b

    union all

    select municipality_id from b
    except
    select municipality_id from a
)