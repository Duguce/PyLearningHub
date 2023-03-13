# ------------------------
# 创建计算字段
# ------------------------

# ------------------------
# 拼接字段
# ------------------------
# 拼接字段
select concat(vend_name, ' (', vend_country, ')')
from Vendors
order by vend_name;
# 格式化
select concat(rtrim(vend_name), ' (', rtrim(vend_country), ')')
from Vendors
order by vend_name;
# 使用别名
select concat(rtrim(vend_name), ' (', rtrim(vend_country), ')')
           as vend_title
from Vendors
order by vend_name;

# ------------------------
# 执行算术计算
# ------------------------
# 检索订单号 20008
select prod_id, quantity, item_price
from OrderItems
where order_num = 20008;
# 汇总物品的价格
select prod_id, quantity, item_price, quantity * item_price as expanded_price
from OrderItems
where order_num = 20008;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select vend_id, vend_name as vname, vend_address as vaddress, vend_city as vcity
from Vendors
order by vend_name;
# 第二题
select prod_id, prod_price, prod_price * 0.9 as sale_price
from Products;
