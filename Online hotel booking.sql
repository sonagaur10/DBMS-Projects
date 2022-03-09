
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
9 rows in set (11.52 sec)

mysql> create database MyHotelBooking;
Query OK, 1 row affected (7.99 sec)

mysql> create table Room( Room_ID char(3) primary key,Room_Type enum('Deluxe','Semi Deluxe','Normal'), Charges_per_room int(5));
ERROR 1046 (3D000): No database selected
mysql> use MyHotelBooking;
Database changed
mysql> create table Room( Room_ID char(3) primary key,Room_Type enum('Deluxe','Semi Deluxe','Normal'), Charges_per_room int(5));
Query OK, 0 rows affected, 1 warning (9.97 sec)

mysql> create table Customer( Customer_PNR char(8) primary key,Customer_Name varchar(20) not null,Customer_contact char(10) not null,Customer_Email varchar(15))
;
Query OK, 0 rows affected (4.88 sec)

mysql> create table Hotel( Hotel_ID char(5) primary key,Hotel_Name varchar(30) not null, Hotel_Address varchar(100) not null, Hotel_Email varchar(20),Hotel_Contact char(10) not null, CheckIN_Time time not null,CheckOUT_Time time not null);
Query OK, 0 rows affected (0.50 sec)

mysql> create table Booking( Booking_ID char(15) primary key,Customer_PNR char(8), Hotel_ID char(5), Booking_Date date not null, Booking_time time not null,CheckOUT_Date date not null, CheckIN_Date date not null, constraint a_greater check(CheckOUT_Date>CheckIN_Date),Guests int(1), Meal_Plan enum('Room only','Room with
 Breakfast'), foreign key(Customer_PNR) references Customer (Customer_PNR),foreign key (Hotel_ID) references Hotel(Hotel_ID));
Query OK, 0 rows affected, 1 warning (0.82 sec)

mysql> create table Booking_Room(Booking_ID char(15) not null,Room_ID char(3) not null,Room_Qty int(2), primary key(Booking_ID,Room_ID),foreign key(Booking_ID) references Booking (Booking_ID),foreign key (Room_ID) references Room(Room_ID));
Query OK, 0 rows affected, 1 warning (4.63 sec)

mysql> desc Booking;
+---------------+-------------------------------------------+------+-----+---------+-------+
| Field         | Type                                      | Null | Key | Default | Extra |
+---------------+-------------------------------------------+------+-----+---------+-------+
| Booking_ID    | char(15)                                  | NO   | PRI | NULL    |       |
| Customer_PNR  | char(8)                                   | YES  | MUL | NULL    |       |
| Hotel_ID      | char(5)                                   | YES  | MUL | NULL    |       |
| Booking_Date  | date                                      | NO   |     | NULL    |       |
| Booking_time  | time                                      | NO   |     | NULL    |       |
| CheckOUT_Date | date                                      | NO   |     | NULL    |       |
| CheckIN_Date  | date                                      | NO   |     | NULL    |       |
| Guests        | int                                       | YES  |     | NULL    |       |
| Meal_Plan     | enum('Room only','Room with\n Breakfast') | YES  |     | NULL    |       |
+---------------+-------------------------------------------+------+-----+---------+-------+
9 rows in set (7.50 sec)

mysql> desc Hotel;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| Hotel_ID      | char(5)      | NO   | PRI | NULL    |       |
| Hotel_Name    | varchar(30)  | NO   |     | NULL    |       |
| Hotel_Address | varchar(100) | NO   |     | NULL    |       |
| Hotel_Email   | varchar(20)  | YES  |     | NULL    |       |
| Hotel_Contact | char(10)     | NO   |     | NULL    |       |
| CheckIN_Time  | time         | NO   |     | NULL    |       |
| CheckOUT_Time | time         | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> desc Customer;
+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| Customer_PNR     | char(8)     | NO   | PRI | NULL    |       |
| Customer_Name    | varchar(20) | NO   |     | NULL    |       |
| Customer_contact | char(10)    | NO   |     | NULL    |       |
| Customer_Email   | varchar(15) | YES  |     | NULL    |       |
+------------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc Room;
+------------------+---------------------------------------+------+-----+---------+-------+
| Field            | Type                                  | Null | Key | Default | Extra |
+------------------+---------------------------------------+------+-----+---------+-------+
| Room_ID          | char(3)                               | NO   | PRI | NULL    |       |
| Room_Type        | enum('Deluxe','Semi Deluxe','Normal') | YES  |     | NULL    |       |
| Charges_per_room | int                                   | YES  |     | NULL    |       |
+------------------+---------------------------------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> desc Booking_Room;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| Booking_ID | char(15) | NO   | PRI | NULL    |       |
| Room_ID    | char(3)  | NO   | PRI | NULL    |       |
| Room_Qty   | int      | YES  |     | NULL    |       |
+------------+----------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into Hotel values('19342','Shyam Regency','001 NARKANDA IN','oyohotels@oyorooms','1244588630','12:30','11');
Query OK, 1 row affected (0.06 sec)

mysql> Select * from Hotel;
+----------+---------------+-----------------+--------------------+---------------+--------------+---------------+
| Hotel_ID | Hotel_Name    | Hotel_Address   | Hotel_Email        | Hotel_Contact | CheckIN_Time | CheckOUT_Time |
+----------+---------------+-----------------+--------------------+---------------+--------------+---------------+
| 19342    | Shyam Regency | 001 NARKANDA IN | oyohotels@oyorooms | 1244588630    | 12:30:00     | 00:00:11      |
+----------+---------------+-----------------+--------------------+---------------+--------------+---------------+
1 row in set (0.00 sec)

mysql> insert into Hotel values('19342','Shyam Regency','001 NARKANDA IN','oyohotels@oyorooms','1244588630','12:30','11:00');
ERROR 1062 (23000): Duplicate entry '19342' for key 'Hotel.PRIMARY'
mysql> insert into Hotel values('19348','Shyam Regency','001 NARKANDA IN','oyohotels@oyorooms','1244588630','12:30','11:00');
Query OK, 1 row affected (0.12 sec)

mysql> Select * from Hotel;
+----------+---------------+-----------------+--------------------+---------------+--------------+---------------+
| Hotel_ID | Hotel_Name    | Hotel_Address   | Hotel_Email        | Hotel_Contact | CheckIN_Time | CheckOUT_Time |
+----------+---------------+-----------------+--------------------+---------------+--------------+---------------+
| 19342    | Shyam Regency | 001 NARKANDA IN | oyohotels@oyorooms | 1244588630    | 12:30:00     | 00:00:11      |
| 19348    | Shyam Regency | 001 NARKANDA IN | oyohotels@oyorooms | 1244588630    | 12:30:00     | 11:00:00      |
+----------+---------------+-----------------+--------------------+---------------+--------------+---------------+
2 rows in set (0.00 sec)

mysql> insert into Booking values('NH7402745323552','62504526','19342','2019-01-26','17:06','2019-01-10','2019-01-12',4,'Room only');
ERROR 3819 (HY000): Check constraint 'a_greater' is violated.
mysql> insert into Booking values('NH7402745323552','62504526','19342','2019-01-26','17:06','2019-01-12','2019-01-10',4,'Room only');
Query OK, 1 row affected (0.13 sec)

show tables ;
##########################################
#Roles:
#	service provider			Complete authority
#	hotel		Authority over tables that are related to booking, hotel and room
#	customer			Can only see data and do bookings


# Users creation

#drop user 'regency'@'localhost' , 'MMT'@'localhost', 'gaur'@'localhost', 'pratap'@'localhost'  ;

CREATE USER 'regency'@'localhost' IDENTIFIED BY 'regency' ;
CREATE USER 'MMT'@'localhost' IDENTIFIED BY 'MMT' ;
CREATE USER 'gaur'@'localhost' IDENTIFIED BY 'gaur' ;
CREATE USER 'pratap'@'localhost' IDENTIFIED BY 'pratap' ;


#Service Provider
GRANT create,drop, select  ON library.*  TO 'MMT'@'localhost' with grant option ;

#Hotel
GRANT select, insert, update, delete ON OHB TO 'regency'@'localhost' ;

#Customer
GRANT select   ON OHB TO 'gaur'@'localhost' ;
GRANT select   ON OHB TO 'pratap'@'localhost' ;


