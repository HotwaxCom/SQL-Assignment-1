select 
	gi.product_id,
	max(CASE WHEN gi.good_identification_type_id = 'SHOPIFY_PROD_ID' THEN gi.id_value END) AS SHOPIFY_ID,
	max(case when gi.good_identification_type_id = 'SKU' then gi.id_value end) as HOTWAX_ID,
	max(case when gi.good_identification_type_id = 'ERP_ID' then gi.id_value end) as NETSUITE_ID
from good_identification gi group by gi.product_id;

/*since all the field values were available in the good_identification table, so took the values
 * directly from there. Query has been written in such a way as i wanted to filter id's from the same coloumn*/

