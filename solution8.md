Question:

Finance teams want to ensure revenue is recognized properly. If payment is captured but no shipment has occurred, it warrants further review.

Fields to retrieve:

--> ORDER_ID

--> ORDER_STATUS

--> PAYMENT_STATUS

--> SHIPMENT_STATUS

Solution:

```
select 
	oh.order_id,
	oh.status_id as order_status,
	opp.status_id as payment_status,
	s.status_id as shipment_status
from order_header oh
join order_payment_preference opp on opp.order_id=oh.order_id and opp.status_id != 'PAYMENT_RECEIVED'
left join order_shipment os on os.order_id=oh.order_id
left join shipment s on s.shipment_id=os.shipment_id and s.status_id != 'SHIPMENT_SHIPPED'
where oh.STATUS_ID != 'ORDER_COMPLETED';
```
Reasoning:

1.We are asked to find those orders for which a payment is captured but no shipment has occured.

2.We got the order_id, status_id from the order header table. To get whether the payment the status should be payment_received and also we want that no shipment has occured so for this shipment status should not be shipment shipped.

```
Query Cost: 36040.14
```

