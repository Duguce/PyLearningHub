# ------------------------
# 更新和删除数据
# ------------------------

# ------------------------
# 更新数据
# ------------------------
update Customers
set cust_email='kim@thetoystore.com'
where cust_id = 1000000005;

update Customers
set cust_email=null
where cust_id = 1000000005;

# ------------------------
# 删除数据
# ------------------------
delete
from Customers
where cust_id = 1000000006;


# ------------------------
# 挑战题
# ------------------------
# 第一题
update Vendors
set vend_state=upper(vend_state)
where vend_country = 'USA';

update Customers
set cust_state=upper(cust_state)
where cust_country = 'USA';

# 第二题
select *
from Customers
where cust_id = 1000000017;

delete
from Customers
where cust_id = 1000000017;

