select 
	Emp_Code,
    Thai_name,
    sum(Target) as `Taget`,
    sum(Sales_Out) as `Sales_out`,
    COALESCE(ROUND((sum(Sales_Out)/sum(Target)*100),2),0) as `Sales_Achieve`,
    sum(GP_Target) as `GP_Target`,
    sum(GP_From_Cal) as `GP`,
    COALESCE(ROUND((sum(GP_From_Cal)/sum(GP_Target)*100),2),0)as `GP_Achieve`,
    count(distinct Brand_Name) as `Brand_on_hand`,
    group_concat(distinct Brand_Name) as `List_Brand_On_Hand`,
    group_concat(distinct Product_Code) as `List_Product_On_Hand`,
    Transection_Date,
    From_Session_Code
from fat_table group by Transection_Date,From_Session_Code,Emp_Code