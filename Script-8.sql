select 
	oh.order_id,
	oh.status_id as order_status,
	opp.status_id as payment_status,
	s.status_id as shipment_status
from order_header oh
join order_payment_preference opp on opp.order_id=oh.order_id
left join order_shipment os on os.order_id=oh.order_id
left join shipment s on s.shipment_id=os.shipment_id
where opp.STATUS_ID = 'PAYMENT_SETTLED'
and s.STATUS_ID != 'SHIPMENT_SHIPPED'
and oh.STATUS_ID != 'ORDER_COMPLETED';
