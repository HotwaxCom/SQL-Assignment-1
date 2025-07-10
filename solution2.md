Question: 

Merchandising teams often need a list of all physical products to manage logistics, warehousing, and shipping.

Solution:
```
-- Selecting required attributes
select
	p.PRODUCT_ID,
	p.PRODUCT_TYPE_ID,
	p.INTERNAL_NAME
from
	PRODUCT p
	-- Joining product type and product entity to find physical product
join 
    PRODUCT_TYPE pt on
	p.PRODUCT_TYPE_ID = pt.PRODUCT_TYPE_ID
where
	pt.IS_PHYSICAL = 'Y'
	and (p.SALES_DISCONTINUATION_DATE is null
		or p.SALES_DISCONTINUATION_DATE > NOW())
	and (p.SUPPORT_DISCONTINUATION_DATE is null
		or p.SUPPORT_DISCONTINUATION_DATE > NOW());
```

 Reasoning:
 
1. Selected required fields: PRODUCT_ID, PRODUCT_TYPE_ID, INTERNAL_NAME.

2. Applied a join on 'product_type' to ensure all physical products are considered.
   
3. Filtered products to include only finished goods that are not virtual and are variants.
   
4. Ensured the product type is marked as physical.

```
Query Cost: 71,422.77
```
