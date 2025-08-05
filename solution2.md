Question: 

Merchandising teams often need a list of all physical products to manage logistics, warehousing, and shipping.

Fields to retrieve:

--> PRODUCT_ID

--> PRODUCT_TYPE_ID

--> INTERNAL_NAME

Solution:
```
select
	p.PRODUCT_ID,
	p.PRODUCT_TYPE_ID,
	p.INTERNAL_NAME
from
	PRODUCT p
where
	p.IS_VARIANT = 'Y' and p.IS_VIRTUAL = 'N'
	and (p.SALES_DISCONTINUATION_DATE is null
		or p.SALES_DISCONTINUATION_DATE > NOW())
	and (p.SUPPORT_DISCONTINUATION_DATE is null
		or p.SUPPORT_DISCONTINUATION_DATE > NOW());
```

 Reasoning:
 
1. Selected required fields: PRODUCT_ID, PRODUCT_TYPE_ID, INTERNAL_NAME.

2. To get all the physical products we check that is_variant='Y' and is_virtual='N' to ensure that only physical products are considered.
   
3. Applied sales discontinuation date and support discontinuation date check so that we only get active products.
   
4. Ensured the product type is marked as physical.

```
Query Cost: 95,620.36
```
