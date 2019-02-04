select 
	e.Emp_Code as `Emp_Code`,
    p.name as `Product_Code`,
    p.desc as `Product_Detail`,
    b.name as `Brand_Name`,
    concat(e.name,' ',Surname) as `Name-Surname`,
    po.name as `Position`,
    di.name as `Division`,
    e.Thai_name as `Thai_name`,
    s.Target as `Target`,
    s.Sales_Out as `Sales_Out`,
    COALESCE(round((s.Sales_Out/s.Target*100),2),0) as `Sale_Achieve_From_Cal`,
    s.Sale_Achieve as `Sale_Achieve_from_Source`,
    s.GP_Target as `GP_Target`,
    s.Total_Cost as `Total_Cost`,
    (s.Sales_Out-s.Total_Cost) as `GP_From_Cal`,
    s.GP as `GP_From_Source`,
    COALESCE(round(((s.Sales_Out-s.Total_Cost)/s.GP_Target*100),2),0) as `GP_Achieve_From_Cal`,
    s.GP_Achieve as `GP_Achieve_Form_source`,
    s.Duedate as `Transection_Date`,
    s.Session_Code as `From_Session_Code`
from source as s 
	INNER  join product as p on s.Code = p.name
    INNER  join product_on_hand as ph on p.id= ph.product_id
    INNER  join emp as e on ph.Emp_Code = e.Emp_code
	INNER  join position as po on e.Position_id = po.id 
    INNER  join division as di on e.Division_id = di.id
    INNER  join product_on_brand as pb on p.id = pb.product_id
    INNER  join brand as b on pb.brand_id =b.id 
where s.status = 1 and e.status = 1;