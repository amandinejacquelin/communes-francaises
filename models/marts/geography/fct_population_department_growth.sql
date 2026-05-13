with population_department as (
    select * from {{ ref('fct_population_department') }}
),
growth as (
    select 
        year,
        department_id,
        department_population,
        lag(department_population) over (
            partition by department_id
            order by year
        ) as previous_population
    from population_department
)
select 
    *,
    previous_population as department_previous_population,
    department_population - previous_population as absolute_growth,
    case 
        when previous_population is null or previous_population = 0 then null
        else (department_population - previous_population) / previous_population
    end as growth_rate
from growth