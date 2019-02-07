use ing;
SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = SHA2('My secret passphrase',512);


DROP TABLE IF EXISTS `target`;
DROP table if exists `vstecsyear`;
DROP TABLE IF EXISTS `product_on_hand`;
DROP TABLE IF EXISTS `product_on_brand`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `brand`;

DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `emp`;
DROP TABLE IF EXISTS `position`;
DROP TABLE IF EXISTS `division`;
DROP TABLE IF EXISTS `initb`;
DROP TABLE IF EXISTS `datain`;


CREATE TABLE IF NOT EXISTS `initb` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `init_vector` BINARY(16),
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;
SET @init_vector = RANDOM_BYTES(16);
INSERT INTO `initb` (init_vector) value (@init_vector);

CREATE TABLE IF NOT EXISTS `position` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Name` varchar(100),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `division` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Name` varchar(100),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `emp` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Emp_Code` varchar (4) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `Position_id` MEDIUMINT,
  `Division_id` MEDIUMINT,
  `Thai_name` varchar(200),
  `bcount` int NOT NULL DEFAULT '1',
  `Extend` JSON,
  `Start_date` datetime,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (Position_id)
      REFERENCES ing.position(id)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  
  FOREIGN KEY (Division_id)
      REFERENCES ing.division(id)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  
  INDEX (Emp_Code,Name), 
  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `users` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `username` varchar(100),
  `password` varchar(100),
  `Emp_Code` varchar (4) NOT NULL,
  `Start_date` datetime,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (Emp_Code)
      REFERENCES ing.emp(Emp_Code)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  UNIQUE (username),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `brand` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(100),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (name),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `product` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(100),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (name),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;


CREATE TABLE IF NOT EXISTS `vstecsyear` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(100),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (name),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;


CREATE TABLE IF NOT EXISTS `target` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `product_id` MEDIUMINT NOT NULL,
  `year_id` MEDIUMINT NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Target_s1` DECIMAL(15,2) NOT NULL DEFAULT '0', 
  `Target_s2` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s3` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s4` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s5` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s6` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s7` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s8` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s9` DECIMAL(15,2) NOT NULL DEFAULT '0',  
  `Target_s10` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s11` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_s12` DECIMAL(15,2) NOT NULL DEFAULT '0', 
  `Target_g1` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g2` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g3` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g4` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g5` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g6` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g7` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g8` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g9` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g10` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g11` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Target_g12` DECIMAL(15,2) NOT NULL DEFAULT '0',
  FOREIGN KEY (product_id)
      REFERENCES ing.product(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (year_id)
      REFERENCES ing.vstecsyear(id)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  UNIQUE (product_id,year_id),    
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `product_on_brand` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `product_id` MEDIUMINT NOT NULL,
  `brand_id` MEDIUMINT NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (product_id)
      REFERENCES ing.product(id)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  
  FOREIGN KEY (brand_id)
      REFERENCES ing.brand(id)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

CREATE TABLE IF NOT EXISTS `product_on_hand` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `product_id` MEDIUMINT,
  `Emp_Code` varchar (4),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (product_id)
      REFERENCES ing.product(id)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
  
  FOREIGN KEY (Emp_Code)
      REFERENCES ing.emp(Emp_Code)
      ON UPDATE CASCADE ON DELETE RESTRICT, 
      
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;


CREATE TABLE IF NOT EXISTS `datain` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) ,
  `Invoice_Code` varchar(100),
  `Invoice_Date` datetime,
  `Brand_Name` varchar(100),
  `Product_Code` varchar(100),
  `Qty` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Unit_Price` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Price_Before_Discount` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Price_After_Discount` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `GP` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `GP_Before_Disc` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Cost` DECIMAL(15,2) NOT NULL DEFAULT '0',
  `Price_qxu` DECIMAL(15,2) as (`Qty`*`Unit_Price`),
  `GP_cal` DECIMAL(15,2) as (`Price_After_Discount`-`Cost`),
  `GP_Before_Disc_cal` DECIMAL(15,2) as (`Price_Before_Discount`-`Cost`),
  `Currency` varchar(100) NOT NULL DEFAULT 'Thai Baht',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,      
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;


INSERT INTO `position` (id,Name) value 
	(7,'Technical Manager'),
    (6,'Pre-sales Engineer Professional 2'),
    (5,'Pre-sales Engineer Professional 1'),
    (4,'Senior Pre-sales Engineer'),
    (3,'Pre-sales Engineer 2'),
    (2,'Pre-sales Engineer 1'),
    (1,'Pre-sales Engineer')
