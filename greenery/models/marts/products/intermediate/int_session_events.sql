with events as (
    select * FROM {{ ref('stg_web_events') }}
)

{% set event_types = [
    'page_view',
    'add_to_cart',
    'checkout',
    'packaged_shipped'
]%}

, final as ( 
    select
        session_uuid,
        {% for event_type in event_types %}
            {{sum_of('events.web_event_type', event_type)}} as {{event_type}}s,
        {% endfor %}
        user_uuid
        from events
        group by all
)

select * from final