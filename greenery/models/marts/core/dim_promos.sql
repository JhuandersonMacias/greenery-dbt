with promos as ( 
    select * from {{ ref('stg_promos') }}
)

select *
from promos
