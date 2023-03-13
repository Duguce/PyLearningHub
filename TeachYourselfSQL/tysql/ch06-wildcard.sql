# ------------------------
# 用通配符进行过滤
# ------------------------

# ------------------------
# LIKE操作符
# ------------------------
# 百分号（%）通配符
select prod_id, prod_name
from Products
where prod_name like 'Fish%';
# 多个通配符
select prod_id, prod_name
from Products
where prod_name like '%bean bag%';
# 下划线（_）通配符
select prod_id, prod_name
from Products
where prod_name like '__ inch teddy bear';
# 方括号（[]）通配符
select cust_contact
from Customers
where cust_contact like '[JM]%'
order by cust_contact;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select prod_name, prod_desc
from Products
where prod_desc like '%toy%';
# 第二题
select prod_name, prod_desc
from Products
where not prod_desc like '%toy%'
order by prod_name;
# 第三题
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%'
  AND prod_desc LIKE '%carrots%';
# 第四题
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%carrots%';