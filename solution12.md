Question:

The retailer has set a threshold value for products that are sold online, in order to avoid over selling.

Solution:

```
select 
	pf.product_id,
	pf.facility_id,
	pf.minimum_stock
from product_facility pf 
join facility f on f.facility_id=pf.facility_id
	where f.FACILITY_TYPE_ID="CONFIGURATION"
	and pf.minimum_stock is not null
	group by pf.product_id,pf.facility_id,pf.minimum_stock;
```
Reasoning:

```
Query Cost: 35,757.19
```





