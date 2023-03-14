# ------------------------
# 创建高级联结
# ------------------------

# ------------------------
# 使用表别名
# ------------------------
select cust_name, cust_contact
from Customers as C,
     Orders as O,
     OrderItems as OI
where C.cust_id = O.cust_id
  and OI.order_num = O.order_num
  and prod_id = 'RGAN01';

# ------------------------
# 使用不同类型的联结
# ------------------------
# 自联结
select cust_id, cust_name, cust_contact
from Customers
where cust_name = (select cust_name
                   from Customers
                   where cust_contact = 'John Smith');

select c1.cust_id, c1.cust_name, c1.cust_contact
from Customers c1,
     Customers c2
where c1.cust_name = c2.cust_name
  and c2.cust_contact = 'John Smith';
# 自然联结
select C.*,
       O.order_num,
       O.order_date,
       OI.prod_id,
       OI.quantity,
       OI.item_price
from Customers C,
     Orders O,
     OrderItems OI
where C.cust_id = O.cust_id
  and OI.order_num = O.order_num
  and prod_id = 'RGAN01';
# 外联结
select Customers.cust_id, Orders.order_num
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id;

select Customers.cust_id, Orders.order_num
from Customers
         right join Orders on Customers.cust_id = Orders.cust_id;

# ------------------------
# 使用带聚集函数的联结
# ------------------------
select Customers.cust_id,
       count(Orders.order_num) as num_ord
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
group by Customers.cust_id;

select Customers.cust_id,
       count(Orders.order_num) as num_ord
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id
group by Customers.cust_id;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select Customers.cust_name, Orders.order_num
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id;
# 第二题
select Customers.cust_name, Orders.order_num
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id;
# 第三题
select Products.prod_name, OrderItems.order_num
from Products
         inner join OrderItems on Products.prod_id = OrderItems.prod_id;
# 第四题
select Products.prod_name, count(OrderItems.order_num) as num_ord
from Products
         inner join OrderItems on Products.prod_id = OrderItems.prod_id
group by Products.prod_name;
# 第五题
select Vendors.vend_id, count(Products.prod_id)
from Vendors
         inner join Products on Vendors.vend_id = Products.vend_id
group by Vendors.vend_id;