# ------------------------
# 使用游标
# ------------------------
# 创建游标
declare CustCursor cursor
for
select *
from Customers
where cust_email is null;

# 使用游标
open cursor CustCursor

# 关闭游标
close CustCursor