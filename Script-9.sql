Select 
    hour(created_stamp) AS order_hour,
    count(order_id) AS orders_completed
from order_header
where status_id = 'ORDER_COMPLETED'
group by order_hour
order by order_hour;


