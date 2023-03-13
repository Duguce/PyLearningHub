# ------------------------
# 排序检索数据
# ------------------------

# ------------------------
# 按列名排序
# ------------------------
# 正常检索
select prod_name
from Products;
# 按照pro_name排序
select prod_name
from Products
order by prod_name;
# 按照多个列排序
select prod_id, prod_price, prod_name
from Products
order by prod_price, prod_name;

# ------------------------
# 按列位置排序
# ------------------------
select prod_id, prod_price, prod_name
from Products
order by 2, 3;

# ------------------------
# 指定排序方向
# ------------------------
select prod_id, prod_price, prod_name
from Products
order by prod_price desc, prod_name;


# ------------------------
# 挑战题
# ------------------------
# 从Customers中检索所有的顾客名称（cust_names），
# 并按从Z到A的顺序显示结果
select cust_name
from Customers
order by cust_name desc;
# 从Orders表中检索顾客 ID（cust_id）和
# 订单号 （order_num），并先按顾客ID对结果进
# 行排序，再按订单日期倒序排列
select cust_id, order_num
from Orders
order by cust_id, order_date desc;
# 显示OrderItems表中的数量和价格（item_price），
# 并按数量由多到少、价格由高到低排序
select quantity, item_price
from OrderItems
order by quantity desc, item_price desc;