with users as ( 
    select * from {{ ref('stg_users') }}
)
, 

orders as (
    select * 
    from {{ref('stg_orders')}}
)
,

order_items as (
    select * 
    from {{ref('stg_order_items')}}
)

select  
    user_uuid,
    orders. order_uuid,
    order_user_uuid,
    address_uuid,
    promo_name,
    order_status,
    shipping_service,
    order_tracking_uuid,
    order_cost,
    shipping_cost,
    order_total,
    product_uuid,
    quantity,
    estimated_delivery_at,
    delivered_at,
    order_created_at
from users 
join orders on users.user_uuid = orders.order_user_uuid
join order_items on orders.order_uuid = order_items.order_uuid
