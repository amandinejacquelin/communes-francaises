# DBT Project - French municipalities (population and income analytics)

### 1.Tech Stack
- DBT
- Snowflake

### 2.Goal
- Build an analytic model on french municipalities
- Aggregate population at multiple granurality (municipality, department, region)
- Produce derived KPI (growth, estimated income)

### 3.Dataset
- INSEE municipalities :
     
     https://www.data.gouv.fr/datasets/communes-et-villes-de-france-en-csv-excel-json-parquet-et-feather
- INSEE incomes by municipality :
     
     https://www.data.gouv.fr/datasets/revenu-des-francais-a-la-commune

### 4.DBT architecture
- **staging** : 
  - insee : raw sources cleaned and standardized
- **marts** :
  - geography : population, growth
  - income : income metrics and aggregations

 ### 5.Data model
 **Dimensions**
 - `dim_municipalities`
 - `dim_departments`
 - `dim_regions`

 **Facts**
 - `fct_population_municipality` (grain: municipality_id + year)
 - `fct_income_municipality` (grain: municipality_id + year)

 **Derived models**
 - Population by department and region
 - Population growth by municipality, department and region
 - Estimated income by department and region (population-weighted)

 ### 6.Assumptions / limitations
 - Department and region income are estimates based on population-weighted municipal median income
 - Population and income snapshots are not aligned temporally
 - Aggregations use latest available data per source

 ### 7.Data quality
 - not_null on primary keys and measures
 - relationships between facts and dimensions
 - uniqueness of defined grains

 ### 8.Execution
```
dbt run 
dbt test
dbt build # run + test
```