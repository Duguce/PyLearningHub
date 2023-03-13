# ------------------------
# 高级数据过滤
# ------------------------

# ------------------------
# 组合WHERE子句
# ------------------------
# and操作符
select prod_id, prod_price, prod_name
from Products
where vend_id = 'DLL01'
  and prod_price <= 4;
# or操作符
select prod_id, prod_price, prod_name
from Products
where vend_id = 'DLL01'
   or vend_id = 'BRS01';
# 求值顺序
select prod_name, prod_price
from Products
where (vend_id = 'DLL01' or vend_id = 'BRS01')
  and prod_price >= 10;

# ------------------------
# IN操作符
# ------------------------
select prod_name, prod_price
from Products
where vend_id in ('DLL01', 'BRS01')
order by prod_name;

# ------------------------
# NOT操作符
# ------------------------
select prod_name
from Products
where not vend_id = 'DLL01'
order by prod_name;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select vend_name
from Vendors
where vend_country = 'USA'
  and vend_state = 'CA';
# 第二题
select order_num, prod_id, quantity
from OrderItems
where prod_id in ('BR01', 'BR02', 'BR03')
  AND quantity >= 100;
# 第三题
select prod_name, prod_price
from Products
where prod_price >= 3
  and prod_price <= 6
order by prod_price desc;