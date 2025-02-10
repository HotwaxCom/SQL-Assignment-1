select
	count(os.order_id),
	os.change_reason as cancellation_reason
from order_status os 
	where os.status_id="ORDER_CANCELLED" 
	and os.status_datetime between '2025-01-01' and '2025-01-31' order by status_datetime;