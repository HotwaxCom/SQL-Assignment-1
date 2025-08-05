Question:

After running similar reports for a previous month, you now need all completed orders in August 2023 for analysis.

Fields to retrieve:

PRODUCT_ID, PRODUCT_TYPE_ID, PRODUCT_STORE_ID, TOTAL_QUANTITY, INTERNAL_NAME, FACILITY_ID, EXTERNAL_ID, FACILITY_TYPE_ID, ORDER_HISTORY_ID, ORDER_ID, ORDER_ITEM_SEQ_ID, SHIP_GROUP_SEQ_ID

Solution:

```
select
    oi.product_id,
    p.product_type_id,
    oh.product_store_id,
    oi.quantity as total_quantity,
    p.internal_name,
    f.facility_id,
    oi.external_id,
    f.facility_type_id,
    oh1.order_history_id,
    oh1.order_id,
    oh1.order_item_seq_id,
    oh1.ship_group_seq_id
from order_header oh
join order_status os
	on os.order_id = oh.order_id and os.status_id = 'ORDER_COMPLETED'
join order_history oh1 on oh1.order_id = oh.order_id 
join order_item oi on oi.order_id = oh1.order_id and oi.order_item_seq_id = oh1.order_item_seq_id 
join order_item_ship_group oisg on oisg.order_id = oh.order_id 
join product p on p.product_id = oi.product_id
join facility f on f.facility_id = oisg.facility_id
	where os.status_datetime between '2023-08-01' and '2023-08-31';
```

Reasoning:

Firstly, I retrieved all the fields that we were asked to then I started off with joining tables as and when required that is first applied join with order_status and applied a check such that status of the order is "ORDER_COMPLETED" then with order_history, order item, order item ship group, product table and facility.Lastly, to get completed orders within the date constraint took this date from status_datetime field. 

```
Query Cost: 137430.91
```
