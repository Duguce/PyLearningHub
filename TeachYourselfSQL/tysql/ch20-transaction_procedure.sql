# ------------------------
# 管理事务处理
# ------------------------
# 使用ROLLBACK
start transaction;
delete
from Orders;
rollback;
# 使用COMMIT
START TRANSACTION;
DELETE
FROM OrderItems
WHERE order_num = 12345;
DELETE
FROM Orders
WHERE order_num = 12345;
COMMIT;