;

INSERT INTO `division` (Name) value 
	('Enterprise Systems');

INSERT INTO `emp` (
	Emp_Code,Name,Surname,Position_id,Division_id,Thai_name,Start_date
) value 
  ('2467','Pongjakr','Hiranpiyawit',7,1,'พงศ์จักร  หิรัญปิยวิทย์ (แซท)','2017-06-1 00:00:00'),
  ('2018','Sirichate','Thawornsuk',4,1,'ศิริเชษฐ์  ถาวรสุข (เชษฐ์) ','2017-06-1 00:00:00'),
  ('2452','Thanetrat','Suphapakorn',6,1,'ธเนศรัตน์ ศุภภากร (เหียน)','2017-01-1 00:00:00'),
  ('2214','Worapan','Kosalwat',2,1,'วรพรรณ  โกศัลวัฒน์  (ฝ้าย)','2017-01-1 00:00:00'),
  ('2516','Nuttapon','Thirapiwat',1,1,'ณัฐพล ถิราภิวัฒน์ (แมน)','2017-01-1 00:00:00'),
  ('2489','Wuttichai','Wongampornpisit',3,1,'วุฒิชัย วงศ์อัมพรพิสิฐ (ตาว)','2017-01-1 00:00:00'),
  ('2457','Phanupun','Yamklib',2,1,'ภาณุพันธ์  แย้มกลีบ (คิม)','2017-01-1 00:00:00'),
  ('1730','Chalermporn','Buntalar',4,1,'เฉลิมพร  บุญตาหล้า (เอ) ','2017-01-1 00:00:00'),
  ('1877','Tanakiat','Waradetjumroen',2,1,'ธนเกียรติ   วรเดชจำเริญ  (บอส)','2017-01-1 00:00:00'),
  ('2149','Arnon','Chetsadapongpakdee',2,1,'อานนท์ เจษฎาพงศ์ภักดี (เอก)','2017-01-1 00:00:00'),
  ('2460','Watchara','Prasittiwiset',5,1,'วัชระ  ประสิทธิวิเศษ (ฟิน)','2017-01-1 00:00:00'),
  ('2481','Tanatip','Boonyakida',4,1,'ธนธิป บุณยกิดา (ท็อป)','2017-01-1 00:00:00'),
  ('1905','Yuttapon','Paitoonrungsalit',3,1,'ยุทธพล ไพฑูรย์รังสฤษดิ์ (ต็อป)','2017-01-1 00:00:00'),
  ('2555','Kanaet','Sirimayurachart',3,1,'คเณศ ศิริมยุรฉัตร  (แฟล็ซ)','2017-01-1 00:00:00'),
  ('2528','Puttipong','Singkharach',3,1,'พุฒิพงศ์ สิงฆราช (เอ็ม)','2017-01-1 00:00:00'),  
  ('2561','Panu','Putjaroen',1,1,'ภาณุ พุตเจริญ (แจ้)','2017-01-1 00:00:00'),
  ('2741','Yodying','Laksameekarnkhar',2,1,'ยอดยิ่ง ลักษมีการค้า (ยอด)','2017-01-1 00:00:00'),
  ('2734','Thavikorn','Vongsayun',6,1,'ฐาวิกรณ์ วงษ์สายันต์   (บีม)','2017-01-1 00:00:00'),  
  ('2435','Wanchai','Fuangmali',5,1,'วันชัย เฟื่องมะลิ ','2017-01-1 00:00:00'),
  ('2780','Natthawut','Saengarunphaisan',3,1,'ณัฐวุฒิ แสงอรุณไพศาล  (แพค)','2017-01-1 00:00:00'),
  ('2817','Netpavee','Siriwichwattana',2,1,'เนตรปวีร์ ศิริวิชญ์วัฒนา (นาว)','2017-01-1 00:00:00')  
;


SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = SHA2('My secret passphrase',512);
SET @init_vector_x = 'select init_vector from initb';
SET @crypt_str = AES_ENCRYPT('wanchai',@key_str,@init_vector_x);

INSERT INTO `users` (username,password,Emp_Code) value 
	('chai',(select hex(AES_ENCRYPT('wanchai',@key_str,@init_vector_x))),'2435'),
    ('wanchai',(select hex(AES_ENCRYPT('fuangmali',@key_str,@init_vector_x))),'2435');

