# ------------------------
# 联结表
# ------------------------

# ------------------------
# 创建联结
# ------------------------
# 等值联结
select vend_name, prod_name, prod_price
from Vendors,
     Products
where Vendors.vend_id = Products.vend_id;
# 内联结
select vend_name, prod_name, prod_price
from Vendors
         inner join Products on Vendors.vend_id = Products.vend_id;
# 联结多个表
select prod_name, vend_name, prod_price, quantity
from OrderItems,
     Products,
     Vendors
where Products.vend_id = Vendors.vend_id
  and OrderItems.prod_id = Products.prod_id
  and order_num = 20007;

select cust_name, cust_contact
from Customers,
     Orders,
     OrderItems
where Customers.cust_id = Orders.cust_id
  and OrderItems.order_num = Orders.order_num
  and prod_id = 'RGAN01';


# ------------------------
# 挑战题
# ------------------------
# 第一题
select cust_name, order_num
from Customers,
     Orders
where Customers.cust_id = Orders.cust_id
order by cust_name, order_num;

select cust_name, order_num
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
order by cust_name, order_num;
# 第二题
select cust_name,
       order_num,
       (select sum(quantity * item_price)
        from OrderItems
        where OrderItems.order_num = Orders.order_num) as order_total
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id;
# 第三题
select cust_id, order_date
from OrderItems,
     Orders
where OrderItems.order_num = Orders.order_num
  and prod_id = 'BR01'
order by cust_id, order_date;

select cust_id, order_date
from Orders
         inner join OrderItems on Orders.order_num = OrderItems.order_num
where prod_id = 'BR01'
order by cust_id, order_date;
# 第四题
select cust_email
from Orders
         inner join Customers on Orders.cust_id = Customers.cust_id
         inner join OrderItems on OrderItems.order_num = Orders.order_num
where prod_id = 'BR01';
# 第五题
select cust_name,
       sum(quantity * item_price) as total_price
from Orders
         inner join Customers on Customers.cust_id = Orders.cust_id
         inner join OrderItems on OrderItems.order_num = Orders.order_num
group by cust_name
having total_price >= 1000
order by cust_name;

select cust_name,
       sum(quantity * item_price) as total_price
from Orders,
     Customers,
     OrderItems
where Customers.cust_id = Orders.cust_id
  and OrderItems.order_num = Orders.order_num
group by cust_name
having total_price >= 1000
order by cust_name;