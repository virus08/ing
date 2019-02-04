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