insert into ing.product(`id`,`name`,`desc`) VALUE 
('1', 'Aris', 'Arista Networks'),
('2', 'DOEM', 'Dell IOT & OEM'),
('3', 'DLET', 'D-Link ES'),
('4', 'EMC', 'EMC'),
('5', 'F5', 'F5 Networks'),
('6', 'Fire', 'FireEye'),
('7', 'FPJ', 'Fortinet PJ'),('8', 'FNET', 'Fortinet RR'),
('9', 'FJSS', 'Fujitsu Scanner'),('10', 'FJSV', 'Fujitsu Server'),
('11', 'Hort', 'Hortonworks'),
('12', 'HPUX', 'HPE Unix Server'),('13', '3D', 'HPI Con 3D Printer'),
('14', 'Hua', 'Huawei Enterprise'),
('15', 'OI05', 'Intermec Technologies Corp.'),('18', 'HNW', 'Metrologic'),('35', 'Voco', 'Vocollect Inc.'),
('16', 'Jabr', 'Jabra'),
('17', 'Kas', 'Kaspersky'),
('19', 'Clou', 'Microsoft Cloud'),('20', 'MSCS', 'MS CSP'),
('21', 'NetA', 'NetApp BV'),
('22', 'Nuta', 'Nutanix'),
('23', 'ORL', 'Oracle Corp'),
('24', 'OV08', 'Quest Software'),
('25', 'OR02', 'Red Hat'),
('26', 'Rubr', 'Rubrik Inc.'),
('27', 'SYMT', 'Symantec Cloud Enterprise'),('28', 'SMNT', 'Symantec Enterprise'),
('29', 'VPL', 'Veeam'),
('30', 'VRTS', 'Veritas'),
('31', 'OV05', 'VMWare Inc'),('32', 'VPP', 'VMware VSPP'),
('33', 'XYZ', 'XYZ Printing'),
('34', 'YITU', 'YITU');

insert into ing.product_on_hand(`Emp_Code`,`product_id`)Value 
	('2467',1),('2467',2),('2467',3),('2467',4),('2467',5),('2467',6),('2467',7),('2467',8),('2467',9),('2467',10),('2467',11),('2467',12),('2467',13),
    ('2467',14),('2467',15),('2467',16),('2467',17),('2467',18),('2467',19),('2467',20),('2467',21),('2467',22),('2467',23),('2467',24),('2467',25),('2467',26),
	('2467',27),('2467',28),('2467',29),('2467',30),('2467',31),('2467',32),('2467',33),('2467',34),
	('2018',9),('2018',15),('2018',18),('2018',35),
    ('2452',22),('2214',29),('2214',31),
	('2516',14),('2457',14),('1730',14),('2489',4),
    ('1877',31),('1877',29),
    ('2149',19),('2149',32),('2149',20),('2149',27),('2149',29),
    ('2460',19),('2460',32),('2460',20),('2460',27),('2460',29),
    ('2481',21),('1905',27),('1905',28),('2780',27),('2780',28),
	('2555',30),('2555',31),('2528',4),('2528',30),
    ('2561',7),('2561',8),('2741',5),('2734',1),  
	('2435',23),('2817',23);
   
insert into ing.brand(`id`,`name`)
	 VALUES 
     (1,'Arista'),(2,'Dell'),(3,'EMC'),(4,'F5'),(5,'FireEye'),(6,'Fortinet'),(7,'Fujitsu'),
     (8,'Hortonworks'),(9,'HP'),(10,'Huawei'),(11,'Honewell'),(12,'Jabra'),(13,'Kaspersky'),
     (14,'Microsoft'),(15,'NetApp'),(16,'Nutanix'),(17,'Oracle'),(18,'Quest'),(19,'Red Hat'),(20,'Rubrik'),
     (21,'Symantec'),(22,'Veeam'),(23,'Veritas'),(24,'VMWare'),(25,'XYZ'),(26,'YITU'),(27,'D-Link');
     
insert into ing.product_on_brand(
    `brand_id`,
    `product_id`)
	VALUE
	(1,1),(2,2),(27,3),(3,4),(4,5),(5,6),(6,7),(6,8),(7,9),(7,10),
    (8,11),(9,12),(9,13),(10,14),(11,15),(11,18),(11,35),(12,16),(13,17),
    (14,19),(14,20),(15,21),(16,22),(17,23),(18,24),(19,25),(20,26),(21,27),
    (21,28),(22,29),(23,30),(24,31),(24,32),(25,33),(26,34);
    

