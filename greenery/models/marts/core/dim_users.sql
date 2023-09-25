with users as ( 
    select * from {{ ref('stg_users') }}
)
, 

addresses as (
    select * 
    from {{ref('stg_addresses')}}
)

select *
from users 
join addresses on users.user_address_uuid = addresses.address_uuid
