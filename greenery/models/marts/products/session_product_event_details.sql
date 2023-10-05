{% set event_types = dbt_utils.get_column_values(table=ref('stg_web_events'), column='web_event_type') %}

select
    session_uuid,
    events.user_uuid,
    {% for event_type in event_types %}
        {{ sum_of('web_event_type', event_type) }} as {{ event_type }}s,
    {% endfor %}
    coalesce(events.product_uuid, order_items.product_uuid) as product_uuid
    from {{ ref('stg_web_events') }} events
    inner join {{ ref('stg_order_items') }} order_items
        on order_items.order_uuid = events.order_uuid
    group by all
