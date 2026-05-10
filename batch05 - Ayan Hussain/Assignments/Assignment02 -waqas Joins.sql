-- ============================================================
--  ASSIGNMENT 02 — Joins
--  Database : BikeStores
-- ============================================================


-- ============================================================
--  Question 1
--  Retrieve the product_name, list_price, and category_name
--  for every product.
--  Use production.products and production.categories.
--  Sort the results by product_name ascending.
-- ============================================================

-- Write your query below:
select p.product_name, p.list_price,c.category_name from production.products as p
inner join production.categories as c
on p.category_id=c.category_id
order by product_name asc, list_price asc




-- ============================================================
--  Question 2
--  Show the customer full name (as full_name), order_id,
--  and order_date for all customers who have placed an order.
--  Use sales.customers and sales.orders.
--  Sort by order_date descending.
-- ============================================================

-- Write your query below:
select o.order_id,c.first_name + ' ' +  c.last_name as full_name,o.order_date,o.shipped_date from sales.customers as c
left join sales.orders as o
on c.customer_id=o.customer_id
--order by order_date desc
--where shipped_date is not null
order by order_date desc




-- ============================================================
--  Question 3
--  Retrieve product_name, list_price, category_name, and
--  brand_name for every product.
--  Use production.products, production.categories,
--  and production.brands.
--  Sort by brand_name then product_name (both ascending).
-- ============================================================

-- Write your query below:
select p.product_name,p.list_price,c.category_name,b.brand_name 
from production.products as p
inner join production.categories as c
on p.category_id=c.category_id
inner join production.brands as b
on b.brand_id=p.brand_id
order by brand_name asc ,product_name asc


-- ============================================================
--  Question 4
--  List all products along with their order_id and item_id.
--  Make sure products that have NEVER been ordered also appear
--  in the result (those rows will have NULL for order_id
--  and item_id).
--  Use production.products and sales.order_items.
--  Sort by order_id ascending.
-- ============================================================

-- Write your query below:
select p.product_name,oi.order_id,oi.item_id from production.products as p
left join sales.order_items as oi
on p.product_id=oi.product_id
order by order_id 





-- ============================================================
--  Question 5
--  Using your answer from Question 4 as a base, filter the
--  results to show ONLY the products that have never been
--  ordered.
--  Display only product_id and product_name.
-- ============================================================

-- Write your query below:
select p.product_name,p.product_id from production.products as p
left join sales.order_items as oi
on p.product_id=oi.product_id
where oi.order_id is null



-- ============================================================
--  Question 6
--  Show all stores along with any orders placed at each store.
--  Display store_name, store_id (from stores), order_id,
--  and order_date.
--  Every store must appear in the result, even if it has
--  no orders yet.
--  Use sales.orders and sales.stores.
-- ============================================================

-- Write your query below:
select s.store_name,s.store_id,o.order_id,o.order_date from sales.stores as s
right join sales.orders as o
on s.store_id=o.store_id





-- ============================================================
--  Question 7
--  List every staff member alongside their manager's name.
--  Display:
--    • staff full name   (as staff_name)
--    • manager full name (as manager_name)
--  Use only the sales.staffs table.
--  Staff who have no manager should NOT appear in the result.
-- ============================================================

-- Write your query below:
select e.first_name+''+e.last_name as emp_name,m.first_name+''+m.last_name as maneg_name
from sales.staffs e
inner join sales.staffs as m
on e.staff_id=m.manager_id



-- ============================================================
--  Question 8
--  Generate every possible combination of store name and
--  brand name.cross join every possible combination
--  Display store_name and brand_name.
--  Use sales.stores and production.brands.
--  How many total rows do you expect?
--  Write the expected count as a comment next to your query.
-- ============================================================

-- Write your query below:

select store_name,brand_name from sales.stores
cross join production.brands  --27 rows






-- ============================================================
--  Question 9
--  Retrieve the customer full name (as full_name), order_id,
--  order_date, product_name, and list_price for every order
--  that has been placed.
--  Use sales.customers, sales.orders, sales.order_items,
--  and production.products.
--  Sort by order_date ascending, then full_name ascending.
-- ============================================================

-- Write your query below:
select c.first_name+''+c.last_name as full_name,o.order_id,o.order_date,p.product_name,oi.list_price from sales.customers as c
inner join sales.orders as o
on c.customer_id=o.customer_id
inner join sales.order_items as oi
on o.order_id=oi.order_id
inner join production.products as p
on oi.product_id=p.product_id
order by order_date,full_name
