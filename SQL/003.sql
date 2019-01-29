use rest;
select 
	Emp_Code,
    Code,
	Thai_name,
    Target,Sales_Out,Sale_Achieve,
    (Sales_Out/Target*100) as Cal_Sale_Achieve,
    GP_Target,GP,GP_Achieve,
    (GP/GP_Target*100) as Cal_GP,
	sum(Incentive),
	'Incentive onhand are Achieve' as Detail 
from fat where fat.Emp_Code = '2018' 
group by fat.Code
union
select 
	Emp_Code,
    GROUP_CONCAT(fat.Code) as code,
	Thai_name,
    sum(Target) as Target,sum(Sales_Out) as Sales_Out,NULL as Sale_Achieve,
    (sum(Sales_Out)/sum(Target)*100)  as Cal_Sale_Achieve,
    sum(GP_Target) as GP_Target,sum(GP) as GP,NULL as GP_Achieve,
    (sum(GP)/sum(GP_Target)*100) as Cal_GP,
	case 
		when (sum(Sales_Out)/sum(Target)*100) > 60 
        OR   (sum(GP)/sum(GP_Target)*100) > 60         
        then 1 else 0
	END as Incentive,
	'Rev หรือ GP รวมกันทั้งหมดมากกว่า 60% ' as Detail 
from fat where fat.Emp_Code = '2018' AND fat.ProductCount = 2 
union
select 
	null as Emp_Code,
    null as Code,
	null as Thai_name,
    null as Target,null as Sales_Out,Sale_Achieve,
    null as Cal_Sale_Achieve,
    null as GP_Target,null as GP,GP_Achieve,
    null as Cal_GP,
	(count(code)/fat.ProductCount) as Incentive,
	concat('Product Code ',GROUP_CONCAT(fat.Code),' Total ',count(code),' Product has a Sale_Achieve or GP_Achieve < 30 %' )  as Detail 
from fat where fat.Emp_Code = '2018' And (Sale_Achieve < 30 OR GP_Achieve < 30)And fat.Code IN (select onhand.Code from onhand where onhand.Emp_Code = '2018') 
group by fat.Emp_Code 