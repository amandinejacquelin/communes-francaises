with population_region as (
    select * from {{ ref('fct_population_region') }}
),
growth as (
    select 
        year,
        region_id,
        region_population,
        lag(region_population) over (
            partition by region_id
            order by year
        ) as previous_population
    from population_region
)
select 
    *,
    previous_population as region_previous_population,
    region_population - previous_population as absolute_growth,
    case 
        when previous_population is null or previous_population = 0 then null
        else (region_population - previous_population) / previous_population
    end as growth_rate
from growth