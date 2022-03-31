USE master
GO 
IF OBJECT_ID('WEBBANHANG') IS NOT NULL
DROP DATABASE WEBBANHANG
GO
CREATE DATABASE WEBBANHANG
GO
USE WEBBANHANG
GO
CREATE TABLE [Role] (
  [id] int IDENTITY(1,1) PRIMARY KEY ,
  [name] nvarchar(30)
)
GO

CREATE TABLE [Users] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [fullname] nvarchar(30),
  [email] nvarchar(50),
  [phone_number] nvarchar(15),
  [address] nvarchar(255),
  [password] nvarchar(35),
  [role_id] int,
  [created_at] datetime,
  [updated_at] datetime,
  [deleted] int
)
GO

CREATE TABLE [Category] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [name] nvarchar(30)
)
GO

CREATE TABLE [Product] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [category_id] int,
  [title] nvarchar(60),
  [price] float,
  [discount] float,
  [thumbnail] varchar(255),
  [description] nvarchar(500),
  [created_at] datetime,
  [updated_at] datetime,
  [deleted] int
)
GO

CREATE TABLE [Galery] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [product_id] int,
  [thumbnail] varchar(255)
)
GO

CREATE TABLE [Feedback] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [fullname] nvarchar(30),
  [email] nvarchar(50),
  [phone_number] nvarchar(15),
  [subject_name] nvarchar(50),
  [notes] nvarchar(500)
)
GO

CREATE TABLE [Oders] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [users_id] int,
  [fullname] nvarchar(30),
  [email] nvarchar(50),
  [phone_number] nvarchar(15),
  [address] nvarchar(255),
  [note] nvarchar(500),
  [order_date] datetime,
  [status] int,
  [total_money] float
)
GO

CREATE TABLE [Order_Details] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [order_id] int,
  [product_id] int,
  [price] float,
  [number] int,
  [total_money] float
)
GO

ALTER TABLE [Users] ADD FOREIGN KEY ([role_id]) REFERENCES [Role] ([id])
GO

ALTER TABLE [Oders] ADD FOREIGN KEY ([users_id]) REFERENCES [Users] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([category_id]) REFERENCES [Category] ([id])
GO

ALTER TABLE [Order_Details] ADD FOREIGN KEY ([product_id]) REFERENCES [Product] ([id])
GO

ALTER TABLE [Galery] ADD FOREIGN KEY ([product_id]) REFERENCES [Product] ([id])
GO

ALTER TABLE [Order_Details] ADD FOREIGN KEY ([order_id]) REFERENCES [Oders] ([id])
GO

insert into Role (name) values('admin'),('user');

insert into [Users] (fullname,email,phone_number,address,password,role_id,created_at,updated_at,deleted)
values(N'Nguyễn Hoàng Hải','nguyenhoanghai050702@gmail.com',N'TP Cam Ranh','0346135364','haidz57',2,'2021/11/07','2021/11/09',2),
(N'Nguyễn Hoàng Hải','nguyenhoanghai0507@gmail.com',N'TP Cam Ranh','0346135365','haidz57',1,'2021/11/07','2021/11/09',2),
(N'Hoàng Văn Trung','hoangvantrung@gmail.com',N'TP Đà Nẵng','0264358756','hvtrung',2,'2021/11/07','2021/11/09',2),
(N'Trần Trọng Hữu Phước','trantronghuuphuoc@gmail.com',N'TP Cam Ranh','0463254254','phuoctt',2,'2021/11/07','2021/11/09',2),
(N'Đinh Văn Tiến','dinhvantien@gmail.com',N'TP HCM','0354621876','tienpronhe',2,'2021/11/07','2021/11/09',2);

insert into category (name) values('SHIRT'),('T-SHIRT'),('SWEATERS'),('SHORTS'),('PANTS'),('SLIPPERS'),('BOOTS'),('BLAZER'),('BOOMER'),('LEATHER');

insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
 values	(1,N'Oversew Shirt',150000,0.1,'s10.png',N'Áo sơ mi cao cấp, sành điệu','2021/11/07',null,1),
		(1,N'Icon Shirt',350000,0.2,'s11.png',N'Áo sơ mi cao cấp, lịch lãm , mát mẻ','2021/11/07',null,1),
		(1,N'Oversew Shirt',250000,0.2,'s12.jpg',N'Khoác con áo này lên trên mình bạn sẽ trở thành tâm điểm giữa đám đông','2021/11/07',null,1),
		(1,N'Pocker 2022 Shirt',150000,0.1,'s13.png',N'Thần bài sẽ phù hộ bạn','2021/11/07',null,1),
		(1,N'Scorched Flame',450000,0.2,'s14.png',N'Phong cách thì không cần nói nhiều','2021/11/07',null,1),
		(1,N'Ruku Shirt',150000,0.1,'s15.jpeg',N'Áo sơ mi cao cấp, sành điệu','2021/11/07',null,1),
		(1,N'Old Horse Shirt',350000,0.2,'s16.jpg',N'Áo sơ mi cao cấp, lịch lãm , mát mẻ','2021/11/07',null,1),
		(1,N'Demon Shirt',350000,0.3,'s17.jpg',N'Quái thú bóng đêm','2021/11/07',null,1),
		(1,N'Fatcap Shirt',150000,0.1,'s18.jpg',N'Áo thun vải cao cấp','2021/11/07',null,1),
		(1,N'MENDE CLUB',350000,0.3,'s19.jpg',N'Cái tên nói lên tất cả','2021/11/07',null,1);
		
		
/*		(1,N'Record Shirt',380000,0.1,'',N'Lưu trữ những khoảng khắc','2021/11/07',null,1),
		(1,N'Celeb Shirt',350000,0.2,null,N'Áo sơ mi cao cấp, lịch lãm , mát mẻ','2021/11/07',null,1),
		(1,N'Hawaii Shirt',380000,0.4,null,N'Mang lại cảm giác mát nhẻ năng động','2021/11/07',null,1),
		(1,N'Square Sky Shirt - Pink',380000,0.1,null,N'Yêu màu hồng ghét sự giả dối','2021/11/07',null,1),
		(1,N'Square Sky Shirt - Blue',390000,0.5,null,N'Mát mẻ của trời đất','2021/11/07',null,1),
		(1,N'Square Sky Shirt - Gray',390000,0.1,null,N'Áo sơ mi cao cấp, sành điệu','2021/11/07',null,1),
		(1,N'Scorched Flame Shirt',270000,0.2,null,N'Áo sơ mi cao cấp, lịch lãm , mát mẻ','2021/11/07',null,1),
		(1,N'Snowtain Shirt',350000,0.3,null,N'Mùa đông không lạnh','2021/11/07',null,1),
		(1,N'Celeb Shirt',350000,0.3,null,N'Áo sơ mi cao cấp','2021/11/07',null,1),
		(1,N'Vintage Shirt',450000,0.1,null,N'Áo thun vải cao cấp , mát mẻ và dày , vải dày','2021/11/07',null,1)
*/



insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
  values(2,N'Áo thun trơn',1500000,0.1,'t2.jpg',N'Áo thun trơn mát mẻ','2021/11/07',null,1),
		(2,N'DIRTYCOINS INSIDE OUT T-SHIRT - GREY',150000,0.1,'t3.jpg',N'Áo thun trơn mát mẻ','2021/11/07',null,1),
		(2,N'DICO MATE T-SHIRT - WHITE',350000,0.2,'t4.jpg',N'Áo thun vải cao cấp, lịch lãm','2021/11/07',null,1),
		(2,N'Earth Tee',250000,0.2,'t5.jpg',N'Áo len vải dày dặn','2021/11/07',null,1),
		(2,N'Fatcap Tee',150000,0.1,'t6.jpg',N'Áo thun vải cao cấp','2021/11/07',null,1),
		(2,N'Mini Printed Tee',450000,0.2,'t7.jpg',N'Áo thun vải cao cấp , mát mẻ và dày , vải dày','2021/11/07',null,1),
		(2,N'The Tower tee',150000,0.1,'t8.jpg',N'Áo thun trơn mát mẻ','2021/11/07',null,1),
		(2,N'Racing Tee',350000,0.2,'t9.jpg',N'Áo thun vải cao cấp, lịch lãm','2021/11/07',null,1),
		(2,N'Patch Washed Tee',350000,0.3,'t10.jpg',N'Áo len vải dày dặn','2021/11/07',null,1),
		(2,N'Deathband Tee',150000,0.1,'t11.jpg',N'Áo thun vải cao cấp','2021/11/07',null,1),
		(2,N'The Egg Tee',350000,0.3,'t12.jpg',N'Áo thun vải cao cấp , mát mẻ và dày , vải dày','2021/11/07',null,1);
		


