create database sql_project_1;
use sql_project_1;

create table big_mart(
item_identifier char(5) not null,
item_weight decimal(10,2),
item_fat_content varchar(25),
item_visibility decimal(10,2),
item_type varchar(25),
item_mrp decimal(10,2),
outlet_identifier char(6),
outlet_establishment_year year,
outlet_size varchar(25),
outlet_location_type varchar(25),
outlet_type varchar(25),
item_outlet_sales decimal(10,2));

select * from big_mart;

SET SESSION sql_mode = ''
 
load data
infile "c:/SQL_Project_1.csv"
into table big_mart
fields terminated by ","
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;

select * from big_mart;


-- 1. WRITE a sql query to show all Item_Identifier

select item_identifier from big_mart;

-- 2. WRITE a sql query to show count of total Item_Identifier

select count(item_identifier) as total_item_identifier from big_mart;

-- 3. WRITE a sql query to show maximum Item Weight

select max(item_weight) as Max_item_weight from big_mart;

-- 4. WRITE a query to show minimun Item Weight

select min(item_weight) as Min_item_weight from big_mart;

-- 5. WRITE a query to show average Item_Weight

select avg(item_weight) as Avg_item_weight from big_mart;

-- 6. WRITE a query to show count OF Item_Fat_Content WHERE 
-- Item_Fat_Content IS Low Fat

select count(item_fat_content) as Low_fat_items from big_mart where item_fat_content = "Low Fat";

-- 7. WRITE a query to show count OF Item_Fat_Content WHERE 
-- Item_Fat_Content IS Regular

select count(item_fat_content) as Regular_fat_items from big_mart where item_fat_content = 'Regular';

-- 8. WRITE a query TO show maximum Item_MRP

select max(item_mrp) as Expensive_Product from big_mart;

-- 9. WRITE a query TO show minimum Item_MRP

select min(item_mrp) as Cheapest_Product from big_mart;

-- 10.WRITE a query to show Item_Identifier , Item_Fat_Content 
-- ,Item_Type,Item_MRP and Item_MRP IS greater than 200

select item_identifier,item_fat_content,item_type,item_mrp from big_mart where item_mrp > 200;

-- 11.WRITE a query to show maximum Item_MRP WHERE 
-- Item_Fat_Content IS Low Fat

select max(item_mrp) from big_mart where item_fat_content = 'low fat' 

-- 12.WRITE a query to show minimum Item_MRp AND Item_Fat_Content IS Low Fat

select min(item_mrp) from big_mart where item_fat_content = 'low fat' 


-- 13.WRITE a query to show ALL DATA WHERE item MRP IS BETWEEN 50 TO 100

select * from big_mart where item_mrp between 50 and 100;

-- 14.WRITE a query to show ALL UNIQUE value Item_Fat_Content

select distinct(item_fat_content) from big_mart;

-- 15.WRITE a query to show ALL UNIQUE value Item_Type

select distinct(item_type) from big_mart;

-- 16.WRITE a query to show ALL DATA IN descending ORDER BY Item MRP

select * from big_mart order by item_mrp desc;

-- 17.WRITE a query to show ALL DATA IN ascending ORDER BY 
-- Item_Outlet_Sales

select * from big_mart order by item_outlet_sales asc;

-- 18.WRITE a query to show ALL DATA IN ascending BY Item_Type

select * from big_mart order by item_type asc;

-- 19.WRITE a query to show DATA OF item_type dairy & Meat

select * from big_mart where item_type in ("dairy","meat");

-- 20.WRITE a query to show ALL UNIQUE value OF Outlet_Size

select distinct(outlet_size) from big_mart;

-- 21.WRITE a query to show ALL UNIQUE value OF Outlet_Location_Type

select distinct(outlet_location_type) from big_mart;

-- 22.WRITE a query to show ALL UNIQUE value OF Outlet_Type

select distinct(outlet_type) from big_mart;

-- 23.WRITE a query to show count NO. OF item BY Item_Type AND ordered 
-- it IN descending

select item_type, count(item_identifier) as total_items from big_mart 
group by item_type 
order by total_items desc;

-- 24.WRITE a query to show count NO. OF item BY Outlet_Size AND 
-- ordered it IN ascending

select outlet_size,count(item_identifier) as total_product from big_mart
group by outlet_size
order by total_product asc;

-- 25.WRITE a query to show count NO. OF item BY Outlet_Establishment_Year AND ordered it IN ascening

select Outlet_Establishment_Year,count(item_identifier) as total_product from big_mart
group by Outlet_Establishment_Year
order by total_product asc;

-- 26.WRITE a query to show count NO. OF item BY Outlet_Type AND 
-- ordered it IN descending

select outlet_type,count(item_identifier) as no_of_product from big_mart
group by outlet_type 
order by no_of_product desc;

-- 27.WRITE a query to show count of item BY Outlet_Location_Type AND 
-- ordered it IN descending

select Outlet_Location_Type, count(item_identifier) as no_of_product from big_mart
group by Outlet_Location_Type
order by no_of_product desc;

-- 28.WRITE a query to show maximum MRP BY Item_Type

select Item_Type,max(item_mrp) from big_mart
group by Item_Type

-- 29.WRITE a query to show minimum MRP BY Item_Type

select Item_Type,min(item_mrp) from big_mart
group by Item_Type

