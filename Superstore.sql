Create database Superstore;
use Superstore;
select*from superstore;
#1.Total number of Orders
select count('order id') as Total_Orders 
from superstore;
#2.Total number of Sales
select round(sum(sales)) as Total_Sales
from superstore;
#3.Total number of Profit
select round(sum(profit)) as Total_Profit
from superstore;
#4.Average Profit Per Order
select round(avg(Total_Profit)) as Average_Profit_Per_Order
from(
select 'order id',sum(profit) as Total_Profit
from superstore
group by 'order id'
) as Order_Profits;
#5.Top 10 Product by Sales
select 'product name', round(sum(sales)) as Total_Sales
from superstore
group by 'product name'
order by Total_Sales desc
limit 10;
#6.Total  Sales And Profit By Region
select region,round(sum(sales)) as Total_Sales,round(sum(profit)) as Total_Profit
from superstore
group by region
order by Total_Sales Desc;
#7.Country-Wise Total Number Of Orders
select state,count(distinct 'order id') as Total_Orders
from superstore
group by state
order by Total_Orders desc;
#8.Number of Orders As Priority
select 'order priority',count(distinct 'order id') as Total_Orders
from superstore
group by 'order priority'
order by Total_Orders desc;
#9.Sales quantity for each year
select year('order date') as year,sum(quantity) as Total_Quantity
from superstore
group by year('order date')
order by  year;
#10.Sales Profit for each year
select year('order date') as year,round(sum(profit)) as Total_Profit
from superstore
group by year('order date')
order by  year;
#11.State-Wise Shipping Cost
SELECT State, count('Shipping Cost') AS Total_Shipping_Cost
FROM superstore
GROUP BY State
ORDER BY Total_Shipping_Cost DESC;
#12.Category-wise Sales
SELECT Category, 'Sub category', round(SUM(Sales)) AS Total_Sales
FROM superstore
GROUP BY Category, 'sub category'
ORDER BY Category, Total_Sales DESC;
#13.5 TOP SUBCATEGORIES BY PROFIT
SELECT 'Sub category', round(SUM(Profit)) AS Total_Profit
FROM superstore
GROUP BY 'Sub category'
ORDER BY Total_Profit DESC
LIMIT 5;
#14.PROFIT MARGIN BY PRODUCT CATEGORY
SELECT Category, 
       round(SUM(Profit)) / round(SUM(Sales)) * 100 AS Profit_Margin
FROM superstore
GROUP BY Category;
#15.Total Sales by Customer
select 'customer name',format(sum(sales),0) as Total_Sales_By_Customer
from superstore
group by 'customer name'
order by Total_Sales_By_Customer Desc;
#16.On-Time Delivery Analysis--To count how many orders where delivered on time
select 'on-time status',count(*) as Delivered_on_Time
from superstore
group by  'on-time status';





