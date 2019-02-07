use ing;

DROP PROCEDURE IF EXISTS getEmp;
DELIMITER //
CREATE DEFINER = 'root'@'localhost' PROCEDURE getEmp()
BEGIN
   select Emp_Code,e.Name as Name,Surname, p.Name as Position,d.Name as Division,Thai_name 
	from emp as e 
		left join position as p on e.Position_id = p.id
		left join division as d on e.Division_id = d.id
	where e.status = 1
	ORDER BY p.id DESC;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getUsers;
DELIMITER //
CREATE DEFINER = 'root'@'localhost' PROCEDURE getUsers()
BEGIN
	SET block_encryption_mode = 'aes-256-cbc';
	SET @key_str = SHA2('My secret passphrase',512);
    SET @init_vector_x = 'select init_vector from initb';
    SELECT u.id as id,username,cast(AES_DECRYPT(UNHEX(password),@key_str,@init_vector_x) AS CHAR(16)) as password ,e.Name as firstName,e.Surname as lastName from users as u
    left join emp as e on u.Emp_Code = e.Emp_Code;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getBrand;
DELIMITER //
CREATE DEFINER = 'root'@'localhost' PROCEDURE getBrand()
BEGIN
	SELECT b.id as `id`,b.name as `Brand`, group_concat(p.name) as `Code`   FROM ing.product_on_brand as pb
		left join product as p on pb.product_id = p.id 
		left join brand as b on pb.brand_id = b.id
		group by b.name;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS getInfoOnhand;
DELIMITER //
CREATE DEFINER = 'root'@'localhost' PROCEDURE getInfoOnhand()
BEGIN
	SELECT 
		e.id as `#`,
        concat(e.name,' ',e.Surname) as `Presale_Name`,
		e.Emp_Code as `Company_ID`, 
        e.Thai_name as `Thai_Name`, 
		group_concat(distinct p.name) as Product_On_Hand,
		group_concat(distinct b.name) as Brand_On_Hand,
		count(distinct p.name) as `Count_Product_Onhand`,
		count(distinct b.name) as `Count_Brand_Onhand`
	from emp as e
		left join product_on_hand as ph on e.Emp_Code = ph.Emp_Code
		left join product as p on ph.product_id = p.id
		left join product_on_brand as pb on p.id = pb.product_id
		left join brand as b on pb.brand_id = b.id
	where e.status = 1
    group by e.Emp_code;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS getIncentive;
DELIMITER //
CREATE DEFINER = 'root'@'localhost' PROCEDURE getIncentive(IN startdate datetime,IN stopdate datetime,IN SalesTarget_filed varchar(10),GpTarget_filed varchar(10))
BEGIN
DROP temporary table if exists SumByProduct;
DROP temporary table if exists SalesByProduct;
DROP temporary table if exists info_by_brand;
DROP temporary table if exists brand_count;
DROP temporary table if exists xemp; 
DROP temporary table if exists fcount;
DROP temporary table if exists info_by_emp;


create temporary table SumByProduct
	select Brand_Name, 
		sum(Price_After_Discount) as `Sales_Out`,
		sum(GP) as `GP`
	from datain 
		where Invoice_Date BETWEEN startdate AND stopdate
	group by `Brand_Name` order by `Brand_Name` ;
    