-- 30.WRITE a query to show minimum MRP BY Outlet_Establishment_Year 
-- AND ordered it IN descending

select Outlet_Establishment_Year,min(item_mrp) from big_mart
group by Outlet_Establishment_Year 
order by min(item_mrp) desc;

-- 31.WRITE a query to show maximum MRP BY Outlet_Establishment_Year 
-- AND ordered IN descending

select Outlet_Establishment_Year,max(item_mrp) from big_mart
group by Outlet_Establishment_Year 
order by max(item_mrp) desc;

-- 32.WRITE a query to show average MRP BY Outlet_Size AND ordered IN 
-- descending

select Outlet_size,avg(item_mrp) from big_mart
group by outlet_size
order by avg(item_mrp) desc

-- 33.WRITE a query to show average MRP BY Outlet_Size

select Outlet_size,avg(item_mrp) from big_mart
group by outlet_size

-- 34.WRITE a query to show Average MRP BY Outlet_Type AND ordered IN 
-- ascending

select outlet_type,avg(item_mrp) from big_mart
group by outlet_type 
order by avg(item_mrp) asc;

-- 35.WRITE a query to show maximum MRP BY Outlet_Type

select outlet_type,max(item_mrp) from big_mart
group by outlet_type;

-- 36.WRITE a query to show maximum Item_Weight BY Item_Type 

select item_type,max(item_weight) from big_mart
group by item_type;

-- 37.WRITE a query to show maximum Item_Weight BY 
-- Outlet_Establishment_Year 

select Outlet_Establishment_Year,max(item_weight) from big_mart
group by Outlet_Establishment_Year;

-- 38.WRITE a query to show minimum Item_Weight BY Outlet_Type 

select Outlet_type,min(item_weight) from big_mart
group by Outlet_type;

-- 39.WRITE a query to show average Item_Weight BY 
-- Outlet_Location_Type ORDER BY descending

select Outlet_Location_Type,avg(item_weight) from big_mart
group by Outlet_Location_Type
order by avg(item_weight) desc;

-- 40.WRITE a query to show maximum Item_Outlet_Sales BY Item_Type

select Item_Type,max(Item_Outlet_Sales) from big_mart
group by Item_Type;

-- 41.WRITE a query to show minimum Item_Outlet_Sales BY Item_Type

select Item_Type,min(Item_Outlet_Sales) from big_mart
group by Item_Type;

-- 42.WRITE a query to show minimum Item_Outlet_Sales BY 
-- Outlet_Establishment_Year

select Outlet_establishment_year,min(item_outlet_sales) from big_mart bm 
group by Outlet_Establishment_Year;

-- 43.WRITE a query to show maximum Item_Outlet_Sales BY 
-- Outlet_Establishment_Year ordered BY descending

select Outlet_establishment_year,min(item_outlet_sales) from big_mart bm 
group by Outlet_Establishment_Year
order by min(item_outlet_sales) desc;

-- 44.WRITE a query to show average Item_Outlet_Sales BY Outlet_Size 
-- AND ORDER it itn descending

select Outlet_Size,avg(Item_Outlet_Sales) from big_mart bm 
group by Outlet_Size
order by avg(Item_Outlet_Sales) desc;

-- 45.WRITE a query to show average Item_Outlet_Sales BY Outlet_Size 

select Outlet_Size,avg(Item_Outlet_Sales) from big_mart bm 
group by outlet_size;

-- 46.WRITE a query to show average Item_Outlet_Sales BY Outlet_Type

select Outlet_Type,avg(Item_Outlet_Sales) from big_mart bm 
group by outlet_type;

-- 47.WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Type

select Outlet_Type,max(Item_Outlet_Sales) from big_mart bm 
group by outlet_type;

-- 48.WRITE a query to show total Item_Outlet_Sales BY Outlet_Establishment_Year

select Outlet_Establishment_Year,sum(Item_Outlet_Sales) from big_mart bm 
group by Outlet_Establishment_Year

-- 49.WRITE a query to show total Item_Outlet_Sales BY Item_Type

select item_type,sum(Item_Outlet_Sales) from big_mart bm 
group by item_type;

-- 50.WRITE a query to show total Item_Outlet_Sales BY Outlet_Location_Type

select Outlet_Location_Type,sum(Item_Outlet_Sales) from big_mart bm 
group by Outlet_Location_Type;

-- 51.WRITE a query to show total Item_Outlet_Sales BY Item_Fat_Content

select item_fat_content,sum(Item_Outlet_Sales) from big_mart bm 
group by item_fat_content;

-- 52.WRITE a query to show maximum Item_Visibility BY Item_Type

select item_type,max(Item_Visibility) from big_mart bm 
group by item_type;

-- 53.WRITE a query to show Minimum Item_Visibility BY Item_Type 

select item_type,min(Item_Visibility) from big_mart bm 
group by item_type; 

-- 54.WRITE a query to show total Item_Outlet_Sales BY Item_Type but 
-- ONLY WHERE Outlet_Location_Type IS Tier 1

select Item_Type,sum(Item_Outlet_Sales) from big_mart bm 
group by item_type;

-- 55.WRITE a query to show total Item_Outlet_Sales BY Item_Type WHERE 
-- Item_Fat_Content IS ONLY Low Fat & L

select Item_Type,sum(Item_Outlet_Sales) from big_mart
where item_fat_content in ("Low Fat","LF") group by item_type ;
