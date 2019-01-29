truncate source;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\source1.csv' INTO TABLE rest.source
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
(
  `Brand_Name`,
  `Code` ,
  `Sales_Out`,
  `Target` ,
  `Sale_Achieve` ,
  `Sale_Contribution`,
  `Total_Cost` ,
  `GP`,
  `GP_Target` ,
  `GP_Achieve`,
  `GP_Contribution`,
  `xGP_Target`,
  `Avg_GP` ,
  `Breadth` 
)
SET Session_Code = 'aaa';