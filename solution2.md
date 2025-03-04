Question: 

Merchandising teams often need a list of all physical products to manage logistics, warehousing, and shipping.

Solution:
```
SELECT 
    p.product_id,
    p.product_type_id,
    p.internal_name
FROM product p 
JOIN product_type pt ON pt.product_type_id = p.product_type_id
WHERE p.product_type_id = "FINISHED_GOOD" 
AND p.is_virtual = "N" 
AND p.is_variant = "Y" 
AND pt.is_physical = "Y";
```

 Reasoning:
 
1. Selected required fields: PRODUCT_ID, PRODUCT_TYPE_ID, INTERNAL_NAME.

2. Applied a join on 'product_type' to ensure all physical products are considered.
   
3. Filtered products to include only finished goods that are not virtual and are variants.
   
4. Ensured the product type is marked as physical.

```
Query Cost: 71,422.77
```
