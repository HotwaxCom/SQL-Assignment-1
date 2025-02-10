select 
	p.product_id,
	p.internal_name,
	p.product_type_id,
	gi.good_identification_type_id as netsuite_id
from product p
join good_identification gi on gi.product_id=p.product_id 
where gi.good_identification_type_id="ERP_ID" and gi.id_value is null;


select * from good_identification_type;
describe good_identification;

/* Firstly we retrieve product_id,internal_name,product_type_id and Good 
 * Identification Type Id, in this given case it is ERP_ID. Then, we applied join on 
 * the table to get field good identifcation type id and take also null values as those ids
 * are also required to be updated on netsuite id.*/
	
