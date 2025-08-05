Question:

To sync an order or product across multiple systems (e.g., Shopify, HotWax, ERP/NetSuite), the OMS needs to know each system’s unique identifier for that product. This query retrieves the Shopify ID, HotWax ID, and ERP ID (NetSuite ID) for all products.

Fields to retrieve:

--> PRODUCT_ID (internal OMS ID)

--> SHOPIFY_ID

--> HOTWAX_ID

--> ERP_ID or NETSUITE_ID (depending on naming)

Solution:

```
select 
	gi.product_id,
	max(CASE WHEN gi.good_identification_type_id = 'SHOPIFY_PROD_ID' THEN gi.id_value END) AS SHOPIFY_ID,
	max(case when gi.good_identification_type_id = 'SKU' then gi.id_value end) as HOTWAX_ID,
	max(case when gi.good_identification_type_id = 'ERP_ID' then gi.id_value end) as NETSUITE_ID
from good_identification gi group by gi.product_id;
```
Reasoning:

since all the field values were available in the good_identification table, so took the values directly from there. Query has been written in such a way as i wanted to filter id's from the same coloumn.

```
Query Cost: 272,017.77
```