SET @sql = concat ('
create temporary table SalesByProduct  
	select 
		p.id as id,
		p.name as Code,
		p.desc as Brand_Name,
		s.Sales_Out as Sales_Out,
		s.GP as GP,
		t.',SalesTarget_filed,' as `Sales_Target`,
		t.',GpTarget_filed,' as `GP_Target`,
		COALESCE(ROUND((s.Sales_Out/t.Target_s7*100),2),0) as `Sale_Achieve`,
		COALESCE(ROUND((s.Sales_Out/t.Target_s7*100),2),0) as `GP_Achieve`
	from Product as p
	left join SumByProduct as s on p.desc=s.Brand_Name
	inner join target as t on p.id = t.product_id;
');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

create temporary table info_by_brand 
	SELECT 
		b.id as `id`,
		b.name as `Brand`,
		group_concat(im.Code) as `List_Product_On_Hand`,
		sum(Sales_Out) as `Sales_Out`,
		sum(im.GP) as `GP`,
		sum(im.Sales_Target) as `Sales_Target`,
		sum(im.GP_Target) as `GP_Target`,
		sum(Sales_Out)/sum(im.Sales_Target)*100 as `Sale_Achieve`,
		sum(im.GP)/sum(im.GP_Target)*100 as `GP_Achieve`
	FROM brand as b
	left join product_on_brand as pb on b.id=pb.brand_id
	left join product as p on pb.product_id = p.id
	left join salesbyproduct as im on p.name=im.Code
	group by b.id;

create temporary table brand_count
	select
		e.id as id,
		count(distinct pb.brand_id) as `Brand_Count`,
		Case 
			when count(distinct pb.brand_id) = 1 then 80
			when count(distinct pb.brand_id) = 2 then 70
			when count(distinct pb.brand_id) > 2 then 60
			else 0
		end as rule
	from emp as e
	left join product_on_hand as ph on e.Emp_Code=ph.Emp_Code
	left join product_on_brand as pb on ph.product_id = pb.product_id
	group by e.Emp_Code;

create temporary table xemp
	select 
		e.id as id,
		pb.brand_id as brand_id    
	from emp as e
		left join product_on_hand as ph on e.Emp_Code = ph.Emp_Code
		left join product_on_brand as pb on ph.product_id = pb.product_id 
	group by pb.brand_id,e.Emp_Code;

create temporary table fcount
	select 
		x.id as id,
		count(x.brand_id) as fcount
	from xemp as x
		inner join info_by_brand as i on x.brand_id = i.id
		where (
			i.Sale_Achieve is null or 
			i.Sale_Achieve < 30 or 
			i.GP_Achieve is null or
			i.GP_Achieve < 30
		)
	group by x.id;

create temporary table info_by_emp 
	select
		e.id as `id`,
		e.Emp_Code as Emp_Code,
		concat(e.name,' ',e.Surname) as `Name_Surname`,
		group_concat(im.Code) as `List_Product_On_Hand`,
		sum(Sales_Out) as `Sales_Out`,
		sum(im.GP) as `GP`,
		sum(im.Sales_Target) as `Sales_Target`,
		sum(im.GP_Target) as `GP_Target`,
		sum(Sales_Out)/sum(im.Sales_Target)*100 as `Sale_Achieve`,
		sum(im.GP)/sum(im.GP_Target)*100 as `GP_Achieve`,
		bc.Brand_Count as `Brand_Count`,
		bc.rule as `rule`,
		COALESCE(f.fcount,0) as `CountBrandUnder`,
		round(COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count,2) as factor,
		case 
			when sum(Sales_Out)/sum(im.Sales_Target)*100 >=  bc.rule and  
				 sum(Sales_Out)/sum(im.Sales_Target)*100 <  100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 1500,0)
			when sum(Sales_Out)/sum(im.Sales_Target)*100 >= 100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) *2000.0)
			else 0
		end as Incentive_Sales,
			case 
			when sum(im.GP)/sum(im.GP_Target)*100 >=  bc.rule and  
				 sum(im.GP)/sum(im.GP_Target)*100 <  100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 2500,0)
			when sum(im.GP)/sum(im.GP_Target)*100 >= 100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 3000,0)
			else 0
		end as Incentive_GP,
		case 
			when sum(Sales_Out)/sum(im.Sales_Target)*100 >=  bc.rule and  
				 sum(Sales_Out)/sum(im.Sales_Target)*100 <  100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 1500,0)
			when sum(Sales_Out)/sum(im.Sales_Target)*100 >= 100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) *2000.0)
			else 0
		end +
			case 
			when sum(im.GP)/sum(im.GP_Target)*100 >=  bc.rule and  
				 sum(im.GP)/sum(im.GP_Target)*100 <  100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 2500,0)
			when sum(im.GP)/sum(im.GP_Target)*100 >= 100 
			then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 3000,0)
			else 0
		end as Incentive
	from emp as e
		inner join product_on_hand as ph on e.Emp_Code=ph.Emp_Code
		inner join SalesByProduct as im on ph.product_id=im.id
		inner join brand_count as bc on e.id=bc.id
		left join fcount as f on e.id=f.id
	group by e.id;

    
select *,left(startdate,7) as tack from info_by_emp;


DROP temporary table if exists SumByProduct;
DROP temporary table if exists SalesByProduct;
DROP temporary table if exists info_by_brand;
DROP temporary table if exists brand_count;
DROP temporary table if exists xemp; 
DROP temporary table if exists fcount;
DROP temporary table if exists info_by_emp;
END //
DELIMITER ;
