with population_municipality as (
    select * from {{ ref('fct_population_municipality') }}
),
growth as (
    select 
        year,
        municipality_id,
        municipality_population,
        lag(municipality_population) over (
            partition by municipality_id
            order by year
        ) as previous_population
    from population_municipality
)
select 
    *,
    previous_population as municipality_previous_population,
    municipality_population - previous_population as absolute_growth,
    case 
        when previous_population is null or previous_population = 0 then null
        else (municipality_population - previous_population) / previous_population
    end as growth_rate
from growth