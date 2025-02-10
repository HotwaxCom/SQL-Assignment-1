select 
	oh.order_id,
	oh.grand_total as total_amount,
	opp.payment_method_type_id as payment_method,
	sso.shopify_order_id
from order_header oh
join order_payment_preference opp on opp.order_id=oh.order_id
left join shopify_shop_order sso on sso.order_id=oh.order_id where oh.status_id="ORDER_CREATED";

/*Firstly, as asked the told fields have been retrieved accordingly, then since I used left join to join order_payment
 * _preference_table and used order_id to join them, also I used the table shopify shop order to get the shopify order Id,
 * I used left join because there existed order which has no shopify order Id*/
