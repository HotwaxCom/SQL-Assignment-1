Question:

Operations teams may want to see how orders complete across the day to schedule staffing.

Solution:

```
Select 
    hour(os.status_datetime) AS order_hour,
    count(oh.order_id) AS orders_completed
from order_header oh
join order_status os on os.order_id = oh.order_id
where os.status_id = 'ORDER_COMPLETED'
group by order_hour
order by order_hour;
```
Reasoning:

1. Here, we wanted to at each hour how many orders get completed, so for thiswe take the status_datetime from the order_status table and order_id from the order_header.

2. Also, since we wanted to find out the count of orders completed at each hour so we found the count and its respective hours.

```
Query Cost: 36091
```
