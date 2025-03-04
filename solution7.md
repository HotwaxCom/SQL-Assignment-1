Question:

 Finance teams need to see new orders and their payment methods for reconciliation and fraud checks.

Solution:

```
select 
	oh.order_id,
	oh.grand_total as total_amount,
	opp.payment_method_type_id as payment_method,
	sso.shopify_order_id
from order_header oh
join order_payment_preference opp on opp.order_id=oh.order_id
left join shopify_shop_order sso on sso.order_id=oh.order_id where oh.status_id="ORDER_CREATED";
```
Reasoning:

For finding the payment method we used the order payment preference table. Since, we were asked to get the shopify_id we also used the shopify_shop_order.
Also we were asked for new order so in this case we took the status_id= "ORDER_CREATED"

```
Query Cost: 7216.55
```


