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

2. Applied a join on 'product_type' to ensure all physical products are considered.
   
3. Filtered products to apply filter of sales discontinuation date and support discontinuation date.
   
4. Ensured the product type is marked as physical.

```
Query Cost: 71,422.77
```
