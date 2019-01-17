use rest;
DROP TABLE IF EXISTS `source`;
DROP TABLE IF EXISTS `emp`;
DROP TABLE IF EXISTS `onhand`; 
DROP TABLE IF EXISTS `fat`; 

CREATE TABLE IF NOT EXISTS `fat` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Emp_Code` varchar (4) NOT NULL,
  `Code` varchar(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `Position` varchar(100),
  `Division` varchar(100),
  `Thai_name` varchar(200),
  `Start_date` datetime,
  `Brand_Name` varchar(100) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Sales_Out` DECIMAL(11,2),
  `Target` DECIMAL(11,2),
  `Sale_Achieve` DECIMAL(11,2),
  `Sale_Contribution` DECIMAL(5,2),
  `Total_Cost` DECIMAL(11,2),
  `GP` DECIMAL(11,2),
  `GP_Target` DECIMAL(11,2),
  `GP_Achieve` DECIMAL(11,2),
  `GP_Contribution` DECIMAL(5,2),
  `xGP_Target` DECIMAL(11,2),
  `Avg_GP` DECIMAL(5,2),
  `Breadth` DECIMAL(5,0),
  `i_Achieve` DECIMAL(5,0),
  `i_GP` DECIMAL(5,0),
  `Incentive` DOUBLE AS (i_GP + i_Achieve),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `Session_Code` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;


CREATE TABLE IF NOT EXISTS `onhand` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Emp_Code` varchar (4) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Code` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;


CREATE TABLE IF NOT EXISTS `emp` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Emp_Code` varchar (4) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `Position` varchar(100),
  `Division` varchar(100),
  `Thai_name` varchar(200),
  `bcount` int,
  `Start_date` datetime,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;



CREATE TABLE IF NOT EXISTS `source` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Brand_Name` varchar(100) NOT NULL,
  `Code` varchar(11) NOT NULL,
  `Sales_Out` DECIMAL(11,2),
  `Target` DECIMAL(11,2),
  `Sale_Achieve` DECIMAL(11,2),
  `Sale_Contribution` DECIMAL(5,2),
  `Total_Cost` DECIMAL(11,2),
  `GP` DECIMAL(11,2),
  `GP_Target` DECIMAL(11,2),
  `GP_Achieve` DECIMAL(11,2),
  `GP_Contribution` DECIMAL(5,2),
  `xGP_Target` DECIMAL(11,2),
  `Avg_GP` DECIMAL(5,2),
  `Breadth` DECIMAL(5,0),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `Session_Code` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;



INSERT INTO `emp` (
 `Emp_Code` ,
  `Name` ,
  `Surname` ,
  `Position` ,
  `Division` ,
  `Thai_name`,
  `Start_date`
) VALUES 
  ('2467','Pongjakr','Hiranpiyawit','Technical Manager','Enterprise Systems','พงศ์จักร  หิรัญปิยวิทย์ (แซท)','2017-06-1 00:00:00'),
  ('2018','Sirichate','Thawornsuk','Senior Pre-sales Engineer','Enterprise Systems','ศิริเชษฐ์  ถาวรสุข (เชษฐ์) ','2017-06-1 00:00:00'),
  ('2452','Thanetrat','Suphapakorn','Pre-sales Engineer Professional 2','Enterprise Systems','ธเนศรัตน์ ศุภภากร (เหียน)','2017-01-1 00:00:00'),
  ('2214','Worapan','Kosalwat','Pre-sales Engineer 1','Enterprise Systems','วรพรรณ  โกศัลวัฒน์  (ฝ้าย)','2017-01-1 00:00:00')
;

