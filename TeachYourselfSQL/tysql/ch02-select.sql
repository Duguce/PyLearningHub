# ------------------------
# SELECT语句
# ------------------------

# ------------------------
# 检索列
# ------------------------
# 检索单个列
SELECT prod_name
from Products;

# 检索多个列
SELECT prod_id, prod_name, prod_price
from Products;

# 检索所有列
SELECT *
from Products;

# ------------------------
# 检索不同的值
# ------------------------
# 检索单列展示所有值
select vend_id
from Products;

# 检索单列仅展示不同值
select distinct vend_id
from Products;

# 检索多列展示所有值
select vend_id, prod_price
from Products;

# 检索多列仅展示不同值
select distinct vend_id, prod_price
from Products;

# ------------------------
# 限制结果
# ------------------------
# 展示5行
select prod_name
from Products
limit 5;
# 展示后续5行
select prod_name
from Products
limit 5 offset 5;
# 展示1-5行(不含第0行)
select prod_name
from Products
limit 1,5;


# ------------------------
# 挑战题
# ------------------------
# 从Customers表中检索所有的 ID（cust_id）
select cust_id
from Customers;

# 从OrderItems表检索并列出已订购产品（prod_id）的清单（只列不同项）
select distinct prod_id
from OrderItems;

# 检索Customers表中所有的列
select *
from Customers;
# 检索顾客的 ID
select cust_id
from Customers;
