

DROP VIEW IF EXISTS `ing`.`fat_table`;

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fat_table` AS
    SELECT 
        `e`.`Emp_Code` AS `Emp_Code`,
        `p`.`name` AS `Product_Code`,
        `p`.`desc` AS `Product_Detail`,
        `b`.`name` AS `Brand_Name`,
        CONCAT(`e`.`Name`, ' ', `e`.`Surname`) AS `Name-Surname`,
        `po`.`Name` AS `Position`,
        `di`.`Name` AS `Division`,
        `e`.`Thai_name` AS `Thai_name`,
        `s`.`Target` AS `Target`,
        `s`.`Sales_Out` AS `Sales_Out`,
        COALESCE(ROUND(((`s`.`Sales_Out` / `s`.`Target`) * 100),
                        2),
                0) AS `Sale_Achieve_From_Cal`,
        `s`.`Sale_Achieve` AS `Sale_Achieve_from_Source`,
        `s`.`GP_Target` AS `GP_Target`,
        `s`.`Total_Cost` AS `Total_Cost`,
        (`s`.`Sales_Out` - `s`.`Total_Cost`) AS `GP_From_Cal`,
        `s`.`GP` AS `GP_From_Source`,
        COALESCE(ROUND((((`s`.`Sales_Out` - `s`.`Total_Cost`) / `s`.`GP_Target`) * 100),
                        2),
                0) AS `GP_Achieve_From_Cal`,
        `s`.`GP_Achieve` AS `GP_Achieve_Form_source`,
        `s`.`Duedate` AS `Transection_Date`,
        `s`.`Session_Code` AS `From_Session_Code`
    FROM
        (((((((`source` `s`
        INNER  JOIN `product` `p` ON ((`s`.`Code` = `p`.`name`)))
        INNER  JOIN `product_on_hand` `ph` ON ((`p`.`id` = `ph`.`product_id`)))
        INNER  JOIN `emp` `e` ON ((`ph`.`Emp_Code` = `e`.`Emp_Code`)))
        INNER  JOIN `position` `po` ON ((`e`.`Position_id` = `po`.`id`)))
        INNER  JOIN `division` `di` ON ((`e`.`Division_id` = `di`.`id`)))
        INNER  JOIN `product_on_brand` `pb` ON ((`p`.`id` = `pb`.`product_id`)))
        INNER  JOIN `brand` `b` ON ((`pb`.`brand_id` = `b`.`id`)))
    WHERE
        (`s`.`status` = 1) and (e.status = 1);
        

DROP VIEW IF EXISTS `ing`.`rule`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `rule` AS
    SELECT 
        `e`.`Emp_Code` AS `Emp_Code`,
        COUNT(DISTINCT `p`.`name`) AS `Count_Product_Onhand`,
        COUNT(DISTINCT `b`.`name`) AS `Count_Brand_Onhand`,
        (CASE
            WHEN (COUNT(DISTINCT `b`.`id`) = 1) THEN 80
            WHEN (COUNT(DISTINCT `b`.`id`) = 2) THEN 70
            ELSE 60
        END) AS `rule`
    FROM
        ((((`emp` `e`
        INNER  JOIN `product_on_hand` `ph` ON ((`e`.`Emp_Code` = `ph`.`Emp_Code`)))
        INNER  JOIN `product` `p` ON ((`ph`.`product_id` = `p`.`id`)))
        INNER  JOIN `product_on_brand` `pb` ON ((`p`.`id` = `pb`.`product_id`)))
        INNER  JOIN `brand` `b` ON ((`pb`.`brand_id` = `b`.`id`)))
    WHERE
        (`e`.`status` = 1)
    GROUP BY `e`.`Emp_Code`;

DROP VIEW IF EXISTS `ing`.`info_by_emp_code`;    
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `info_by_emp_code` AS
    SELECT 
        `fat_table`.`Emp_Code` AS `Emp_Code`,
        `fat_table`.`Thai_name` AS `Thai_name`,
        SUM(`fat_table`.`Target`) AS `Taget`,
        SUM(`fat_table`.`Sales_Out`) AS `Sales_out`,
        COALESCE(ROUND(((SUM(`fat_table`.`Sales_Out`) / SUM(`fat_table`.`Target`)) * 100),
                        2),
                0) AS `Sales_Achieve`,
        SUM(`fat_table`.`GP_Target`) AS `GP_Target`,
        SUM(`fat_table`.`GP_From_Cal`) AS `GP`,
        COALESCE(ROUND(((SUM(`fat_table`.`GP_From_Cal`) / SUM(`fat_table`.`GP_Target`)) * 100),
                        2),
                0) AS `GP_Achieve`,
        COUNT(DISTINCT `fat_table`.`Brand_Name`) AS `Brand_on_hand`,
        GROUP_CONCAT(DISTINCT `fat_table`.`Brand_Name`
            SEPARATOR ',') AS `List_Brand_On_Hand`,
        GROUP_CONCAT(DISTINCT `fat_table`.`Product_Code`
            SEPARATOR ',') AS `List_Product_On_Hand`,
        `fat_table`.`Transection_Date` AS `Transection_Date`,
        `fat_table`.`From_Session_Code` AS `From_Session_Code`
    FROM
        `fat_table`
    GROUP BY `fat_table`.`Transection_Date` , `fat_table`.`From_Session_Code` , `fat_table`.`Emp_Code`;

DROP VIEW IF EXISTS `ing`.`incentive_extend`;        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `incentive_extend` AS
    SELECT 
        `i`.`Emp_Code` AS `Emp_Code`,
        (CASE
            WHEN
                ((`i`.`Sales_Achieve` >= `r`.`rule`)
                    AND (`i`.`Sales_Achieve` < 100))
            THEN
                1500
            WHEN (`i`.`Sales_Achieve` >= 100) THEN 2000
            ELSE 0
        END) AS `Sales_Incentive`,
        (CASE
            WHEN
                ((`i`.`GP_Achieve` >= `r`.`rule`)
                    AND (`i`.`GP_Achieve` < 100))
            THEN
                2500
            WHEN (`i`.`GP_Achieve` >= 100) THEN 3000
            ELSE 0
        END) AS `GP_Incentive`,
        `i`.`Transection_Date` AS `Transection_Date`,
        `i`.`From_Session_Code` AS `From_Session_Code`
    FROM
        (`info_by_emp_code` `i`
        LEFT JOIN `rule` `r` ON ((`r`.`Emp_Code` = `i`.`Emp_Code`)));