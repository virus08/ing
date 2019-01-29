truncate fat; 
insert into fat (
  `Emp_Code`,
  `Name`,
  `Surname`,
  `Position`,
  `Division`,
  `Thai_name`, 
  `Code`,
  `Brand_Name`,
  `Brand`,
  `Sale_Achieve`,
  `GP_Achieve`,
  `Start_date`,
  `Sales_Out`,
  `Target`,
  `Sale_Contribution`,
  `Total_Cost`,
  `GP`,
  `GP_Target`,
  `GP_Contribution`,
  `xGP_Target`,
  `Avg_GP`,
  `Breadth`,
  `Session_Code`,
  `ProductCount`
)
select 
  emp.Emp_Code,
  `Name`,
  `Surname`,
  `Position`,
  `Division`,
  `Thai_name`, 
  
  onhand.Code,
  source.Brand_Name,
  onhand.Brand,
  
  `Sale_Achieve`,
  `GP_Achieve`,
  `Start_date`,
  `Sales_Out`,
  `Target`,

  `Sale_Contribution`,
  `Total_Cost`,
  `GP`,
  `GP_Target`,
  `GP_Contribution`,
  `xGP_Target`,
  `Avg_GP`,
  `Breadth`,
  `Session_Code`,
  emp.bcount
    from emp 
		left join onhand on emp.Emp_Code= onhand.Emp_Code 
        left join source on onhand.Code = source.Code;