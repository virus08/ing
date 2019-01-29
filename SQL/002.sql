select 
	Emp_Code,
    Code,
	null as Thai_name,
    Null as Target,null as Sales_Out,Sale_Achieve,
    null as Cal_Sale_Achieve,
    null as GP_Target,null as GP,GP_Achieve,
    null as Cal_GP,
	null as Incentive,
	concat('Product Code ',fat.Code,' has a Sale_Achieve or GP_Achieve < 30 %' )  as Detail 
from fat where fat.Emp_Code = '2018' And (Sale_Achieve < 30 OR GP_Achieve < 30)And fat.Code IN (select onhand.Code from onhand where onhand.Emp_Code = '2018') 
group by fat.Code 