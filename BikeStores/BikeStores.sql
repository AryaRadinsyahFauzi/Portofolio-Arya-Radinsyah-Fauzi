USE BikeStores

-- Selecting and combining multiple columns into one table
SELECT
	sord.order_id,
	CONCAT (scus.first_name,' ',scus.last_name) AS 'customer',
	scus.city,
	scus.state,
	sord.order_date,
	SUM (soit.quantity) AS 'total_units',
	SUM (soit.quantity * soit.list_price) AS 'total_revenue',
	prod.product_name,
	pcat.category_name,
	pbra.brand_name,
	stor.store_name,
	CONCAT (staf.first_name,' ',staf.last_name) AS 'sales_rep'
FROM
		sales.orders sord
JOIN	sales.customers scus
ON		scus.customer_id = sord.customer_id 
JOIN	sales.order_items soit
ON		soit.order_id = sord.order_id 
JOIN	production.products prod
ON		prod.product_id = soit.product_id
JOIN	production.categories pcat
ON		pcat.category_id = prod.category_id 
JOIN	production.brands pbra
ON		pbra.brand_id = prod.brand_id
JOIN	sales.stores stor
ON		stor.store_id = sord.store_id
JOIN	sales.staffs staf
ON		staf.staff_id = sord.staff_id
GROUP BY
	sord.order_id,
	CONCAT (scus.first_name,' ',scus.last_name),
	scus.city,
	scus.state,
	sord.order_date,
	prod.product_name,
	pcat.category_name,
	pbra.brand_name,
	stor.store_name,
	CONCAT (staf.first_name,' ',staf.last_name);