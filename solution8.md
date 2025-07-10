Question:

Finance teams want to ensure revenue is recognized properly. If payment is captured but no shipment has occurred, it warrants further review.

Solution:

```
select 
	oh.order_id,
	oh.status_id as order_status,
	opp.status_id as payment_status,
	s.status_id as shipment_status
from order_header oh
join order_payment_preference opp on opp.order_id=oh.order_id
left join order_shipment os on os.order_id=oh.order_id
left join shipment s on s.shipment_id=os.shipment_id
where opp.STATUS_ID  in ('PAYMENT_SETTLED', 'PAYMENT_AUTHORIZED', 'PAYMENT_RECEIVED')
and s.STATUS_ID != 'SHIPMENT_SHIPPED'
and oh.STATUS_ID != 'ORDER_COMPLETED';
```
Reasoning:

1.We are asked to find those orders for which a payment is captured but no shipment has occured.

2.We got the order_id, status_id from the order header table. To get whether the payment was captured or not for this the status_id can be payment_authorized, payment_settled or payment_received and also we want that no shipment has occured so for this shipment status should not be shipment shipped.

```
Query Cost: 36040.14
```

