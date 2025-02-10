select 	
	count(oh.order_id),
	sum(oh.grand_total) as total_revenue
from order_header oh
join order_shipment os on os.order_id=oh.order_id
join shipment s on s.shipment_id=os.shipment_id
	where shipment_method_type_id="STOREPICKUP"
	and oh.order_date between '2024-01-01' and '2024-12-31';

