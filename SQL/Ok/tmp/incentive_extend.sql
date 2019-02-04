select 
	i.Emp_Code as `Emp_Code`,
    (case 
		when i.Sales_Achieve >= r.rule and i.Sales_Achieve < 100 then 1500
		when i.Sales_Achieve >=100 then 2000
		else 0
    end) as `Sales_Incentive`,
    (case 
		when i.GP_Achieve >= r.rule and i.GP_Achieve < 100 then 2500
		when i.GP_Achieve >=100 then 3000
		else 0
    end) as `GP_Incentive`,
    Transection_Date,
    From_Session_Code
 from info_by_emp_code as i left join rule as r on r.Emp_Code = i.Emp_Code
