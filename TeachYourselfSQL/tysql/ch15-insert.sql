# ------------------------
# 插入数据
# ------------------------

# ------------------------
# 数据插入
# ------------------------
# 插入完整的行
insert into Customers
values (1000000006,
        'Toy Land',
        '123 Any Street',
        'New York',
        'NY',
        '11111',
        'USA',
        NULL,
        NULL);

insert into Customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country,
                      cust_contact,
                      cust_email)
values (1000000006,
        'Toy Land',
        '123 Any Street',
        'New York',
        'NY',
        '11111',
        'USA',
        NULL,
        NULL);
# 插入部分行
insert into Customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country)
values (1000000006,
        'Toy Land',
        '123 Any Street',
        'New York',
        'NY',
        '11111',
        'USA');
# 插入检索出的数据
insert into Customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country)
select cust_id,
       cust_name,
       cust_address,
       cust_city,
       cust_state,
       cust_zip,
       cust_country
from CustNew;

# ------------------------
# 从一个表复制到另一个表
# ------------------------
create table CustCopy as
select *
from Customers;


# ------------------------
# 挑战题
# ------------------------
# 第一题
insert into Customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country,
                      cust_contact,
                      cust_email)
values (1000000017,
        'Duguce',
        '123 Any Street',
        'Shanghai',
        'NY',
        '10086',
        'China',
        NULL,
        NULL);
# 第二题
create table OrdersCopy as
select *
from Orders;

create table OrderItemsCopy as
select *
from OrderItems;