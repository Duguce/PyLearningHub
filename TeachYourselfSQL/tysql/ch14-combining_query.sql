# ------------------------
# 组合查询
# ------------------------

# ------------------------
# 创建组合查询
# ------------------------
# 使用UNION
select cust_name, cust_contact, cust_email
from Customers
where cust_state in ('IL', 'IN', 'MI')
union
select cust_name, cust_contact, cust_email
from Customers
where cust_name = 'Fun4All';
# 包含或取消重复的行
select cust_name, cust_contact, cust_email
from Customers
where cust_state in ('IL', 'IN', 'MI')
union all
select cust_name, cust_contact, cust_email
from Customers
where cust_name = 'Fun4All';
# 对组合查询结果排序
select cust_name, cust_contact, cust_email
from Customers
where cust_state in ('IL', 'IN', 'MI')
union all
select cust_name, cust_contact, cust_email
from Customers
where cust_name = 'Fun4All'
order by cust_name, cust_contact;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select prod_id, quantity
from OrderItems
where quantity = 100
union
select prod_id, quantity
from OrderItems
where prod_id like 'BNBG%'
order by prod_id;
# 第二题
select prod_id, quantity
from OrderItems
where quantity = 100
   or prod_id like 'BNBG%'
order by prod_id;
# 第三题
select prod_name
from Products
union
select cust_name
from Customers
order by prod_name;