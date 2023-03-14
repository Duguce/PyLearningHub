# MySQL数据库学习笔记

Abstract：本文是根据作者学习MySQL数据库相关知识所作的笔记，主要是参阅[《SQL必知必会》](https://forta.com/books/0135182794/)一书进行学习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-03-12 10:12 —— 2022-03-14 19:35

## 1 数据库概述

**数据库**（Database）是一个结构化数据的集合，可以方便地访问和管理其中的数据。数据库通常由一组相关的表组成，每个表都由一组列和行组成，列定义了表中数据的类型，行包含实际的数据。

数据库的主要作用是提供一种有效的方式来存储和管理数据，同时可以保证数据的完整性和一致性。它们还可以提供一些高级功能，如数据备份和恢复，数据安全性控制，数据共享和多用户访问等。

常见的**数据库类型**包括**关系型数据库**（如MySQL、Oracle、SQL Server等）、**非关系型数据库**（如MongoDB、Redis、Cassandra等）和**图形数据库**（如Neo4j、ArangoDB等）。不同类型的数据库适用于不同的场景和需求。

### 1.1 关系型数据库

**关系型数据库**（Relational Database）是一种以表格形式组织数据的数据库，其中每个表都由行和列组成。每个表中的每一行表示一个记录，每列则表示记录中的一个属性。表之间可以通过某些列进行关联，以便查询跨表格的数据。

关系型数据库的主要特点包括：

- 数据以表格形式组织，易于理解和操作。
- 数据的完整性得到保障，可以在表格级别进行约束和检查，确保数据的正确性和一致性。
- 支持事务处理，可以在多个操作中保证数据的一致性。
- 使用结构化查询语言（SQL）进行数据查询和管理，SQL具有广泛的应用和较高的标准化程度。
- 适用于大型企业级应用，支持多用户访问和数据安全性控制。

### 1.2 RDBMS

**RDBMS**是关系型数据库管理系统（Relational Database Management System）的缩写，它是一种用于管理关系型数据库的软件系统。RDBMS提供了一组功能和工具，使用户能够创建、修改和查询关系型数据库中的数据。

RDBMS的主要功能包括：

- 数据库管理：创建和管理数据库，包括表格、视图、索引、存储过程和触发器等。
- 数据库安全：实现数据访问控制和用户权限管理，确保数据的保密性和完整性。
- 数据库备份和恢复：备份和还原数据库，防止数据丢失或损坏。
- 数据库性能优化：通过索引、缓存、分区等技术优化数据库性能，提高查询效率。
- 数据库复制和同步：实现数据库的分布式部署和数据同步，支持高可用性和容错性。

**常见的RDBMS系统**包括MySQL、Oracle、Microsoft SQL Server、PostgreSQL等，它们广泛应用于企业级应用和大型数据系统中。虽然RDBMS具有很多优点，但也有一些缺点，如处理非结构化数据的能力较弱，对于大规模数据的处理效率有限等。为了应对这些问题，一些新型数据库技术如非关系型数据库等也在逐渐兴起。

### 1.3 SQL

SQL（Structured Query Language）是一种用于管理关系型数据库的标准化语言。SQL允许用户定义、操作和查询数据库中的数据，它包括多个子语言，如数据定义语言（DDL）、数据操纵语言（DML）、数据查询语言（DQL）等。

SQL语句主要包括以下几个方面：

- 数据定义语言（DDL）：用于定义数据库中的对象，如表格、视图、索引、存储过程等。DDL语句包括CREATE、ALTER和DROP等。
- 数据操纵语言（DML）：用于对数据库中的数据进行操作，如添加、修改、删除等。DML语句包括INSERT、UPDATE和DELETE等。
- 数据查询语言（DQL）：用于检索和查询数据库中的数据，包括基本查询和复合查询等。DQL语句主要包括SELECT和FROM等。
- 数据控制语言（DCL）：用于控制用户访问数据库的权限，包括GRANT和REVOKE等。
- 事务控制语言（TCL）：用于处理数据库中的事务，保证数据的一致性和完整性。TCL语句包括BEGIN、COMMIT和ROLLBACK等。

### 1.4 MySQL简介

[MySQL](https://www.mysql.com/)是一种开源的关系型数据库管理系统（RDBMS），它是一款高性能、可靠、易用的数据库系统，被广泛应用于Web应用开发、企业级应用和大型数据系统中。

MySQL的特点包括：

- 开源免费：MySQL是一款完全开源的数据库管理系统，用户可以自由下载、使用和修改。
- 高性能：MySQL支持高并发访问，能够快速处理大量的数据，同时具有较高的扩展性和可定制性。
- 可靠性高：MySQL具有很高的数据可靠性和完整性，支持多种备份和恢复方式，可以防止数据丢失和损坏。
- 易用性好：MySQL具有很好的用户界面和交互性，同时支持多种操作系统和开发语言，方便开发和管理。
- 安全性高：MySQL支持多种安全管理方式，可以保障数据的机密性和完整性，同时支持数据访问控制和用户权限管理。

## 2 检索数据

### 2.1 SELECT语句

SELECT的用途是从一个或多个表中检索信息。为了使用SELECT检索表数据，必须至少给出两条信息——想选择什么，以及从什么地方选择。

### 2.2 检索列

```sql
# 检索单个列
SELECT prod_name
from Products;

# 检索多个列
SELECT prod_id, prod_name, prod_price
from Products;

# 检索所有列
SELECT *
from Products;
```

### 2.3 检索不同的值

DISTINCT关键字可以用于指示数据只返回不同的值，该关键字作用于所有的列，不仅仅是跟在其后的那一列。

```sql
# 检索单列展示所有值
select vend_id
from Products;

# 检索单列仅展示不同值
select distinct vend_id
from Products;

# 检索多列展示所有值
select vend_id, prod_price
from Products;

# 检索多列仅展示不同值
select distinct vend_id, prod_price
from Products;
```

### 2.4 限制结果

SELECT 语句返回指定表中所有匹配的行，很可能是每一行。如果你只想返回第一行或者一定数量的行，可以使用LIMIT关键字。LIMIT指定返回的行数。LIMIT带的OFFSET指定从哪儿开始。

```sql
# 展示5行
select prod_name
from Products
limit 5;
# 展示后续5行
select prod_name
from Products
limit 5 offset 5;
# 展示1-5行(不含第0行)
select prod_name
from Products
limit 1,5;
```

注意：第一个被检索的行是第0行，而不是第1行。

### 2.5 挑战题

1. 编写SQL语句，从Customers表中检索所有的ID（cust_id）。 
2. OrderItems表包含了所有已订购的产品（有些已被订购多次）。编写SQL语句，检索并列出已订购产品（prod_id）的清单（不用列每个 订单，只列出不同产品的清单）。提示：最终应该显示7行。
3. 编写SQL语句，检索Customers表中所有的列，再编写另外的SELECT语句，仅检索顾客的ID。使用注释，注释掉一条SELECT语句，以便运行另一条SELECT语句。

```sql
# 从Customers表中检索所有的 ID（cust_id）
select cust_id
from Customers;

# 从OrderItems表检索并列出已订购产品（prod_id）的清单（只列不同项）
select distinct prod_id
from OrderItems;

# 检索Customers表中所有的列
select *
from Customers;
# 检索顾客的 ID
select cust_id
from Customers;
```

## 3 排序检索数据

本节主要是讲述如何使用SELECT语句的ORDER BY子句，根据需要排序检索出的数据。

### 3.1 按列名排序

检索出的数据并不是随机显示的。如果不排序，数据一般将以它在表中出现的顺序显示，这有可能是数据最初添加到表中的顺序。但是，如果数据随后进行过更新或删除，那么这个顺序将会受到DBMS重用回收存储空间的方式的影响。因此，如果不明确控制的话，则最终的结果不能（也不应该）依赖该排序顺序。

为了明确地排序用SELECT语句检索出的数据，可使用ORDER BY子句。ORDER BY子句取一个或多个列的名字，据此对输出进行排序。

```sql
# 按照pro_name排序
select prod_name
from Products
order by prod_name;
# 按照多个列排序
select prod_id, prod_price, prod_name
from Products
order by prod_price, prod_name;
```

### 3.2 按列位置排序

除了能用列名指出排序顺序外，ORDER BY 还支持按相对列位置进行排序。

```sql
# 按列位置排序
select prod_id, prod_price, prod_name
from Products
order by 2, 3;
```

### 3.3 指定排序方向

数据排序不限于升序排序（从A到Z），这只是默认的排序顺序。还可以使用ORDER BY子句进行降序（从Z到A）排序。为了进行降序排序，必须指定 DESC 关键字。

```sql
# 指定排序方向
select prod_id, prod_price, prod_name
from Products
order by prod_price desc, prod_name;
```

注意：DESC是DESCENDING的缩写，这两个关键字都可以使用。与DESC相对的是 ASC（或ASCENDING），在升序排序时可以指定它。但实际上，ASC没有多大用处，因为升序是默认的（如果既不指定ASC也不指定DESC，则假定为ASC）。

### 3.4 挑战题

1. 编写 SQL语句，从Customers中检索所有的顾客名称（cust_names），并按从Z到A的顺序显示结果。

1. 并按从Z到A的顺序显示结果。

2. 编写 SQL 语句，从Orders表中检索顾客 ID（cust_id）和订单号 （order_num），并先按顾客 ID 对结果进行排序，再按订单日期倒序排列。
3. 显然，我们的虚拟商店更喜欢出售比较贵的物品，而且这类物品有很多。编写SQL语句，显示OrderItems表中的数量和价格（item_price），并按数量由多到少、价格由高到低排序。

```sql
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
```

## 4 过滤数据

本节主要讲述如何使用SELECT语句的WHERE子句指定搜索条件。

### 4.1 使用WHERE子句

数据库表一般包含大量的数据，很少需要检索表中的所有行。通常只会根据特定操作或报告的需要提取表数据的子集。只检索所需数据需要指 定搜索条件（search criteria），搜索条件也称为过滤条件（filter condition）。 在SELECT语句中，数据根据WHERE子句中指定的搜索条件进行过滤。WHERE子句在表名（FROM 子句）之后给出，如下所示：

```sql
# 按指定条件过滤
select prod_name, prod_price
from Products
where prod_price = 3.49;
```

**注意：WHERE的位置**

在同时使用ORDER BY和WHERE子句时，应该让ORDER BY位于WHERE之后，否则将会产生错误。

### 4.2 WHERE子句操作符

下表中是SQL语言中WHERE子句常用的操作符及其说明，使用这些操作符可以对WHERE子句进行逻辑组合，实现更加复杂的筛选条件。

|  操作符  |            说明            |
| :------: | :------------------------: |
|    =     |        判断是否相等        |
| <> 或 != |       判断是否不相等       |
|    <     |        判断是否小于        |
|    >     |        判断是否大于        |
|    <=    |      判断是否小于等于      |
|    >=    |      判断是否大于等于      |
| BETWEEN  |    判断是否在某个范围内    |
|   LIKE   |    判断是否匹配某个模式    |
|    IN    | 判断是否在一个给定的列表中 |
|   NOT    |         取反操作符         |
|   AND    |        逻辑与操作符        |
|    OR    |        逻辑或操作符        |

下面是对应的一些示例：

```sql
# 检查单个值
select prod_name, prod_price
from Products
where prod_price <= 10;
# 不匹配检查
select vend_id, prod_name
from Products
# where vend_id != 'DLL01';
where vend_id <> 'DLL01';
# 范围值检查
select prod_name, prod_price
from Products
where prod_price between 5 and 10;
# 空值检查1
select prod_name
from Products
where prod_price is null;
# 空值检查2
select cust_name
from Customers
where cust_email is null;
```

### 4.3 挑战题

- 编写SQL语句，从Products表中检索产品ID（prod_id）和产品名称（prod_name），只返回价格为9.49美元的产品。
- 编写SQL语句，从Products表中检索产品ID（prod_id）和产品名称（prod_name），只返回价格为9美元或更高的产品。
- 结合第3课和第4课编写SQL语句，从OrderItems表中检索出所有不同订单号（order_num），其中包含100个或更多的产品。 
- 编写SQL语句，返回Products表中所有价格在3美元到6美元之间的产品的名称（prod_name）和价格（prod_price），然后按价格对结果进行排序。

```sql
# 第一题
select prod_id, prod_name
from Products
where prod_price = 9.49;
# 第二题
select prod_id, prod_name
from Products
where prod_price >= 9;
# 第三题
select distinct order_num
from OrderItems
where quantity >= 100;
# 第四题
select prod_name, prod_price
from Products
where prod_price between 3 and 6;
```

## 5 高级数据过滤

本节主要讲述如何组合WHERE子句以建立功能更强、更高级的搜索条件。

### 5.1 组合WHERE子句

为了进行更强的过滤控制，SQL允许给出多个WHERE子句。这些子句有两种使用方式，即以AND子句或OR子句的方式使用。

**AND操作符**

要通过不止一个列进行过滤，可以使用AND操作符给WHERE子句附加条件。下面的代码给出了一个例子：

```sql
select prod_id, prod_price, prod_name
from Products
where vend_id = 'DLL01'
  and prod_price <= 4;
```

**OR操作符**

OR操作符与AND操作符正好相反，它指示DBMS检索匹配任一条件的行。事实上，许多DBMS在OR WHERE子句的第一个条件得到满足的情况下，就不再计算第二个条件了（在第一个条件满足时，不管第二个条件是否满足，相应的行都将被检索出来）。 请看如下的SELECT 语句：

```sql
select prod_id, prod_price, prod_name
from Products
where vend_id = 'DLL01'
   or vend_id = 'BRS01';
```

**求值顺序**

WHERE子句可以包含任意数目的AND和OR操作符。允许两者结合以进行复杂、高级的过滤。SQL（像多数语言一样）在处理OR操作符前，优先处理AND操作符。

```sql
select prod_name, prod_price
from Products
where (vend_id = 'DLL01' or vend_id = 'BRS01')
  and prod_price >= 10;
```

### 5.2 IN操作符

IN操作符用来指定条件范围，范围中的每个条件都可以进行匹配。IN取 一组由逗号分隔、括在圆括号中的合法值。下面的例子说明了这个操作符。

```sql
select prod_name, prod_price
from Products
where vend_id in ('DLL01', 'BRS01')
order by prod_name;
```

IN操作符可以完成与OR相同的功能。但相对而言，IN操作符有以下优点：

- 在有很多合法选项时，IN操作符的语法更清楚，更直观。
- 在与其他AND和OR操作符组合使用IN时，求值顺序更容易管理。
- IN操作符一般比一组OR操作符执行得更快。
- IN的最大优点是可以包含其他SELECT语句，能够更动态地建立WHERE子句。

### 5.3 NOT操作符

WHERE子句中的NOT操作符有且只有一个功能，那就是否定其后所跟的任何条件。因为NOT从不单独使用（它总是与其他操作符一起使用），所以它的语法与其他操作符有所不同。NOT关键字可以用在要过滤的列前， 而不仅是在其后。

```sql
select prod_name
from Products
where not vend_id = 'DLL01'
order by prod_name;
```

### 5.4 挑战题

- 编写SQL语句，从Vendors表中检索供应商名称（vend_name），仅返回加利福尼亚州的供应商（这需要按国家[USA]和州[CA]进行过滤， 没准其他国家也存在一个加利福尼亚州）。提示：过滤器需要匹配字符串。
- 编写SQL语句，查找所有至少订购了总量100个的BR01、BR02或BR03的订单。你需要返回 OrderItems表的订单号（order_num）、 产品ID（prod_id）和数量，并按产品ID和数量进行过滤。提示： 根据编写过滤器的方式，可能需要特别注意求值顺序。
- 现在，我们回顾上一课的挑战题。编写SQL语句，返回所有价格在3美元到6美元之间的产品的名称（prod_name）和价格（prod_price）。 使用AND，然后按价格对结果进行排序。

```sql
# 第一题
select vend_name
from Vendors
where vend_country = 'USA'
  and vend_state = 'CA';
# 第二题
select order_num, prod_id, quantity
from OrderItems
where prod_id in ('BR01', 'BR02', 'BR03')
  AND quantity >= 100;
# 第三题
select prod_name, prod_price
from Products
where prod_price >= 3
  and prod_price <= 6
order by prod_price desc;
```

## 6 用通配符进行过滤

本节介绍什么是通配符、如何使用通配符，以及怎么使用LIKE操作通配符进行通配搜索，以便对数据进行复杂过滤。

通配符搜索只能用于文本字段（字符串），非文本数据类型字段不能使用通配符搜索。

### 6.1 LIKE操作符

**百分号（%）通配符**

最常使用的通配符是百分号（%）。在搜索串中，%表示任何字符出现任意次数。

```sql
# 百分号（%）通配符
select prod_id, prod_name
from Products
where prod_name like 'Fish%';
```

通配符可在搜索模式中的任意位置使用，并且可以使用多个通配符。下面的例子使用两个通配符，它们位于模式的两端：

```sql
# 多个通配符
select prod_id, prod_name
from Products
where prod_name like '%bean bag%';
```

**注意：**通配符%看起来像是可以匹配任何东西，但有个例外，这就是NULL。 子句 WHERE prod_name LIKE '%'不会匹配产品名称为NULL的行。

**下划线（_）通配符**

下划线的用途和%一样，但是它值匹配单个字符，而不是多个字符。

```sql
select prod_id, prod_name
from Products
where prod_name like '__ inch teddy bear';
```

**方括号（[]）通配符**

方括号（[]）通配符用来指定一个字符集，它必须匹配指定位置（通配符的位置）的一个字符。

```sql
select cust_contact
from Customers
where cust_contact like '[JM]%'
order by cust_contact;
```

**注意：**微软的SQL Server支持集合，但是MySQL，Oracle，DB2，SQLite都不支持。

### 6.2 使用通配符的技巧

正如所见，SQL的通配符很有用。但这种功能是有代价的，即通配符搜索一般比前面讨论的其他搜索要耗费更长的处理时间。这里给出一些使用通配符时要记住的技巧。

- 不要过度使用通配符。如果其他操作符能达到相同的目的，应该使用其他操作符。
- 在确实需要使用通配符时，也尽量不要把它们用在搜索模式的开始处。把通配符置于开始处，搜索起来是最慢的。
- 仔细注意通配符的位置。如果放错地方，可能不会返回想要的数据。

### 6.3 挑战题

- 编写SQL语句，从Products表中检索产品名称（prod_name）和描述（prod_desc），仅返回描述中包含toy一词的产品。
- 反过来再来一次。编写SQL语句，从Products表中检索产品名称 （prod_name）和描述（prod_desc），仅返回描述中未出现 toy 一词的产品。这次，按产品名称对结果进行排序。
- 编写SQL语句，从Products表中检索产品名称（prod_name）和描述（prod_desc），仅返回描述中同时出现toy和carrots的产品。 有好几种方法可以执行此操作，但对于这个挑战题，请使用AND和两个LIKE比较。
- 来个比较棘手的。我没有特别向你展示这个语法，而是想看看你根据目前已学的知识是否可以找到答案。编写SQL语句，从Products 表中检索产品名称（prod_name）和描述（prod_desc），仅返回在描述中以先后顺序同时出现toy和carrots的产品。提示：只需要用带有三个%符号的LIKE即可。

```sql
# 第一题
select prod_name, prod_desc
from Products
where prod_desc like '%toy%';
# 第二题
select prod_name, prod_desc
from Products
where not prod_desc like '%toy%'
order by prod_name;
# 第三题
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%'
  AND prod_desc LIKE '%carrots%';
# 第四题
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%carrots%';
```

## 7 创建计算字段

本节主要介绍什么是计算字段，如何创建计算字段，以及如何从应用程序中使用别名引用它们。

### 7.1 计算字段

存储在数据库表中的数据一般不是应用程序所需要的格式，我们需要直接从数据库中检索出转换、计算或格式化过的数据，而不是检索出数据，然后再在客户端应用程序中重新格式化。这就是计算字段可以派上用场的地方了。计算字段是运行时在SELECT语句内创建的。

### 7.2 拼接字段

在SQL中的SELECT 语句中，可使用一个特殊的操作符来拼接两个列。根据你所使用的DBMS，此操作符可用加号（+）或两个竖杠（||）表示。但在**MySQL**和MariaDB中，**必须使用CONCAT()**函数。

```sql
select CONCAT(vend_name, ' (', vend_country, ')')
from Vendors
order by vend_name;
```

再看看上述SELECT语句返回的输出。结合成一个计算字段的两个列用空格填充。许多数据库（不是所有）保存填充为列宽的文本值，而实际上你要的结果不需要这些空格。为正确返回格式化的数据，必须去掉这些空格。这可以使用SQL的RTRIM()函数来完成，如下所示：

```sql
select concat(rtrim(vend_name), ' (', rtrim(vend_country), ')')
from Vendors
order by vend_name;
```

**注意：**大多数DBMS都支持RTRIM()（正如刚才所见，它去掉字符串右边的空格）、LTRIM()（去掉字符串左边的空格）以及 TRIM()（去掉字符串左右两边的空格）。

**使用别名**

从前面的输出可以看到，SELECT语句可以很好地拼接地址字段。但是，这个新计算列的名字是什么呢？实际上它没有名字，它只是一个值。如果仅在SQL查询工具中查看一下结果，这样没有什么不好。但是，一个未命名的列不能用于客户端应用中，因为客户端没有办法引用它。 为了解决这个问题，SQL支持列别名。别名（alias）是一个字段或值的替换名。别名用AS关键字赋予。请看下面的SELECT语句：

```sql
select concat(rtrim(vend_name), ' (', rtrim(vend_country), ')')
           as vend_title
from Vendors
order by vend_name;
```

### 7.3 执行算术计算

计算字段的另一常见用途是对检索出的数据进行算术计算。举个例子，Orders 表包含收到的所有订单，OrderItems表包含每个订单中的各项物品。

```sql
# 检索订单号 20008
select prod_id, quantity, item_price
from OrderItems
where order_num = 20008;
# 汇总物品的价格
select prod_id, quantity, item_price, quantity * item_price as expanded_price
from OrderItems
where order_num = 20008;
```

### 7.4 挑战题

- 别名的常见用法是在检索出的结果中重命名表的列字段（为了符合特定的报表要求或客户需求）。编写 SQL 语句，从 Vendors 表中检索 vend_id、vend_name、vend_address 和 vend_city，将 vend_name 重命名为 vname，将 vend_city 重命名为 vcity，将 vend_address 重命名为 vaddress。按供应商名称对结果进行排序（可以使用原始名称或新的名称）。
- 我们的示例商店正在进行打折促销，所有产品均降价 10%。编写 SQL 语句，从 Products 表中返回 prod_id、prod_price 和 sale_price。sale_price 是一个包含促销价格的计算字段。提示：可以乘以 0.9，得到原价的 90%（即 10%的折扣）。

```sql
# 第一题
select vend_id, vend_name as vname, vend_address as vaddress, vend_city as vcity
from Vendors
order by vend_name;
# 第二题
select prod_id, prod_price, prod_price * 0.9 as sale_price
from Products;
```

## 8 使用函数处理数据

本节介绍什么是函数，DBMS支持何种函数，以及如何使用这些函数；还讲解为什么SQL函数的使用可能会带来问题。

### 8.1 函数

与大多数其他计算机语言一样，SQL 也可以用函数来处理数据。函数一般是在数据上执行的，为数据的转换和处理提供了方便。

大多数 SQL 实现支持以下类型的函数。

- 用于处理文本字符串（如删除或填充值，转换值为大写或小写）的文本函数。
- 用于在数值数据上进行算术操作（如返回绝对值，进行代数运算）的数值函数。
- 用于处理日期和时间值并从这些值中提取特定成分（如返回两个日期之差，检查日期有效性）的日期和时间函数。 
- 用于生成美观好懂的输出内容的格式化函数（如用语言形式表达出日期，用货币符号和千分位表示金额）。 
- 返回 DBMS 正使用的特殊信息（如返回用户登录信息）的系统函数。

**文本处理函数**

```sql
# upper()
select vend_name, upper(vend_name) as vend_name_upcase
from Vendors
order by vend_name;
# soundex() 类似的发音字符和音节
select cust_name, cust_contact
from Customers
where cust_contact = 'Michael Green';

select cust_name, cust_contact
from Customers
where soundex(cust_contact) = soundex('Michael Green');
```

### 8.2 挑战题

- 我们的商店已经上线了，正在创建顾客账户。所有用户都需要登录名，默认登录名是其名称和所在城市的组合。编写 SQL 语句，返回顾客 ID（cust_id）、顾客名称（customer_name）和登录名（user_login），其中登录名全部为大写字母，并由顾客联系人的前两个字符（cust_contact）和其所在城市的前三个字符（cust_city）组成。例如，我的登录名是 BEOAK（Ben Forta，居住在 Oak Park）。提示：需要使用函数、拼接和别名。
- 编写 SQL 语句，返回 2012 年 1 月的所有订单的订单号（order_num） 和订单日（order_date），并按订单日期排序。你应该能够根据目前已学的知识来解决此问题，但也可以开卷查阅 DBMS 文档。

```sql
# 第一题
select cust_id, cust_name, concat(left(cust_contact, 2), left(cust_city, 3)) as user_login
from Customers;
# 第二题
select order_num, order_date
from Orders
where year(order_date) = 2012
  and month(order_date) = 1
order by order_date;
```

## 9 汇总数据

本节介绍什么是SQL的聚集函数，以及如何利用他们汇总表的数据。

### 9.1 聚集函数

我们经常需要汇总数据而不用把它们实际检索出来，为此 SQL 提供了专门的函数。使用这些函数，SQL 查询可用于检索数据，以便分析和报表生成。与前一节介绍的数据处理函数不同，SQL 的聚集函数在各种主要 SQL 实现中得到了相当一致的支持。

**AVG()函数**

```sql
select avg(prod_price) as avg_price
from Products;
```

**COUNT()函数**

```sql
select count(*) as num_cust
from Customers;

select count(cust_email) as num_cust
from Customers;
```

- 使用 COUNT(*)对表中行的数目进行计数，不管表列中包含的是空值（NULL）还是非空值。
- 使用 COUNT(column)对特定列中具有值的行进行计数，忽略 NULL 值。

**MAX()函数**

```sql
select max(prod_price) as max_price
from Products;
```

**MIN()函数**

```sql
select min(prod_price) as max_price
from Products;
```

**SUM()函数**

```sql
select sum(quantity) as items_ordered
from OrderItems
where order_num = 20005;

select sum(quantity*item_price) as total_price
from OrderItems
where order_num = 20005;
```

### 9.2 聚集不同值

以上 5 个聚集函数都可以如下使用。 

- 对所有行执行计算，指定 ALL 参数或不指定参数（因为 ALL 是默认行为）。
- 只包含不同的值，指定 DISTINCT 参数。

```sql
select avg(distinct prod_price) as avg_price
from Products
where vend_id = 'DLL01';
```

### 9.3 组合聚集函数

目前为止的所有聚集函数例子都只涉及单个函数。但实际上，SELECT 语句可根据需要包含多个聚集函数。

```sql
select count(*)        as num_items,
       min(prod_price) as price_min,
       max(prod_price) as price_max,
       avg(prod_price) as price_avg
from Products;
```

### 9.4 挑战题

- 编写 SQL 语句，确定已售出产品的总数（使用 OrderItems 中的 quantity 列）。
- 修改刚刚创建的语句，确定已售出产品项（prod_item）BR01 的总数。
- 编写 SQL 语句，确定 Products 表中价格不超过 10 美元的最贵产品的价格（prod_price）。将计算所得的字段命名为 max_price。

```sql
# 第一题
select count(quantity) as total_quant
from OrderItems;
# 第二题
select count(quantity) as total_BR01
from OrderItems
where prod_id = 'BR01';
# 第三题
select max(prod_price) as max_price
from Products
where prod_price <= 10;
```

## 10 分组数据

本节介绍如何分组数据，以便汇总表内容的子集。这设计两个SELECT语句子句：GROUP BY子句和HAVING子句。

### 10.1 创建分组

分组是使用 SELECT 语句的 GROUP BY 子句建立的。

```sql
select vend_id, count(*) as num_prods
from Products
group by vend_id;
```

在使用 GROUP BY 子句前，需要知道一些重要的规定。

- GROUP BY 子句可以包含任意数目的列，因而可以对分组进行嵌套，更细致地进行数据分组。
- 如果在 GROUP BY 子句中嵌套了分组，数据将在最后指定的分组上进行汇总。换句话说，在建立分组时，指定的所有列都一起计算（所以不能从个别的列取回数据）
- GROUP BY 子句中列出的每一列都必须是检索列或有效的表达式（但不能是聚集函数）。如果在 SELECT 中使用表达式，则必须在 GROUP BY 子句中指定相同的表达式。不能使用别名。
- 大多数 SQL 实现不允许 GROUP BY 列带有长度可变的数据类型（如文本或备注型字段）。
- 本或备注型字段）。
- 除聚集计算语句外，SELECT 语句中的每一列都必须在 GROUP BY 子句中给出。
- 如果分组列中包含具有 NULL 值的行，则 NULL 将作为一个分组返回。如果列中有多行 NULL 值，它们将分为一组。
- GROUP BY 子句必须出现在 WHERE 子句之后，ORDER BY 子句之前。

### 10.2 过滤分组

除了能用 GROUP BY 分组数据外，SQL 还允许过滤分组，规定包括哪些分组，排除哪些分组。除了能用 GROUP BY 分组数据外，SQL 还允许过滤分组，规定包括哪些分组，排除哪些分组。HAVING 非常类似于 WHERE。事实上，目前为止所学过的所有类型的 WHERE 子句都可以用 HAVING 来替代。唯一的差别是，WHERE 过滤行，而 HAVING 过滤分组。

```sql
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
```

### 10.3 分组和排序

GROUP BY 和 ORDER BY 经常完成相同的工作，但它们非常不同，理解这一点很重要。

|      区别点      |                ORDER BY                |                GROUP BY                |
| :--------------: | :------------------------------------: | :------------------------------------: |
|     基本作用     |         按指定列的值排序结果集         |        按指定列对结果集进行分组        |
| 结果集中行的顺序 |          按排序列的值进行排序          |          按分组列的值进行分组          |
|   聚合函数使用   |    可以在 SELECT 子句中使用聚合函数    |    必须在 SELECT 子句中使用聚合函数    |
|      列过滤      |      可以使用 WHERE 子句来过滤行       |      可以使用 HAVING 子句来过滤组      |
|     返回列数     | 返回与 SELECT 子句中指定的列相同的列数 | 返回与 SELECT 子句中指定的列不同的列数 |
|     执行顺序     |          是查询结果的最后一步          |          是查询结果的中间一步          |

```sql
select order_num, count(*) as items
from OrderItems
group by order_num
having count(*) >= 3
order by items, order_num;
```

### 10.4 SELECT 子句顺序

下面是 SELECT语句中子句的顺序表：

|   子句   |          说明          | 是否必须使用 |
| :------: | :--------------------: | :----------: |
|  SELECT  | 指定要返回的列或表达式 |     必须     |
|   FROM   |     指定要查询的表     |     必须     |
|   JOIN   |  用于连接两个或多个表  |     可选     |
|  WHERE   |       用于筛选行       |     可选     |
| GROUP BY |      用于按列分组      |     可选     |
|  HAVING  |      用于筛选分组      |     可选     |
| ORDER BY |  用于对结果集进行排序  |     可选     |
|  LIMIT   |   用于限制返回的行数   |     可选     |

### 10.5 挑战题

- OrderItems 表包含每个订单的每个产品。编写 SQL 语句，返回每个订单号（order_num）各有多少行数（order_lines），并按 order_lines 对结果进行排序。
- 编写 SQL 语句，返回名为 cheapest_item 的字段，该字段包含每个供应商成本最低的产品（使用 Products 表中的 prod_price），然后从最低成本到最高成本对结果进行排序。
- 确定最佳顾客非常重要，请编写 SQL 语句，返回至少含 100 项的所有订单的订单号（OrderItems 表中的 order_num）。
- 确定最佳顾客的另一种方式是看他们花了多少钱。编写 SQL 语句，返回总价至少为 1000 的所有订单的订单号（OrderItems 表中的 order_num）。提示：需要计算总和（item_price 乘以 quantity）。按订单号对结果进行排序。

```sql
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
```

## 11 使用子查询

本节主要介绍什么是子查询，以及如何使用它们。SQL允许创建子查询，即嵌套在其他查询中的查询。

### 11.1 利用子查询进行过滤

假如需要列出订购物品 RGAN01 的所有顾客，应该怎样检索？下面列出具体的步骤。

- 检索包含物品 RGAN01 的所有订单的编号。
- 检索具有前一步骤列出的订单编号的所有顾客的 ID。
- 检索前一步骤返回的所有顾客 ID 的顾客信息。

```sql
select cust_name, cust_contact
from Customers
where cust_id in (
    select cust_id
    from Orders
    where order_num in (
        select distinct order_num
        from OrderItems
        where prod_id = 'RGAN01'));
```

### 11.2 作为计算字段使用子查询

使用子查询的另一方法是创建计算字段。假如需要显示 Customers 表中每个顾客的订单总数。订单与相应的顾客 ID 存储在 Orders 表中。执行这个操作，要遵循下面的步骤：

- 从 Customers 表中检索顾客列表；
- 对于检索出的每个顾客，统计其在 Orders 表中的订单数目。

```sql
select cust_name,
       cust_state,
       (select count(*)
        from Orders
        where Orders.cust_id = Customers.cust_id) as orders
from Customers
order by cust_name;
```

### 11.3 挑战题

- 使用子查询，返回购买价格为 10 美元或以上产品的顾客列表。你需要使用 OrderItems 表查找匹配的订单号（order_num），然后使用 Order 表检索这些匹配订单的顾客 ID（cust_id）。
- 你想知道订购 BR01 产品的日期。编写 SQL 语句，使用子查询来确定哪些订单（在 OrderItems 中）购买了 prod_id 为 BR01 的产品，然后从 Orders 表中返回每个产品对应的顾客 ID（cust_id）和订单日期（order_date）。按订购日期对结果进行排序。
- 现在我们让它更具挑战性。在上一个挑战题，返回购买 prod_id 为 BR01 的产品的所有顾客的电子邮件（Customers 表中的 cust_email）。提示：这涉及 SELECT 语句，最内层的从 OrderItems 表返回 order_num， 中间的从 Customers 表返回 cust_id。
- 我们需要一个顾客 ID 列表，其中包含他们已订购的总金额。编写 SQL 语句，返回顾客 ID（Orders 表中的 cust_id），并使用子查询返回 total_ordered 以便返回每个顾客的订单总数。将结果按金额从大到小排序。提示：你之前已经使用 SUM()计算订单总数。
- 再来。编写 SQL 语句，从 Products 表中检索所有的产品名称（prod_name），以及名为 quant_sold 的计算列，其中包含所售产品的总数（在 OrderItems 表上使用子查询和 SUM(quantity)检索）。

```sql
# 第一题
select cust_id
from Orders
where order_num in (
    select order_num
    from OrderItems
    where item_price >= 10);
# 第二题
select cust_id, order_date
from Orders
where order_num in (
    select order_num
    from OrderItems
    where prod_id = 'BR01')
order by order_date;
# 第三题
select cust_email
from Customers
where cust_id in (
    select cust_id
    from Orders
    where order_num in (
        select order_num
        from OrderItems
        where prod_id = 'BR01'));
# 第四题
select cust_id,
       (select sum(quantity * item_price)
        from OrderItems
        where OrderItems.order_num = Orders.order_num) as total_ordered
from Orders
order by total_ordered desc;
# 第五题
select prod_name,
       (select sum(quantity)
        from OrderItems
        where OrderItems.prod_id = Products.prod_id) as quant_sold
from Products
```

## 12 联结表

本节介绍什么是联结，为什么使用联结，以及如何编写使用联结的SELECT语句。

### 12.1 联结

SQL 最强大的功能之一就是能在数据查询的执行中联结（join）表。联结是利用 SQL 的 SELECT 能执行的最重要的操作，很好地理解联结及其语法是学习 SQL 的极为重要的部分。 

**关系表**

理解关系表，最好是来看个例子。

有一个包含产品目录的数据库表，其中每类物品占一行。对于每一种物品，要存储的信息包括产品描述、价格，以及生产该产品的供应商。

现在有同一供应商生产的多种物品，那么在何处存储供应商名、地址、联系方法等供应商信息呢？将这些数据与产品信息分开存储的理由是：

- 同一供应商生产的每个产品，其供应商信息都是相同的，对每个产品重复此信息既浪费时间又浪费存储空间；
- 如果供应商信息发生变化，例如供应商迁址或电话号码变动，只需修改一次即可；
- 如果有重复数据（即每种产品都存储供应商信息），则很难保证每次输入该数据的方式都相同。不一致的数据在报表中就很难利用。

关键是，**相同的数据出现多次决不是一件好事**，这是关系数据库设计的基础。关系表的设计就是要把信息分解成多个表，一类数据一个表。各表通过某些共同的值互相关联（所以才叫关系数据库）。

这样做的好处是： 

- 供应商信息不重复，不会浪费时间和空间；
- 如果供应商信息变动，可以只更新 Vendors 表中的单个记录，相关表中的数据不用改动；
- 由于数据不重复，数据显然是一致的，使得处理数据和生成报表更简单。

**为什么使用联结**

如前所述，将**数据分解为多个表**能更**有效地存储**，更方便地处理，并且**可伸缩性更好**。但这些好处是**有代价的**。

如果数据存储在多个表中，怎样用一条 SELECT 语句就检索出数据呢？

答案是使用联结。简单说，联结是一种机制，用来在一条 SELECT 语句中关联表，因此称为联结。使用特殊的语法，可以联结多个表返回一组输出，联结在运行时关联表中正确的行。

### 12.2 创建联结

创建联结非常简单，指定要联结的所有表以及关联它们的方式即可。

```sql
select vend_name, prod_name, prod_price
from Vendors,
     Products
where Vendors.vend_id = Products.vend_id;
```

**WHERE子句的重要性**

使用 WHERE 子句建立联结关系似乎有点奇怪，但实际上是有个很充分的理由的。要记住，在一条 SELECT 语句中联结几个表时，相应的关系是在运行中构造的。在联结两个表时，实际要做的是将第一个表中的每一行与第二个表中的每一行配对。WHERE 子句作为过滤条件，只包含那些匹配给定条件（这里是联结条件）的行。没有 WHERE子句，第一个表中的每一行将与第二个表中的每一行配对，而不管它们逻辑上是否能配在一起。

**内联结**

目前为止使用的联结称为等值联结（equijoin），它基于两个表之间的相等测试。这种联结也称为内联结（inner join）。其实，可以对这种联结使用稍微不同的语法，明确指定联结的类型。

```sql
select vend_name, prod_name, prod_price
from Vendors
         inner join Products on Vendors.vend_id = Products.vend_id;
```

此语句中的 SELECT 与前面的 SELECT 语句相同，但 FROM 子句不同。这里，两个表之间的关系是以 INNER JOIN 指定的部分 FROM 子句。在使用这种语法时，联结条件用特定的 ON 子句而不是 WHERE 子句给出。

**联结多个表**

SQL 不限制一条 SELECT 语句中可以联结的表的数目。创建联结的基本规则也相同。首先列出所有表，然后定义表之间的关系。

```sql
select prod_name, vend_name, prod_price, quantity
from OrderItems,
     Products,
     Vendors
where Products.vend_id = Vendors.vend_id
  and OrderItems.prod_id = Products.prod_id
  and order_num = 20007;
```

注意：性能考虑

DBMS 在运行时关联指定的每个表，以处理联结。这种处理可能非常耗费资源，因此应该注意，不要联结不必要的表。联结的表越多，性能下降越厉害。

注意：联结中表的最大数目 

虽然 SQL 本身不限制每个联结约束中表的数目，但实际上许多 DBMS 都有限制。请参阅具体的 DBMS 文档以了解其限制。

### 12.3 挑战题

- 编写 SQL 语句，返回 Customers 表中的顾客名称（cust_name）和 Orders 表中的相关订单号（order_num），并 按顾客名称再按订单号对结果进行排序。实际上是尝试两次，一次使用简单的等联结语法，一次使用 INNER JOIN。
- 我们来让上一题变得更有用些。除了返回顾客名称和订单号，添加第三列 OrderTotal，其中包含每个订单的总价。有两种方法可以执行此操作：使用 OrderItems 表的子查询来创建 OrderTotal 列，或者将 OrderItems 表与现有表联结并使用聚合函数。提示：请注意需要使用完全限定列名的地方。
- 我们重新看一下第 11 节的挑战题 2。编写 SQL 语句，检索订购产品 BR01 的日期，这一次使用联结和简单的等联结语法。输出应该与第 11 节的输出相同。
- 很有趣，我们再试一次。重新创建为第 11 节挑战题 3 编写的 SQL 语句，这次使用 ANSI 的 INNER JOIN 语法。在之前编写的代码中使用了两个嵌套的子查询。要重新创建它，需要两个 INNER JOIN 语句，每个语句的格式类似于本课讲到的 INNER JOIN 示例，而且不要忘记 WHERE 子句可以通过 prod_id 进行过滤。
- 再让事情变得更加有趣些，我们将混合使用联结、聚合函数和分组。准备好了吗？回到第 10 节，当时的挑战是要求查找值等于或大于 1000 的所有订单号。这些结果很有用，但更有用的是订单数量至少达到这个数的顾客名称。因此，编写 SQL 语句，使用联结从 Customers 表返回顾客名称（cust_name），并从 OrderItems 表返回所有订单的总价。提示：要联结这些表，还需要包括 Orders 表（因为 Customers 表与 OrderItems 表不直接相关，Customers 表与 Orders 表相关，而Orders 表与 OrderItems 表相关）。不要忘记 GROUP BY 和 HAVING，并按顾客名称对结果进行排序。你可以使用简单的等联结或 ANSI 的 INNER JOIN 语法。或者，如果你很勇敢，请尝试使用两种方式编写。

```sql
# 第一题
select cust_name, order_num
from Customers,
     Orders
where Customers.cust_id = Orders.cust_id
order by cust_name, order_num;

select cust_name, order_num
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
order by cust_name, order_num;
# 第二题
select cust_name,
       order_num,
       (select sum(quantity * item_price)
        from OrderItems
        where OrderItems.order_num = Orders.order_num) as order_total
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id;
# 第三题
select cust_id, order_date
from OrderItems,
     Orders
where OrderItems.order_num = Orders.order_num
  and prod_id = 'BR01'
order by cust_id, order_date;

select cust_id, order_date
from Orders
         inner join OrderItems on Orders.order_num = OrderItems.order_num
where prod_id = 'BR01'
order by cust_id, order_date;
# 第四题
select cust_email
from Orders
         inner join Customers on Orders.cust_id = Customers.cust_id
         inner join OrderItems on OrderItems.order_num = Orders.order_num
where prod_id = 'BR01';
# 第五题
select cust_name,
       sum(quantity * item_price) as total_price
from Orders
         inner join Customers on Customers.cust_id = Orders.cust_id
         inner join OrderItems on OrderItems.order_num = Orders.order_num
group by cust_name
having total_price >= 1000
order by cust_name;

select cust_name,
       sum(quantity * item_price) as total_price
from Orders,
     Customers,
     OrderItems
where Customers.cust_id = Orders.cust_id
  and OrderItems.order_num = Orders.order_num
group by cust_name
having total_price >= 1000
order by cust_name;
```

## 13 创建高级联结

本节主要讲述另外一些联结，介绍如何使用表别名，如何对被联结的表使用聚合函数。

### 13.1 使用表别名

SQL除了可以对列名和计算字段使用别名，还允许给表名起别名。这样做有两个主要理由：

- 缩短SQL语句；
- 允许在一条SELECT 语句中多次使用相同的表。

```SQL
select cust_name, cust_contact
from Customers as C,
     Orders as O,
     OrderItems as OI
where C.cust_id = O.cust_id
  and OI.order_num = O.order_num
  and prod_id = 'RGAN01';
```

### 13.2 使用不同类型的联结

迄今为止，我们使用的只是内联结或等值联结的简单联结。现在来看三种其他联结：自联结（self-join）、自然联结（natural join）和外联结（outer join）。

**自联结**

自联结通常作为外部语句，用来替代从相同表中检索数据的使用子查询语句。虽然最终的结果是相同的，但许多DBMS处理联结远比处理子查询快得多。应该试一下两种方法，以确定哪一种的性能更好。

```sql
select cust_id, cust_name, cust_contact
from Customers
where cust_name = (select cust_name
                   from Customers
                   where cust_contact = 'John Smith');

select c1.cust_id, c1.cust_name, c1.cust_contact
from Customers c1,
     Customers c2
where c1.cust_name = c2.cust_name
  and c2.cust_contact = 'John Smith';
```

**自然联结**

无论何时对表进行联结，应该至少有一列不止出现在一个表中（被联结的列）。标准的联结（前一节中介绍的内联结）返回所有数据，相同的列甚至多次出现。自然联结排除多次出现，使每一列只返回一次。

```SQL
select C.*,
       O.order_num,
       O.order_date,
       OI.prod_id,
       OI.quantity,
       OI.item_price
from Customers C,
     Orders O,
     OrderItems OI
where C.cust_id = O.cust_id
  and OI.order_num = O.order_num
  and prod_id = 'RGAN01';
```

**外联结**

许多联结将一个表中的行与另一个表中的行相关联，但有时候需要包含没有关联行的那些行。要检索包括没有订单顾客在内的所有顾客，可如下进行：

```sql
select Customers.cust_id, Orders.order_num
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id;
```

与内联结关联两个表中的行不同的是，外联结还包括没有关联行的行。在使用 OUTER JOIN 语法时，必须使用 RIGHT 或 LEFT 关键字指定包括其所有行的表（RIGHT 指出的是 OUTER JOIN 右边的表，而 LEFT 指出的是 OUTER JOIN 左边的表）。上面的例子使用 LEFT OUTER JOIN 从 FROM 子句左边的表（Customers 表）中选择所有行。为了从右边的表中选择所有行，需要使用 RIGHT OUTER JOIN，如下例所示：

```sql
select Customers.cust_id, Orders.order_num
from Customers
         right join Orders on Customers.cust_id = Orders.cust_id;
```

### 13.3 使用带聚集函数的联结

虽然至今为止我们举的聚集函数的例子都只是从一个表中汇总数据，但这些函数也可以与联结一起使用。

```sql
select Customers.cust_id,
       count(Orders.order_num) as num_ord
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id
group by Customers.cust_id;

select Customers.cust_id,
       count(Orders.order_num) as num_ord
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id
group by Customers.cust_id;
```

### 13.4 挑战题

- 使用INNER JOIN 编写SQL语句，以检索每个顾客的名称（Customers 表中的 cust_name）和所有的订单号（Orders 表中的 order_num）。
- 修改刚刚创建的SQL语句，仅列出所有顾客，即使他们没有下过订单。
- 使用 OUTER JOIN 联结 Products 表和 OrderItems 表，返回产品名称（prod_name）和与之相关的订单号（order_num）的列表，并按商品名称排序。
- 修改上一题中创建的 SQL 语句，使其返回每一项产品的总订单数（不是订单号）。
- 编写SQL语句，列出供应商（Vendors表中的vend_id）及其可供产品的数量，包括没有产品的供应商。你需要使用OUTER JOIN 和COUNT()聚合函数来计算 Products 表中每种产品的数量。注意：vend_id 列会显示在多个表中，因此在每次引用它时都需要完全限定它。

```sql
# 第一题
select Customers.cust_name, Orders.order_num
from Customers
         inner join Orders on Customers.cust_id = Orders.cust_id;
# 第二题
select Customers.cust_name, Orders.order_num
from Customers
         left join Orders on Customers.cust_id = Orders.cust_id;
# 第三题
select Products.prod_name, OrderItems.order_num
from Products
         inner join OrderItems on Products.prod_id = OrderItems.prod_id;
# 第四题
select Products.prod_name, count(OrderItems.order_num) as num_ord
from Products
         inner join OrderItems on Products.prod_id = OrderItems.prod_id
group by Products.prod_name;
# 第五题
select Vendors.vend_id, count(Products.prod_id)
from Vendors
         inner join Products on Vendors.vend_id = Products.vend_id
group by Vendors.vend_id;
```
