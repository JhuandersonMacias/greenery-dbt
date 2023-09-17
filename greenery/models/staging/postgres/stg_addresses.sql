{{
  config(
    materialized='view'
  )
}}

with source as (
    select
        *
    from {{ source('postgres', 'addresses') }}
)
--difference between recasting and transoforming col in source
, reaname_recast as ( 
    SELECT 
      address_id AS address_uuid,
      address,
      country,
      state,
      zipcode
    FROM source
)

select * from reaname_recast

