SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = SHA2('My secret passphrase',512);

DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `emp`;
DROP TABLE IF EXISTS `position`;
DROP TABLE IF EXISTS `division`;
DROP TABLE IF EXISTS `initb`;


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
      
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = SHA2('My secret passphrase',512);
SET @init_vector_x = 'select init_vector from initb';
SET @crypt_str = AES_ENCRYPT('wanchai',@key_str,@init_vector_x);

INSERT INTO `users` (username,password,Emp_Code) value 
	('chai',(select hex(AES_ENCRYPT('wanchai',@key_str,@init_vector_x))),'2435'),
    ('wanchai',(select hex(AES_ENCRYPT('fuangmali',@key_str,@init_vector_x))),'2435');

