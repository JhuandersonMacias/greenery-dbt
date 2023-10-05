## Converstion Rate

select sum(c.checkout)/count(distinct c.session_uuid)
from (
    select 
        session_uuid,
        Sum(case when web_event_type = 'checkout' then 1 else 0 end) as checkout
        from DEV_DB.DBT_JHUANDERSONMACIASGMAILCOM.stg_web_events 
        group by 1
) c

0.624567

## Conversion Rate per product 

```
SELECT product_name, sum(page_views) as pg_view, sum(add_to_cart) as atc, atc/pg_view as conversion_rate 
FROM DEV_DB.DBT_JHUANDERSONMACIASGMAILCOM.session_product_details spd
inner join DEV_DB.DBT_JHUANDERSONMACIASGMAILCOM.dim_products p
 on p.product_uuid = spd.product_uuid
group by product_name
```

| PRODUCT_NAME        | PG_VIEW | ATC | CONVERSION_RATE |   |
|---------------------|---------|-----|-----------------|---|
| String of pearls    | 65      | 44  | 0.676923        |   |
| Arrow Head          | 64      | 39  | 0.609375        |   |
| Pilea Peperomioides | 60      | 32  | 0.533333        |   |
| Rubber Plant        | 56      | 32  | 0.571429        |   |
| Jade Plant          | 46      | 24  | 0.521739        |   |
| Cactus              | 55      | 32  | 0.581818        |   |
| Money Tree          | 56      | 26  | 0.464286        |   |
| Bird of Paradise    | 60      | 33  | 0.55            |   |
| Birds Nest Fern     | 80      | 40  | 0.5             |   |
| Pink Anthurium      | 74      | 37  | 0.5             |   |
| Boston Fern         | 63      | 34  | 0.539683        |   |
| Calathea Makoyana   | 53      | 32  | 0.603774        |   |
| Fiddle Leaf Fig     | 59      | 30  | 0.508475        |   |
| ZZ Plant            | 65      | 35  | 0.538462        |   |
| Peace Lily          | 67      | 35  | 0.522388        |   |
| Majesty Palm        | 69      | 38  | 0.550725        |   |
| Ponytail Palm       | 71      | 30  | 0.422535        |   |
| Pothos              | 64      | 24  | 0.375           |   |
| Bamboo              | 69      | 42  | 0.608696        |   |
| Spider Plant        | 59      | 30  | 0.508475        |   |
| Alocasia Polly      | 54      | 27  | 0.5             |   |
| Ficus               | 68      | 35  | 0.514706        |   |
| Dragon Tree         | 62      | 34  | 0.548387        |   |
| Aloe Vera           | 65      | 36  | 0.553846        |   |
| Snake Plant         | 73      | 34  | 0.465753        |   |
| Philodendron        | 63      | 32  | 0.507937        |   |
| Devil's Ivy         | 45      | 24  | 0.533333        |   |
| Orchid              | 75      | 37  | 0.493333        |   |
| Angel Wings Begonia | 62      | 32  | 0.516129        |   |
| Monstera            | 49      | 26  | 0.530612        |   |


# snapshot results
| NAME             | INVENTORY | Delta |
|------------------|-----------|------------|
| Pothos           | 0         | 20        |
| Philodendron     | 15        | 10        |
| Bamboo           | 44        | 12        |
| ZZ Plant         | 53        | 36        |
| Monstera         | 50        | 14        |
| String of pearls | 0         | 10        |