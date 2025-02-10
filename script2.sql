select 
	p.product_id,
	p.product_type_id,
	p.internal_name
from product p 
join product_type pt on pt.product_type_id=p.product_type_id
where p.product_type_id="FINISHED_GOOD" and is_virtual="N" and p.is_variant="Y" and pt.is_physical="Y";

/* firstly every field that we were asked to retrieve have been taken initially and then
 * a join is applied to product_type to take in account all the physical products*/




