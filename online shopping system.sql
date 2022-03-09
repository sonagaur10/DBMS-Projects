
mysql> create database shopping;
Query OK, 1 row affected (3.44 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| abc                |
| bxy                |
| employees          |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| shopping           |
| sys                |
+--------------------+
9 rows in set (0.03 sec)

mysql> use shopping;
Database changed
mysql> create table customer( customer_ID char(8) primary key,Name varchar(20),Contact char(10), Address varchar(100));
Query OK, 0 rows affected (13.14 sec)

mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_ID | char(8)      | NO   | PRI | NULL    |       |
| Name        | varchar(20)  | YES  |     | NULL    |       |
| Contact     | char(10)     | YES  |     | NULL    |       |
| Address     | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
4 rows in set (2.43 sec)

mysql> insert into customer(customer_ID,Name,Contact,Address) values ('3333_pi','Mukesh Kumar','2323232334','delhi road meerut');
Query OK, 1 row affected (9.07 sec)

mysql> insert into customer(customer_ID,Name,Contact,Address) values ('3333_pi','Mukesh Kumar','2323232334','delhi road meerut');
ERROR 1062 (23000): Duplicate entry '3333_pi' for key 'customer.PRIMARY'



mysql> desc customer;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_ID | char(8)      | NO   | PRI | NULL    |       |
| Name        | varchar(20)  | YES  |     | NULL    |       |
| Contact     | char(10)     | YES  |     | NULL    |       |
| Address     | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
4 rows in set (6.42 sec)



mysql> desc Shopping_order;
ERROR 1146 (42S02): Table 'shopping.Shopping_order' doesn't exist
mysql> desc Shopping_Order;
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| Order_ID    | char(5) | NO   | PRI | NULL    |       |
| customer_ID | char(8) | NO   | MUL | NULL    |       |
| Date        | date    | YES  |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
3 rows in set (0.09 sec)


mysql> create table Category( Category_ID char(5) primary key,Category_name varchar(20) not null, Category_type ENUM('Electronics','Footwear','Casuals'));
Query OK, 0 rows affected (0.52 sec)

mysql> create table Deliveries( Delivery_ID char(5) primary key,customer_ID cha
r(8) not null,Date date,foreign key (customer_ID) references customer (customer_ID));
Query OK, 0 rows affected (0.66 sec)


mysql> create table Products( Products_ID char(5) primary key,Category_ID char(5) not null,Product_name varchar(20),foreign key (Category_ID) references Category (Category_ID));
Query OK, 0 rows affected (13.64 sec)


mysql> desc Products;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| Products_ID  | char(5)     | NO   | PRI | NULL    |       |
| Category_ID  | char(5)     | NO   | MUL | NULL    |       |
| Product_name | varchar(20) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.07 sec)

mysql> create table Seller( Seller_ID char(3) primary key,Products_ID char(5) not null,Seller_name varchar(10),foreign key (Products_ID) references Products(Products_ID));
Query OK, 0 rows affected (0.46 sec)

mysql> create table Payment( Payment_ID char(8) primary key,customer_ID char(8)
 not null,Date date,foreign key (customer_ID) references customer(customer_ID));
Query OK, 0 rows affected (0.40 sec)

mysql> create table Trans_Report( report_ID char(7) primary key,customer_ID char(8) not null,Order_ID char(5) not null,Products_ID char(5) not null,Payment_ID char(8) not null,foreign key (customer_ID) references customer(customer_ID),foreign key(Order_ID) references Shopping_Order(Order_ID),foreign key(Products_ID
) references Products(Products_ID),foreign key(Payment_ID) references Payment(Payment_ID));
Query OK, 0 rows affected (0.86 sec)

