with events as (
    select * FROM {{ ref('stg_web_events') }}
)

, final as ( 
    select 
        user_uuid,
        session_uuid,
        count(distinct session_uuid) as total_web_events,
        sum(case when web_event_type = 'add_to_cart' then 1 else 0 end) as add_to_cart,
        Sum(case when web_event_type = 'checkout' then 1 else 0 end) as checkout,
        Sum(case when web_event_type = 'package_shipped' then 1 else 0 end) as package_shipped,
        Sum(case when web_event_type = 'page_views' then 1 else 0 end) as page_views,
        min(web_event_created_at_utc) as first_session_event_at_utc,
        max(web_event_created_at_utc) as last_session_event_at_utc
        from events 
        group by 1,2
)

select * from final