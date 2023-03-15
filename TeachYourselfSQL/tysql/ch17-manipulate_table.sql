# ------------------------
# 更新和删除数据
# ------------------------

# ------------------------
# 创建表
# ------------------------
# 表创建基础
create table Products
(
    prod_id    char(10)      not null,
    vend_id    char(10)      not null,
    prod_name  char(254)     not null,
    prod_price decimal(8, 2) not null,
    prod_desc  varchar(1000) null
);

# 使用NULL值
create table Orders
(
    order_num  integer  not null,
    order_date datetime not null,
    cust_id    char(10) not null
);

# 指定默认值
create table OrderItems
(
    order_num  integer       not null,
    order_item integer       not null,
    prod_id    char(10)      not null,
    quantity   integer       not null default 1,
    item_price decimal(8, 2) not null
);

# ------------------------
# 更新表
# ------------------------
alter table Vendors
    add vend_phone char(20);

alter table Vendors
    drop column vend_phone;

# ------------------------
# 删除表
# ------------------------
drop table CustCopy;

# ------------------------
# 重命名表
# ------------------------
rename table CustNew to CustomersNew;


# ------------------------
# 挑战题
# ------------------------
# 第一题
alter table Vendors
    add vend_web varchar(1000);
# 第二题
update Vendors
set vend_web='https://www.baidu.com/'
where vend_id = 'BRS01';