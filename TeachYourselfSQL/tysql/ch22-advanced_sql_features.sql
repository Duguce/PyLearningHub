# ------------------------
# 高级SQL特性
# ------------------------

# ------------------------
# 约束
# ------------------------
# 主键
create table Vendors
(
    vend_id      char(10) not null primary key,
    vend_name    char(50) not null,
    vend_address char(50) null,
    vend_city    char(50) null,
    vend_state   char(5)  null,
    vend_zip     char(10) null,
    vend_country char(50) null
);

# 外键
create table Orders
(
    order_num  integer  not null primary key,
    order_date datetime not null,
    cust_id    char(10) not null references Customers (cust_id)
);

alter table Orders
    add constraint
        foreign key (cust_id) references Customers (cust_id)

# 检查约束
CREATE TABLE OrderItems
(
    order_num  int           NOT NULL,
    order_item int           NOT NULL,
    prod_id    char(10)      NOT NULL,
    quantity   int           NOT NULL check ( quantity > 0 ),
    item_price decimal(8, 2) NOT NULL
);

# ------------------------
# 索引
# ------------------------
create index prod_name_ind on Products (prod_name);

# ------------------------
# 触发器
# ------------------------
DELIMITER //
CREATE TRIGGER customer_state
    AFTER INSERT , UPDATE
    ON Customers
    FOR EACH ROW
BEGIN
UPDATE Customers
SET cust_state = UPPER(NEW.cust_state)
WHERE Customers.cust_id = NEW.cust_id;
END//
DELIMITER ;