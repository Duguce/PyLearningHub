# ------------------------
# 汇总数据
# ------------------------

# ------------------------
# 聚集函数
# ------------------------
# AVG()函数
select avg(prod_price) as avg_price
from Products;
# COUNT()函数
select count(*) as num_cust
from Customers;

select count(cust_email) as num_cust
from Customers;
# MAX()函数
select max(prod_price) as max_price
from Products;
# MIN()函数
select min(prod_price) as max_price
from Products;
# SUM()函数
select sum(quantity) as items_ordered
from OrderItems
where order_num = 20005;

select sum(quantity * item_price) as total_price
from OrderItems
where order_num = 20005;

# ------------------------
# 聚集不同值
# ------------------------
select avg(distinct prod_price) as avg_price
from Products
where vend_id = 'DLL01';

# ------------------------
# 组合聚集函数
# ------------------------
select count(*)        as num_items,
       min(prod_price) as price_min,
       max(prod_price) as price_max,
       avg(prod_price) as price_avg
from Products;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select count(quantity) as total_quant
from OrderItems;
# 第二题
select count(quantity) as total_BR01
from OrderItems
where prod_id = 'BR01';
# 第三题
select max(prod_price) as max_price
from Products
where prod_price <= 10;