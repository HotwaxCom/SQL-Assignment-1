Question:

The merchandising team needs to know how many orders were cancelled in the previous month and their reasons.

Fields to retrieve:

--> TOTAL ORDERS
--> CANCELATION REASON

Solution:

```
select
    count(os.order_id) as total_orders,
    os.change_reason as cancellation_reason
from order_status os
where os.status_id = 'ORDER_CANCELLED'
  and year(os.status_datetime) = year(current_date - interval 1 month)
and month(os.status_datetime ) = month(current_date - interval 1 month)
group by os.change_reason
order by total_orders desc;

```

Reasoning:

We were required to know the order cancelled in the previous month and their reasons, so we retrieved all those orders whose status is order_cancelled and were cancelled in the duration of the previous month.

```
Query Cost: 6699
```