mysql> desc Trans_Report;
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| report_ID   | char(7) | NO   | PRI | NULL    |       |
| customer_ID | char(8) | NO   | MUL | NULL    |       |
| Order_ID    | char(5) | NO   | MUL | NULL    |       |
| Products_ID | char(5) | NO   | MUL | NULL    |       |
| Payment_ID  | char(8) | NO   | MUL | NULL    |       |
+-------------+---------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> insert into customer values('3333_pi','suresh',8909890900,'vasant kunj delhi');
ERROR 1062 (23000): Duplicate entry '3333_pi' for key 'customer.PRIMARY'
mysql> insert into customer values('3345_ty','suresh',8909890900,'vasant kunj delhi');
Query OK, 1 row affected (0.39 sec)

mysql> select * from customer;
+-------------+--------------+------------+-------------------+
| customer_ID | Name         | Contact    | Address           |
+-------------+--------------+------------+-------------------+
| 3333_pi     | Mukesh Kumar | 2323232334 | delhi road meerut |
| 3345_ty     | suresh       | 8909890900 | vasant kunj delhi |
+-------------+--------------+------------+-------------------+
2 rows in set (0.00 sec)

insert into Shopping_Order values('A001','3333_pi','2022-02-21');
Query OK, 1 row affected (3.65 sec)

mysql> insert into Shopping_Order values('A002','3333_pi','2022-02-21');
Query OK, 1 row affected (0.39 sec)

mysql> insert into Shopping_Order values('A002','3335_ty','2022-02-21');
ERROR 1062 (23000): Duplicate entry 'A002' for key 'Shopping_Order.PRIMARY'
mysql> select * from Products;
Empty set (0.02 sec)

mysql> insert into Products values('123','111','samsung phone');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`shopping`.`Products`, CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`))
mysql> select * from Category;
Empty set (0.00 sec)

mysql> insert into Category values('111','Mobile','Electronics');
Query OK, 1 row affected (0.07 sec)

mysql> select * from Category;
+-------------+---------------+---------------+
| Category_ID | Category_name | Category_type |
+-------------+---------------+---------------+
| 111         | Mobile        | Electronics   |
+-------------+---------------+---------------+
1 row in set (0.00 sec)

mysql> insert into Products values('123','111','samsung phone');
Query OK, 1 row affected (0.07 sec)

mysql> insert into Products values('126','111','samsung phone');
Query OK, 1 row affected (0.10 sec)

mysql> select * from Payment;
Empty set (0.05 sec)

mysql> insert into Payment values('11989811','3333_pi','2022-02-21');
Query OK, 1 row affected (0.05 sec)

mysql> select * from Payment;
+------------+-------------+------------+
| Payment_ID | customer_ID | Date       |
+------------+-------------+------------+
| 11989811   | 3333_pi     | 2022-02-21 |
+------------+-------------+------------+
1 row in set (0.00 sec)

mysql> insert into Trans_Report values('1000001','3333_pi','A002','123','11989811');
Query OK, 1 row affected (0.16 sec)

mysql> select * from Trans_Report;
+-----------+-------------+----------+-------------+------------+
| report_ID | customer_ID | Order_ID | Products_ID | Payment_ID |
+-----------+-------------+----------+-------------+------------+
| 1000001   | 3333_pi     | A002     | 123         | 11989811   |
+-----------+-------------+----------+-------------+------------+
1 row in set (0.00 sec)

show tables ;
##########################################
#Roles:
#	DBMS		Complete authority
#	seller		Authority over tables that are related to customer, payment, transaction
#	customer			Can only see data and buy product

# Users creation

#drop user 'mathur'@'localhost' , 'dubey'@'localhost', 'singh'@'localhost';

CREATE USER 'mathur'@'localhost' IDENTIFIED BY 'mathur' ;
CREATE USER 'dubey'@'localhost' IDENTIFIED BY 'dubey' ;
CREATE USER 'singh'@'localhost' IDENTIFIED BY 'singh' ;

#Seller
GRANT create,drop,insert,update select  ON OSS  TO 'singh'@'localhost' with grant option ;

#DBMS
GRANT select, insert, update, delete ON OSS TO 'mathur'@'localhost' ;

#Customer
GRANT select   ON OSS TO 'dubey'@'localhost' ;
