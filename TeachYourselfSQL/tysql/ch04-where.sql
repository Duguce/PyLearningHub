# ------------------------
# 过滤数据
# ------------------------

# ------------------------
# 使用WHERE子句
# ------------------------
# 按指定条件过滤
select prod_name, prod_price
from Products
where prod_price = 3.49;

# ------------------------
# WHERE子句操作符
# ------------------------
# 检查单个值
select prod_name, prod_price
from Products
where prod_price <= 10;
# 不匹配检查
select vend_id, prod_name
from Products
# where vend_id != 'DLL01';
where vend_id <> 'DLL01';
# 范围值检查
select prod_name, prod_price
from Products
where prod_price between 5 and 10;
# 空值检查1
select prod_name
from Products
where prod_price is null;
# 空值检查2
select cust_name
from Customers
where cust_email is null;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select prod_id, prod_name
from Products
where prod_price = 9.49;
# 第二题
select prod_id, prod_name
from Products
where prod_price >= 9;
# 第三题
select distinct order_num
from OrderItems
where quantity >= 100;
# 第四题
select prod_name, prod_price
from Products
where prod_price between 3 and 6;