use ing;

DROP PROCEDURE IF EXISTS getEmp;
DELIMITER //
CREATE PROCEDURE getEmp()
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
