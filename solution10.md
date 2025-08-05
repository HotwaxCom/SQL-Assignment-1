Question:

BOPIS (Buy Online, Pickup In Store) is a key retail strategy. Finance wants to know the revenue from BOPIS orders for the previous year.

Fields to retrieve:

-->TOTAL ORDERS

--> TOTAL REVENUE

Solution:

```
select 	
	count(oh.order_id),
	sum(oh.grand_total) as total_revenue
from order_header oh
join order_shipment os on os.order_id=oh.order_id
join shipment s on s.shipment_id=os.shipment_id and s.shipment_method_type_id = "STOREPICKUP"
	where oh.sales_channel_enum_id = 'WEB_SALES_CHANNEL' or oh.sales_channel_enum_id = 'CSR_SALES_CHANNEL'
	and oh.order_date between '2024-01-01' and '2024-12-31';
```
Reasoning: 

A BOPIS order means that we buy online and pick it up from store, so we were required to ensure that the shipment_method_type should be "STORE_PICKUP" nad the sales channel used can be either "WEB_SALES_CHANNEL" or "CSR_SALES_CHANNEL"

```
Query Cost: 41,916.84
```
