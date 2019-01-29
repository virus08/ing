use rest;
DROP table IF EXISTS `incentive`;
CREATE TABLE IF NOT EXISTS `incentive` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Emp_Code` varchar (4) NOT NULL,
  `All_Code` varchar(300) NOT NULL,
  `All_Brand` varchar(300) NOT NULL,
  `Brand_Count` int(1) NOT NULL,
  `All_SaleOut` DECIMAL(19,2) NOT NULL,
  `All_SaleTarget` DECIMAL(19,2) NOT NULL,
  `All_GP` DECIMAL(19,2) NOT NULL,
  `All_GPTaget` DECIMAL(19,2) NOT NULL,
  `Sales_Achieve` DECIMAL(5,2) as (All_SaleOut/All_SaleTarget*100),
  `GP_Achieve` DECIMAL(5,2) as (All_GP/All_GPTaget*100),
  `rule` DECIMAL(5,2) as (case 
	when Brand_Count = 1 then 80
    when Brand_Count = 2 then 70
    else 60
    end),
  `factor` DECIMAL(5,2),
  `Sales_Achieve_In` DECIMAL(19,2) as (Case 
	when `Sales_Achieve` > rule and `Sales_Achieve` < 99 then 1500
    when `Sales_Achieve` >= 100 then 2000
	else 0
  end),
  `GP_Achieve_In` DECIMAL(19,2) as (Case 
	when GP_Achieve > rule and GP_Achieve < 99 then 2500
    when GP_Achieve >= 100 then 3000
	else 0
  end),
  `Incentive` DECIMAL(10,2) as ((Sales_Achieve_In+GP_Achieve_In)*`factor`),
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `Session_Code` varchar(500),
  `Detail` varchar(200),
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8MB4;