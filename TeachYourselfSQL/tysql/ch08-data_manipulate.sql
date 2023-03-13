# ------------------------
# 使用函数处理数据
# ------------------------

# ------------------------
# 文本处理函数
# ------------------------
# upper()
select vend_name, upper(vend_name) as vend_name_upcase
from Vendors
order by vend_name;
# soundex() 类似的发音字符和音节
select cust_name, cust_contact
from Customers
where cust_contact = 'Michael Green';

select cust_name, cust_contact
from Customers
where soundex(cust_contact) = soundex('Michael Green');


# ------------------------
# 挑战题
# ------------------------
# 第一题
select cust_id, cust_name, concat(left(cust_contact, 2), left(cust_city, 3)) as user_login
from Customers;
# 第二题
select order_num, order_date
from Orders
where year(order_date) = 2012
  and month(order_date) = 1
order by order_date;