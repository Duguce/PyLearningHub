# ------------------------
# 存储过程
# ------------------------

# ------------------------
# 创建存储过程
# ------------------------
DELIMITER $$
CREATE PROCEDURE MailingListCount(OUT ListCount INT)
BEGIN
    DECLARE v_rows INT;
    SELECT COUNT(*)
    INTO v_rows
    FROM Customers
    WHERE cust_email IS NOT NULL;
    SET ListCount = v_rows;
END$$
DELIMITER ;

SET @ReturnValue = NULL;
CALL MailingListCount(@ReturnValue);
SELECT @ReturnValue AS ReturnValue;


