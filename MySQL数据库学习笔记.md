# MySQL数据库学习笔记

Abstract：本文是根据作者学习MySQL数据库相关知识所作的笔记，主要是参阅[《SQL必知必会》](https://forta.com/books/0135182794/)一书进行学习。

Author： Duguce

Email：zhgyqc@163.com

Datetime:  2022-03-12 10:12 —— 2022-03-12 12:19

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

