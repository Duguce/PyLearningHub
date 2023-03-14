# ------------------------
# 使用子查询
# ------------------------

# ------------------------
# 利用子查询进行过滤
# ------------------------
select cust_name, cust_contact
from Customers
where cust_id in (
    select cust_id
    from Orders
    where order_num in (
        select distinct order_num
        from OrderItems
        where prod_id = 'RGAN01'));

# ------------------------
# 作为计算字段使用子查询
# ------------------------
select cust_name,
       cust_state,
       (select count(*)
        from Orders
        where Orders.cust_id = Customers.cust_id) as orders
from Customers
order by cust_name;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select cust_id
from Orders
where order_num in (
    select order_num
    from OrderItems
    where item_price >= 10);
# 第二题
select cust_id, order_date
from Orders
where order_num in (
    select order_num
    from OrderItems
    where prod_id = 'BR01')
order by order_date;
# 第三题
select cust_email
from Customers
where cust_id in (
    select cust_id
    from Orders
    where order_num in (
        select order_num
        from OrderItems
        where prod_id = 'BR01'));
# 第四题
select cust_id,
       (select sum(quantity)
        from OrderItems
        where OrderItems.order_num = Orders.order_num) as total_ordered
from Orders
order by total_ordered desc;
# 第五题
select prod_name,
       (select sum(quantity)
        from OrderItems
        where OrderItems.prod_id = Products.prod_id) as quant_sold
from Products