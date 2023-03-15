# ------------------------
# 使用视图
# ------------------------

# ------------------------
# 创建视图
# ------------------------
# 利用视图简化复杂的联结
create view ProductCustomers as
select cust_name, cust_contact, prod_id
from Customers,
     Orders,
     OrderItems
where Customers.cust_id = Orders.cust_id
  and OrderItems.order_num = Orders.order_num;

# 检索订购了产品RGAN01的客户
select cust_name, cust_contact
from ProductCustomers
where prod_id = 'RGAN01';

# 用视图重新格式化检索出的数据
select concat(vend_name, ' (', rtrim(vend_country), ')')
           as vend_title
from Vendors
order by vend_name;

create view VendorLocations as
select concat(vend_name, ' (', rtrim(vend_country), ')')
           as vend_title
from Vendors;

select *
from VendorLocations;

# 用视图过滤不想要的数据
create view CustomerEmailList as
select cust_id, cust_name, cust_email
from Customers
where cust_email is not null;

select *
from CustomerEmailList;

# 使用视图与计算字段
select prod_id,
       quantity,
       item_price,
       quantity * item_price as expanded_price
from OrderItems
where order_num = 20008;

create view OrderItemsExpanded as
select order_num,
       prod_id,
       quantity,
       item_price,
       quantity * item_price as expanded_price
from OrderItems;

select *
from OrderItemsExpanded
where order_num = 20008;


# ------------------------
# 挑战题
# ------------------------
# 第一题
create view CustomersWithOrders as
select Customers.cust_id,
       cust_name,
       cust_address,
       cust_city,
       cust_state,
       cust_zip,
       cust_country,
       cust_contact,
       cust_email
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id;