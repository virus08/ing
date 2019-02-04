drop view if exists SumByProduct_at_july;
create view SumByProduct_at_july as 
	select Brand_Name, 
    sum(Price_After_Discount) as `Sales_Out`,
    sum(GP) as `GP`
from datain 
	where Invoice_Date BETWEEN '2018-07-01' AND '2018-07-31'
group by `Brand_Name` order by `Brand_Name` ;
    
DROP view if exists SalesByProduct_at_july;
create view  SalesByProduct_at_july as 
select 
	p.id as id,
    p.name as Code,
    p.desc as Brand_Name,
    s.Sales_Out as Sales_Out,
    s.GP as GP,
    t.Target_s7 as `Sales_Target`,
    t.Target_g7 as `GP_Target`,
    COALESCE(ROUND((s.Sales_Out/t.Target_s7*100),2),0) as `Sale_Achieve`,
    COALESCE(ROUND((s.Sales_Out/t.Target_s7*100),2),0) as `GP_Achieve`
from Product as p
left join SumByProduct_at_july as s on p.desc=s.Brand_Name
inner join target as t on p.id = t.product_id;

drop view if exists info_by_brand;
create view info_by_brand as 
SELECT 
	b.id as `id`,
	b.name as `Brand`,
	group_concat(ijuly.Code) as `List_Product_On_Hand`,
    sum(Sales_Out) as `Sales_Out`,
    sum(ijuly.GP) as `GP`,
    sum(ijuly.Sales_Target) as `Sales_Target`,
    sum(ijuly.GP_Target) as `GP_Target`,
    sum(Sales_Out)/sum(ijuly.Sales_Target)*100 as `Sale_Achieve`,
	sum(ijuly.GP)/sum(ijuly.GP_Target)*100 as `GP_Achieve`
FROM brand as b
left join product_on_brand as pb on b.id=pb.brand_id
left join product as p on pb.product_id = p.id
left join salesbyproduct_at_july as ijuly on p.name=ijuly.Code
group by b.id;


drop view if exists brand_count;
create view brand_count as 
select
	e.id as id,
    count(distinct pb.brand_id) as `Brand_Count`,
    Case 
		when count(distinct pb.brand_id) = 1 then 80
        when count(distinct pb.brand_id) = 2 then 70
        when count(distinct pb.brand_id) > 2 then 60
        else 0
	end as rule
from emp as e
left join product_on_hand as ph on e.Emp_Code=ph.Emp_Code
left join product_on_brand as pb on ph.product_id = pb.product_id
group by e.Emp_Code;


drop view if exists  xemp; 
create view  xemp as 
select 
	e.id as id,
    pb.brand_id as brand_id    
from emp as e
	left join product_on_hand as ph on e.Emp_Code = ph.Emp_Code
    left join product_on_brand as pb on ph.product_id = pb.product_id 
group by pb.brand_id,e.Emp_Code;

drop view if exists fcount;
create view  fcount as 
select 
	x.id as id,
    count(x.brand_id) as fcount
from xemp as x
	inner join info_by_brand as i on x.brand_id = i.id
    where (
		i.Sale_Achieve is null or 
        i.Sale_Achieve < 30 or 
        i.GP_Achieve is null or
        i.GP_Achieve < 30
    )
group by x.id;


drop view if exists info_by_emp;
create view info_by_emp as 
select
	e.id as `id`,
	e.Emp_Code as Emp_Code,
	concat(e.name,' ',e.Surname) as `Name_Surname`,
    group_concat(ijuly.Code) as `List_Product_On_Hand`,
    sum(Sales_Out) as `Sales_Out`,
    sum(ijuly.GP) as `GP`,
    sum(ijuly.Sales_Target) as `Sales_Target`,
    sum(ijuly.GP_Target) as `GP_Target`,
    sum(Sales_Out)/sum(ijuly.Sales_Target)*100 as `Sale_Achieve`,
	sum(ijuly.GP)/sum(ijuly.GP_Target)*100 as `GP_Achieve`,
    bc.Brand_Count as `Brand_Count`,
    bc.rule as `rule`,
    COALESCE(f.fcount,0) as `CountBrandUnder`,
    round(COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count,2) as factor,
    case 
		when sum(Sales_Out)/sum(ijuly.Sales_Target)*100 >=  bc.rule and  
			 sum(Sales_Out)/sum(ijuly.Sales_Target)*100 <  100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 1500,0)
        when sum(Sales_Out)/sum(ijuly.Sales_Target)*100 >= 100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) *2000.0)
        else 0
	end as Incentive_Sales,
        case 
		when sum(ijuly.GP)/sum(ijuly.GP_Target)*100 >=  bc.rule and  
			 sum(ijuly.GP)/sum(ijuly.GP_Target)*100 <  100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 2500,0)
        when sum(ijuly.GP)/sum(ijuly.GP_Target)*100 >= 100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 3000,0)
        else 0
	end as Incentive_GP,
    case 
		when sum(Sales_Out)/sum(ijuly.Sales_Target)*100 >=  bc.rule and  
			 sum(Sales_Out)/sum(ijuly.Sales_Target)*100 <  100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 1500,0)
        when sum(Sales_Out)/sum(ijuly.Sales_Target)*100 >= 100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) *2000.0)
        else 0
	end +
        case 
		when sum(ijuly.GP)/sum(ijuly.GP_Target)*100 >=  bc.rule and  
			 sum(ijuly.GP)/sum(ijuly.GP_Target)*100 <  100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 2500,0)
        when sum(ijuly.GP)/sum(ijuly.GP_Target)*100 >= 100 
        then round((COALESCE(f.fcount,bc.Brand_Count)/bc.Brand_Count) * 3000,0)
        else 0
	end as Incentive
from emp as e
	inner join product_on_hand as ph on e.Emp_Code=ph.Emp_Code
    inner join SalesByProduct_at_july as ijuly on ph.product_id=ijuly.id
    inner join brand_count as bc on e.id=bc.id
    left join fcount as f on e.id=f.id
group by e.id;

	
