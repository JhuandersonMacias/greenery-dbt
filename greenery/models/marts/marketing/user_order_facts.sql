{{
  config(
    materialized='table'
  )
}}

with users as ( 
    select * from {{ ref('dim_users') }}
)
, 
orders as (
    select * 
    from {{ref('stg_orders')}}
)
,
promos as (
    select * 
    from {{ref('dim_promos')}}
)

select  
    users.user_uuid,
    orders.order_uuid,
    order_user_uuid,
    users.address,
    users.country,
    users.state,
    users.zipcode,
    promos.promo_name,
    promos.discount_amount,
    promos.promo_status,
    order_status,
    shipping_service,
    order_tracking_uuid,
    order_cost,
    shipping_cost,
    order_total,
    estimated_delivery_at,
    delivered_at,
    order_created_at
from orders 
join users on users.user_uuid = orders.order_user_uuid
join promos on promos.promo_name = orders.promo_name
