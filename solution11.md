Question:

The merchandising team needs to know how many orders were cancelled in the previous month and their reasons.

Fields to retrieve:

--> TOTAL ORDERS

--> CANCELATION REASON

Solution:

```
SELECT
    COUNT(os.order_id) AS total_orders,
    os.change_reason AS cancellation_reason
FROM order_status os
WHERE os.status_id = 'ORDER_CANCELLED'
  AND DATE_FORMAT(os.status_datetime, '%Y-%m') = DATE_FORMAT(CURRENT_DATE - INTERVAL 1 MONTH, '%Y-%m')
GROUP BY os.change_reason
ORDER BY total_orders DESC;

```

Reasoning:

We were required to know the order cancelled in the previous month and their reasons, so we retrieved all those orders whose status is order_cancelled and were cancelled in the duration of the previous month.

```
Query Cost: 6699
```