/*		(2,N'TW',380000,0.1,null,N'Áo thun trơn mát mẻ','2021/11/07',null,1),
		(2,N'PoloW',350000,0.2,null,N'Áo thun vải cao cấp, lịch lãm','2021/11/07',null,1),
		(2,N'LongSleeve RC2',380000,0.4,null,N'Áo len vải dày dặn','2021/11/07',null,1),
		(2,N'LongSleeve RC1',380000,0.1,null,N'Áo thun vải cao cấp','2021/11/07',null,1),
		(2,N'Horse Club Black',390000,0.5,null,N'Áo thun vải cao cấp , mát mẻ và dày , vải dày','2021/11/07',null,1),
		(2,N'Horse Club White',390000,0.1,null,N'Áo thun trơn mát mẻ','2021/11/07',null,1),
		(2,N'BCS White',270000,0.2,null,N'Áo thun vải cao cấp, lịch lãm','2021/11/07',null,1),
		(2,N'Skull Black',350000,0.3,null,N'Áo len vải dày dặn','2021/11/07',null,1),
		(2,N'Long Beach White',350000,0.3,null,N'Áo thun vải cao cấp','2021/11/07',null,1),
		(2,N'The Egg Tee',450000,0.1,null,N'Áo thun vải cao cấp , mát mẻ và dày , vải dày','2021/11/07',null,1),

		(3,N'Áo len dài tay',250,0.1,null,N'Áo len vải dày dặn','2021/11/07',null,1),

		(4,N'Quần short cao cấp',150,0.1,null,N'Quần short cao cấp','2021/11/07',null,1),

		(5,N'Quần âu phong cách đàn ông',450,0.1,null,N'Quần âu phong cách, vải dày','2021/11/07',null,1)

*/

insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
  values(3,N'Áo Sweater Baguette',1500000,0.1,'h1.jpg',N'áo mùa đông ấm áp ','2021/11/07',null,1),
		(3,N'Áo Sweater Form Rộng',150000,0.1,'h4.jpg',N'áo mùa đông ấm áp','2021/11/07',null,1),
		(3,N'Áo Sweater FRED',350000,0.2,'h5.jpg',N'áo mùa đông ấm áp','2021/11/07',null,1),
		(3,N'Áo Sweater BERE',250000,0.2,'h6.jpg',N'Áo len vải dày dặn','2021/11/07',null,1),
		(3,N'Áo Sweater UNI',150000,0.1,'h7.jpg',N'áo mùa đông ấm áp','2021/11/07',null,1),
		(3,N'Áo Sweater ICCON',450000,0.2,'h8.jpg',N'áo mùa đông ấm áp, vải dày','2021/11/07',null,1),
		(3,N'Áo Sweater ADLV',150000,0.1,'h9.jpg',N'áo mùa đông ấm áp','2021/11/07',null,1),
		(3,N'Áo Sweater BLUE',350000,0.2,'s3.jpg',N'áo mùa đông ấm áp','2021/11/07',null,1),
		(3,N'Áo Sweater TFM',350000,0.3,'s2.jpg',N'Áo len vải dày dặn','2021/11/07',null,1),
		(3,N'Áo Sweater COZY CLUB',150000,0.1,'s1.jpg',N'áo mùa đông ấm áp cao cấp','2021/11/07',null,1),
		(3,N'Áo Sweater YOAA',350000,0.3,'sw10.png',N'áo mùa đông ấm áp vải dày','2021/11/07',null,1);

insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
  values(4,N'Quần short 7millions Essentials - Màu tan',1500000,0.1,'sh1.jpg',N'Đi kèm túi xẻ 2 bên hông cực kì tiện lợi và phong cách phù hợp mặc mọi mùa, mọi hoàn cảnh ','2021/11/07',null,1),
		(4,N'Quần short 7millions Essentials - Màu xám',150000,0.1,'sh2.jpg',N'Đi kèm túi xẻ 2 bên hông cực kì tiện lợi và phong cách phù hợp mặc mọi mùa, mọi hoàn cảnh ','2021/11/07',null,1),
		(4,N'Quần short 7millions Essentials - Màu đen',350000,0.2,'sh3.jpg',N'Đi kèm túi xẻ 2 bên hông cực kì tiện lợi và phong cách phù hợp mặc mọi mùa, mọi hoàn cảnh ','2021/11/07',null,1);
		
insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
  values(5,N'Brownie Cargo Pant',4500000,0.1,'p1.jpg',N'Quần dài phong cách mặt cười','2021/11/07',null,1),
		(5,N'Cargo Pant',450000,0.1,'p2.jpeg',N'Quần dài đen thời thượng phong cách','2021/11/07',null,1),
		(5,N'MENDE ROCK N ROLL PANT',350000,0.2,'p3.png',N'Dân chơi uy tín','2021/11/07',null,1);
		

insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
  values(6,N'SLIPPER Cargo ',4500000,0.1,'sl1.jpg',N'Nâng niu bàn chân ','2021/11/07',null,1),
		(6,N'SLIPPER Pant',450000,0.1,'sl2.jpg',N'Nâng niu bàn chân','2021/11/07',null,1),
		(6,N'SLIPPER N ROLL ',350000,0.2,'sl3.jpg',N'Nâng niu bàn chân','2021/11/07',null,1),
		(6,N'SLIPPER N ACS ',350000,0.2,'sl4.jpg',N'Nâng niu bàn chân','2021/11/07',null,1);
		
insert into product (category_id,title, price, discount,  thumbnail, description, created_at, updated_at, deleted) 
  values(7,N'Saint Laurent Wyatt Almond Toe Harness Boots',3000000,0.1,'b1.jpg',N'Nâng niu bàn chân ','2021/11/07',null,1),
		(7,N'Saint Laurent Wyatt Harness Detailed Ankle Boots',3000000,0.1,'b2.jpg',N'Nâng niu bàn chân','2021/11/07',null,1),
		(7,N'Saint Laurent Wyatt Beige Boots',2500000,0.2,'b3.jpg',N'Nâng niu bàn chân','2021/11/07',null,1);

insert into Galery (product_id,thumbnail) 
values(1,'s10.png'),(1,'s10.1.jpg'),(1,'s10.2.jpg'),
(2,'s11.png'),(2,'s11.1.jpg'),(2,'s11.2.jpg'),
(3,'s12.jpg'),(3,'s12.1.jpg'),(3,'s12.2.jpg'),
(4,'s13.png'),(4,'s13.1.jpg'),(4,'s13.2.jpg'),
(5,'s14.png'),(5,'s15.1.jpg'),(5,'s15.2.jpg'),
(6,'s15.jpeg'),(6,'s15.1.jpg'),(6,'s15.2.jpg'),
(7,'s16.jpg'),(7,'s16.1.jpg'),(7,'s16.2.jpg'),
(8,'s17.jpg'),(8,'s17.1.jpg'),(8,'s17.2.jpg'),
(9,'s18.jpg'),(9,'s18.1.jpg'),(9,'s18.2.jpg'),
(10,'s19.jpg'),(10,'s19.1.jpg'),(10,'s19.2.jpg'),
(11,'t2.jpg'),(11,'t2.1.jpg'),(11,'t2.2.jpg'),
(12,'t3.jpg'),(12,'t3.1.jpg'),(12,'t3.2.jpg'),
(13,'t4.jpg'),(13,'t4.1.jpg'),(13,'t4.2.jpg'),
(14,'t5.jpg'),(14,'t5.1.jpg'),(14,'t5.2.jpg'),
(15,'t6.jpg'),(15,'t6.1.jpg'),(15,'t6.2.jpg'),
(16,'t7.jpg'),(16,'t7.1.jpg'),(16,'t7.2.jpg'),
(17,'t8.jpg'),(17,'t8.1.jpg'),(17,'t8.2.jpg'),
(18,'t9.jpg'),(18,'t9.1.jpg'),(18,'t9.2.jpg'),
(19,'t10.jpg'),(19,'t10.1.jpg'),(19,'t10.2.jpg'),
(20,'t11.jpg'),(20,'t11.1.jpg'),(20,'t11.2.jpg'),
(21,'t12.jpg'),(21,'t12.1.jpg'),(21,'t12.2.jpg'),
(22,'h1.jpg'),(22,'h1.1.jpg'),(22,'h1.2.jpg'),
(23,'h4.jpg'),(23,'h4.1.jpg'),(23,'h4.2.jpg'),
(24,'h5.jpg'),(24,'h5.1.jpg'),
(25,'h6.jpg'),(25,'h6.1.jpg'),(25,'h6.2.jpg'),
(26,'h7.jpg'),(26,'h7.1.jpg'),(26,'h7.2.jpg'),
(27,'h8.jpg'),(27,'h8.1.jpg'),(27,'h8.2.jpg'),
(28,'h9.jpg'),(28,'h9.2.jpg'),
(29,'s3.jpg'),(29,'s3.6.jpg'),(29,'s3.5.jpg'),
(30,'s2.jpg'),(30,'s2.7.jpg'),(30,'s2.3.jpg'),
(31,'s1.jpg'),(31,'s1.2.jpg'),(31,'s1.3.jpg'),
(32,'sw10.png'),(32,'sw10.1.png'),(32,'sw10.2.png'),