INSERT INTO `source` (
  `Brand_Name`,
  `Code` ,
  `Sales_Out`,
  `Target` ,
  `Sale_Achieve` ,
  `Sale_Contribution`,
  `Total_Cost` ,
  `GP`,
  `GP_Target` ,
  `GP_Achieve`,
  `GP_Contribution`,
  `xGP_Target`,
  `Avg_GP` ,
  `Breadth`,
  `Session_Code` 
) VALUES 
('Arista Networks','Aris',1365673.46,3841936.81,35.55,0.38,1293202.58,72470.88,230516.20,31.44,0.35,6,5.31,3,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Dell IOT & OEM','DOEM',0,10000000.00,0,0,0,0,300000.00,0,0,3,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('D-Link ES','DLET',266188.00,5000000.00,5.32,0.07,240984.35,25203.65,350000.00,7.2,0.12,7,9.47,14,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('EMC','EMC',17299873.25,14166138.38,122.12,4.77,16096606.46,1203266.79,991654.38,121.34,5.77,7,6.96,6,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('F5 Networks','F5',22821062.00,16000000.00,142.63,6.29,21332665.52,1488396.48,1280000.00,116.28,7.14,8,6.52,3,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('FireEye','Fire',0,1875000.00,0,0,0,0,150000.00,0,0,8,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Fortinet PJ','FPJ',5221300.00,3353577.63,155.69,1.44,5821682.41,-600382.41,311904.03,-192.49,-2.88,9.3,-11.5,19,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Fortinet RR','FNET',3691520.09,10060732.90,36.69,1.02,2438690.92,1252829.17,935712.10,133.89,6.01,9.3,33.94,29,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Fujitsu Scanner','FJSS',29792950.00,10111073.12,294.66,8.21,28883326.00,909624.00,638662.48,142.43,4.36,6.32,3.05,39,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Fujitsu Server','FJSV',0,0,0,0,0,0,0,0,0,0,0,1,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Hortonworks','Hort',14665250.00,2000000.00,733.26,4.04,11526869.36,3138380.64,200000.00,1569.19,15.06,10,21.4,1,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('HPE Unix Server','HPUX',3129600.00,2353000.00,133,0.86,3103635.13,25964.87,148000.00,17.54,0.12,6.29,0.83,1,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('HPI Con 3D Printer','3D',0,8000000.00,0,0,0,0,640000.00,0,0,8,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Huawei Enterprise','Hua',127653134.23,32644805.00,391.04,35.2,122159560.66,5493573.57,1021044.15,538.03,26.35,3.13,4.3,25,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Intermec Technologies Corp.','OI05',24184064.00,8206836.66,294.68,6.67,22903634.19,1280429.81,525373.99,243.72,6.14,6.4,5.29,13,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Jabra','Jabr',75620.65,0,0,0.02,63793.21,11827.44,0,0,0.06,0,15.64,2,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Kaspersky','Kas',656328.80,1000000.00,65.63,0.18,583613.55,72715.25,100000.00,72.72,0.35,10,11.08,73,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Metrologic','HNW',0,6239999.28,0,0,0,0,330654.21,0,0,5.3,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Microsoft Cloud','Clou',0,4108000.00,0,0,0,0,288000.00,0,0,7.01,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('MS CSP','MSCS',0,930000.00,0,0,0,0,37000.00,0,0,3.98,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('NetApp BV','NetA',15786810.36,11064421.05,142.68,4.35,14664234.58,1122575.78,509437.33,220.36,5.39,4.6,7.11,9,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Nutanix','Nuta',11416470.00,23483903.06,48.61,3.15,10776408.16,640061.84,1387432.48,46.13,3.07,5.91,5.61,2,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Oracle Corp','ORL',3659483.00,30600000.00,11.96,1.01,3497435.26,162047.74,3825168.00,4.24,0.78,12.5,4.43,4,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Quest Software','OV08',307600.40,986110.14,31.19,0.08,279190.15,28410.25,57448.25,49.45,0.14,5.83,9.24,4,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Red Hat','OR02',9735374.26,2393845.19,406.68,2.68,9356872.88,378501.38,242638.96,155.99,1.82,10.14,3.89,11,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Rubrik Inc.','Rubr',0,5000000.00,0,0,0,0,350000.00,0,0,7,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Symantec Cloud Enterprise','SYMT',192225.00,0,0,0.05,179058.07,13166.93,0,0,0.06,0,6.85,2,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Symantec Enterprise','SMNT',15190128.13,4734288.29,320.85,4.19,14271301.23,918826.90,331400.18,277.26,4.41,7,6.05,55,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Veeam','VPL',7082711.50,4323245.00,163.83,1.95,6409005.15,673706.35,290826.00,231.65,3.23,6.73,9.51,23,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('Veritas','VRTS',6235821.80,13000000.00,47.97,1.72,5801698.52,434123.28,719135.76,60.37,2.08,5.53,6.96,17,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('VMWare Inc','OV05',40245627.00,8598000.00,468.08,11.1,38493875.84,1751751.16,458000.00,382.48,8.4,5.33,4.35,58,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('VMware VSPP','VPP',1907474.00,1849000.00,103.16,0.53,1567694.02,339779.98,148000.00,229.58,1.63,8,17.81,7,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('XYZ Printing','XYZ',104034.39,2000000.00,5.2,0.03,95569.34,8465.05,160000.00,5.29,0.04,8,8.14,2,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0'),
('YITU','YITU',0,4167000.00,0,0,0,0,208000.00,0,0,4.99,0,0,'exec dw.DW_PI.dbo.asp_MTDRevenueByBrand @Begdate=\'01 Dec 2018\',@Enddate=\'31 Dec 2018 23:59:59\',@BndNo=null,@StCode=14161,@SessionStaffCode=14161,@IncludePPBU=0,@AllLocation=0,@Cat1No=null,@DlNo=null,@Promotion=0,@FundConcerned=0,@Official=0');



#insert into onhand (Emp_Code,Code)
#	SELECT '2467', CODE FROM source;
    
insert into onhand (Emp_Code,Code,Brand)
	 VALUES 
     ('2467','Aris','Arista'),
     ('2467','DLET','Dell'),
     ('2467','EMC','EMC'),
     ('2467','F5','F5'),
     ('2467','Fire','FireEye'),
     ('2467','FPJ','Fortinet'),
     ('2467','FNET','Fortinet'),
     ('2467','FJSS','Fujitsu'),
     ('2467','FJSV','Fujitsu'),
     ('2467','Hort','Hortonworks'),
     ('2467','HPUX','HP'),
     ('2467','3D','HP'),
     ('2467','Hua','Huawei'),
     ('2467','OI05','Honewell'),
     ('2467','Jabr','Jabra'),
     ('2467','Kas','Kaspersky'),
     ('2467','HNW','Honewell'),
     ('2467','Clou','Microsoft'),
     ('2467','MSCS','Microsoft'),
     ('2467','NetA','NetApp'),
     ('2467','Nuta','Nutanix'),
     ('2467','ORL','Oracle'),
     ('2467','OV08','Quest'),
     ('2467','OR02','Red Hat'),
     ('2467','Rubr','Rubrik'),
     ('2467','SYMT','Symantec'),
     ('2467','SMNT','Symantec'),
     ('2467','VPL','Veeam'),
     ('2467','VRTS','Veritas'),
     ('2467','OV05','VMWare'),
     ('2467','XYZ','XYZ'),
     ('2467','YITU','YITU'),
     ('2018','FJSS','Fujitsu'),
     ('2018','HNW','Honewell'),
     ('2018','OI05','Honewell'),
     ('2452','Nuta','Nutanix'),
     ('2214','VPL','Veeam'),
     ('2214','OV05','VMWare')
;

UPDATE emp
  SET bcount = (select count(distinct Brand) from onhand where emp.Emp_Code = onhand.Emp_Code) where emp.id > 0; 
truncate fat; 


insert into fat (
  `Emp_Code`,
  `Name`,
  `Surname`,
  `Position`,
  `Division`,
  `Thai_name`, 
  `Code`,
  `Brand_Name`,
  `Brand`,
  `Sale_Achieve`,
  `GP_Achieve`,
  `i_Achieve`,
  `i_GP`,
  `Start_date`,
  `Sales_Out`,
  `Target`,
  `Sale_Contribution`,
  `Total_Cost`,
  `GP`,
  `GP_Target`,
  `GP_Contribution`,
  `xGP_Target`,
  `Avg_GP`,
  `Breadth`,
  `Session_Code`
)
select 
  emp.Emp_Code,
  `Name`,
  `Surname`,
  `Position`,
  `Division`,
  `Thai_name`, 
  
  onhand.Code,
  source.Brand_Name,
  onhand.Brand,
  `Sale_Achieve`,
  `GP_Achieve`,
  CASE
		WHEN source.Sale_Achieve > 1 and source.Sale_Achieve < 99  THEN 1500
        WHEN source.Sale_Achieve > 100 and source.Sale_Achieve < 109  THEN 2000
        WHEN source.Sale_Achieve > 110 and source.Sale_Achieve < 119  THEN 3000
        WHEN source.Sale_Achieve > 120 and source.Sale_Achieve < 139  THEN 4000
        WHEN source.Sale_Achieve > 140 and source.GP_Achieve < 80 THEN 4000 
        WHEN source.Sale_Achieve > 140 and source.GP_Achieve > 80 THEN 5000 
		ELSE 0
	END as `i_Achieve`,
        CASE
		WHEN source.GP_Achieve > 1 and source.Sale_Achieve < 99  THEN 2500
        WHEN source.GP_Achieve > 100 and source.Sale_Achieve < 109  THEN 3000
        WHEN source.GP_Achieve > 110 and source.Sale_Achieve < 119  THEN 3500
        WHEN source.GP_Achieve > 120 and source.Sale_Achieve < 139  THEN 5000
        WHEN source.GP_Achieve > 140 THEN 6000
		ELSE 0
	END as   `i_GP`,

  `Start_date`,
  `Sales_Out`,
  `Target`,

  `Sale_Contribution`,
  `Total_Cost`,
  `GP`,
  `GP_Target`,
  `GP_Contribution`,
  `xGP_Target`,
  `Avg_GP`,
  `Breadth`,
  `Session_Code`
    from emp 
		left join onhand on emp.Emp_Code= onhand.Emp_Code 
        left join source on onhand.Code = source.Code;
        
DROP PROCEDURE IF EXISTS getEmp;

DELIMITER //
CREATE PROCEDURE getEmp()
BEGIN
   SELECT 
	  emp.Emp_Code,
    Name,
    Surname,
    Start_date,
    GROUP_CONCAT(onhand.Code) as `CodeOnhand`, 
    count(DISTINCT onhand.Code) as `ProductCount`
   FROM emp left join onhand on emp.Emp_Code= onhand.Emp_Code group by emp.Emp_Code;
END //
DELIMITER ;
