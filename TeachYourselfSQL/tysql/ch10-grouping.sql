# ------------------------
# 分组数据
# ------------------------

# ------------------------
# 创建分组
# ------------------------
select vend_id, count(*) as num_prods
from Products
group by vend_id;

# ------------------------
# 过滤分组
# ------------------------
select cust_id, count(*) as orders
from Orders
group by cust_id
having count(*) >= 2;

select vend_id, count(*) as num_prods
from Products
where prod_price >= 4
group by vend_id
having count(*) >= 2;

select vend_id, count(*) as num_prods
from Products
group by vend_id
having count(*) >= 2;

# ------------------------
# 分组和排序
# ------------------------
select order_num, count(*) as items
from OrderItems
group by order_num
having count(*) >= 3
order by items, order_num;


# ------------------------
# 挑战题
# ------------------------
# 第一题
select order_num, count(order_num) as order_lines
from OrderItems
group by order_num
order by order_lines;
# 第二题
select min(prod_price) as cheapest_item
from Products
group by vend_id
order by cheapest_item;
# 第三题
select order_num
from OrderItems
group by order_num
having sum(quantity) >= 100;
# 第四题
select order_num
from OrderItems
group by order_num
having sum(item_price * quantity) >= 1000
order by order_num