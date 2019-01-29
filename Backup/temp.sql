

select Emp_Code,
    group_concat(Code) as `All_Code`,
    group_concat(distinct Brand) as `All_Brand`,
    count(distinct Brand) as `Count_Brand`,
	Thai_name,
    sum(Target) as `SUM_Taget`,sum(Sales_Out) as `SUM_Sales_Out`,
    sum(GP_Target) as `SUM_GP_Target`,sum(GP) as `SUM_GP_Achieve`,
    Case
		when count(distinct Brand)=1  THEN '80 %'
        when count(distinct Brand)=2 THEN '70 %'
        else '60 %'
    End as `CAL_per`,
    Concat(ROUND(sum(Sales_Out)/sum(Target)*100,2),' %') as Cal_Sale_Achieve,
    concat(ROUND(sum(GP)/sum(GP_Target)*100,2),' %')as Cal_GP,
	CASE
		WHEN (sum(Sales_Out)/sum(Target)*100) > 
        Case
			when count(distinct Brand)=1  THEN 80
			when count(distinct Brand)=2 THEN 70
			else 60
		End and (sum(Sales_Out)/sum(Target)*100) < 99  THEN 1500
        WHEN (sum(Sales_Out)/sum(Target)*100)  > 100 THEN 2000
 		ELSE 0
	END as `i_Achieve`,
    CASE
		WHEN (sum(GP)/sum(GP_Target)*100) > 
        Case
			when count(distinct Brand)=1  THEN 80
			when count(distinct Brand)=2 THEN 70
			else 60
		End and (sum(GP)/sum(GP_Target)*100) < 99  THEN 2500
        WHEN (sum(GP)/sum(GP_Target)*100) > 100 THEN 3000
		ELSE 0
	END as   `i_GP`,
    CASE
		WHEN (sum(Sales_Out)/sum(Target)*100)  > 
			Case
				when count(distinct Brand)=1  THEN 80
				when count(distinct Brand)=2 THEN 70
				else 60
			End and (sum(Sales_Out)/sum(Target)*100)  < 99  THEN 1500
        WHEN (sum(Sales_Out)/sum(Target)*100)  > 100 THEN 2000
 		ELSE 0
	END +
    CASE
		WHEN (sum(GP)/sum(GP_Target)*100) > 
			Case
				when count(distinct Brand)=1  THEN 80
				when count(distinct Brand)=2 THEN 70
				else 60
			End and (sum(GP)/sum(GP_Target)*100) < 99  THEN 2500
        WHEN (sum(GP)/sum(GP_Target)*100) > 100 THEN 3000
		ELSE 0
	END as Incentive, 
	Session_Code,
	Concat('Incentive Achieve (',Session_Code,')') as Detail 
from fat 
group by fat.Emp_Code
