Question:

A product cannot sync to NetSuite unless it has a valid NetSuite ID. The OMS needs a list of all products that still need to be created or updated in NetSuite.

Fields to retrieve:

--> PRODUCT_ID

--> INTERNAL_NAME

--> PRODUCT_TYPE_ID

--> NETSUITE_ID (or similar field indicating the NetSuite ID; may be NULL or empty if missing)

Solution:

```
select 
	p.product_id,
	p.internal_name,
	p.product_type_id,
	gi.good_identification_type_id as netsuite_id
from product p
join good_identification gi on gi.product_id=p.product_id 
where gi.good_identification_type_id="ERP_ID" and gi.id_value is null;
```

Reasoning:

1. Firstly we retrieve product_id,internal_name,product_type_id and Good Identification Type Id as asked in the select statement.

2. In this given case it is ERP_ID, then we applied join on the table to get field good identifcation type id and take also null values as those ids are also required to be updated on netsuite id.

```
Query Cost: 2.19
```
