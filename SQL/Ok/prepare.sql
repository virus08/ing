insert into vstecsyear (
	`name`,`desc`
)value(
	'VY19','VSTECSY2019'
);


insert into target (
	`product_id`,`year_id`,
    `Target_s1`,`Target_s2`,`Target_s3`,`Target_s4`,`Target_s5`,`Target_s6`,
	`Target_s7`,`Target_s8`,`Target_s9`,`Target_s10`,`Target_s11`,`Target_s12`,
	`Target_g1`,`Target_g2`,`Target_g3`,`Target_g4`,`Target_g5`,`Target_g6`,
    `Target_g7`,`Target_g8`,`Target_g9`,`Target_g10`,`Target_g11`,`Target_g12`
)
SELECT 
	p.id as `product_id`,v.id as `year_id`,
	(10000000) as `Target_s1`,	(6000000) as `Target_s2`,
	(10000000) as `Target_s3`,	(6000000) as `Target_s4`,
	(10000000) as `Target_s5`,	(6000000) as `Target_s6`,
	(10000000) as `Target_s7`,	(6000000) as `Target_s8`,
	(10000000) as `Target_s9`,	(6000000) as `Target_s10`,
	(10000000) as `Target_s11`,	(6000000) as `Target_s12`,
	(1000000) as `Target_g1`,	(600000) as `Target_g2`,
	(1000000) as `Target_g3`,	(600000) as `Target_g4`,
	(1000000) as `Target_g5`,	(600000) as `Target_g6`,
	(1000000) as `Target_g7`,	(600000) as `Target_g8`,
	(1000000) as `Target_g9`,	(600000) as `Target_g10`,
	(1000000) as `Target_g11`,	(600000) as `Target_g12`
from product as p, vstecsyear as v;

UPDATE `ing`.`target` SET `Target_s7` = '30000000.00', `Target_g7` = '2000000.00' WHERE (`product_id` = '31');
UPDATE `ing`.`target` SET `Target_s7` = '30000000.00', `Target_g7` = '2000000.00' WHERE (`product_id` = '14');
UPDATE `ing`.`target` SET `Target_s7` = '20000000.00', `Target_g7` = '1000000.00' WHERE (`product_id` = '21');