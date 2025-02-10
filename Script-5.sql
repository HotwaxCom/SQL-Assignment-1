select
    oi.product_id,
    p.product_type_id,
    ohe.product_store_id,
    oi.quantity as total_quantity,
    p.internal_name,
    p.facility_id,
    oi.external_id,
    f.facility_type_id,
    oh.order_history_id,
    oh.order_id,
    oh.order_item_seq_id,
    oh.ship_group_seq_id
from order_header ohe
join order_history oh on oh.order_id = ohe.order_id
join order_item oi on oi.order_id = oh.order_id and oi.order_item_seq_id = oh.order_item_seq_id 
join product p on p.product_id = oi.product_id
left join facility f on f.facility_id = p.facility_id
where
    ohe.status_id = 'ORDER_COMPLETED' 
    and ohe.created_stamp between '2023-08-01' and '2023-08-31 23:59:59';



/* Firstly, I retrieved all the fields that we were asked to then I started off with 	
with joining tables as and when required ie. first joined order history table with taking order id and 
then joined order item table on order id and order item seq id then joined product table with taking product id and then 
applied left join on the facility table because there can exist a table which is not yet assigned to any facility and then
lastly added the conditions that is status id should be completed and the order should be completed in aug 2023 and for this
I applied the date filter of between */
	
	