(33,'sh1.jpg'),(33,'sh1.1.jpg'),(33,'sh1.2.jpg'),
(34,'sh2.jpg'),(34,'sh2.1.jpg'),(34,'sh2.2.jpg'),
(35,'sh3.jpg'),(35,'sh3.1.jpg'),(35,'sh3.2.jpg'),
(36,'p1.jpg'),(36,'p1.1.jpeg'),(36,'p1.2.jpeg'),
(37,'p2.jpeg'),(37,'p2.1.jpeg'),(37,'p2.2.jpeg'),
(38,'p3.png'),(38,'p3.1.jpg'),
(39,'sl1.jpg'),(39,'sl1.1.jpg'),(39,'sl1.2.jpg'),
(40,'sl2.jpg'),(40,'sl2.1.jpg'),(40,'sl2.2.jpg'),
(41,'sl3.jpg'),(41,'sl3.1.jpg'),(41,'sl3.2.jpg'),
(42,'sl4.jpg'),(42,'sl4.1.jpg'),(42,'sl4.2.jpg'),
(43,'b1.jpg'),(43,'b1.1.jpg'),(43,'b1.2.jpg'),
(44,'b2.jpg'),(44,'b2.1.jpg'),(44,'b2.2.jpg'),
(45,'b3.jpg'),(45,'b3.1.jpg'),(45,'b3.2.jpg')

insert into [Oders] (users_id,fullname,email,phone_number,address,note,order_date,status,total_money)
values(2,N'Nguyễn Hoàng Hải','nguyenhoanghai0507@gmail.com','0346135365',N'TP Cam Ranh',N'giao vào giờ hành chính','2021/01/09',1,225),
(3,N'Hoàng Văn Trung','hoangvantrung@gmail.com','0264358756',N'TP Đà Nẵng',N'giao vào giờ hành chính','2021/01/09',1,225),
(4,N'Trần Trọng Hữu Phước','trantronghuuphuoc@gmail.com','0463254254',N'TP Cam Ranh',N'giao vào giờ hành chính','2021/01/09',1,135),
(5,N'Đinh Văn Tiến','dinhvantien@gmail.com','0354621876',N'TP HCM',N'giao vào giờ hành chính','2021/01/09',1,405)

insert into Order_Details (order_id,product_id,price,number,total_money)
values(1,2,255,1,255),(2,3,255,1,255),
(3,4,135,1,135),(4,5,405,1,405)

/*
select * from category;
select * from product;
select * from Users;

select * from Role;
select * from Galery;
select * from product;

select * from Oders;
*/
select * from Order_Details;
select * from Oders;