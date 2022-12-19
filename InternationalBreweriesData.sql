
---My SQL project for an International Brewery with different brands---

---Profit Analysis---
---1. Within the space of the three years, what was the profit worth of the breweries,
	---inclusive of Anglophone and Francophone territories?---
select sum(profit) as total_profit from breweries.pabod

---2. compare the total profit between these two territories in order for the territory manager, Mr. Stone make strategic decision that will aid profit maximization in 2020---
select countries, sum(profit) as profit_by_territory from breweries.pabod
where countries in('Nigeria', 'Ghana')
group by countries

select countries, sum(profit) as profit_by_territory from breweries.pabod
where countries in('Togo', 'Benin', 'Senegal')
group by countries

---3. country that generated the highest profit in 2019---
select countries, years, sum(profit) as highest_profit from breweries.pabod
where years = 2019
group by countries, years
order by 3 desc

---4. help him find the year with the highest profit---
select years, sum(profit) as highest_profit_year from breweries.pabod
group by years
order by 2 desc

---5. which month in the three years were the least profit generated?---
select months, years, sum(profit) as Least_profit_year from breweries.pabod
group by years, months
order by 3 asc

---6. what was the minimum profit in the month of December 2018?---
select years, months, profit as minimum_profit from breweries.pabod
where months = 'December' and years = 2018
group by years, months, profit
order by minimum_profit

---7. compare the profit in percentage for each of the month in 2019---

---8. which particular brand generated the highest profit in Senegal?---
select brands, countries, sum(profit) as highest_profit_senegal from breweries.pabod
where countries = 'Senegal'
group by countries, brands
order by 3 desc


---Brand Analysis---
---1. within the last two years, what are the top three brands consumed in Francophone countries---
select countries, brands, years, sum(quantity) as top_brands from breweries.pabod
where countries in('Senegal','Togo', 'Benin') and years in(2018,2019)
group by countries, brands, years
order by top_brands desc
limit 3

select countries, brands, years, sum(quantity) as top_brands from breweries.pabod
where countries not in('Nigeria','Ghana') and years not in(2017)
group by countries, brands, years
order by top_brands desc
limit 3

---2. find out the top two choice of consumer brands in Ghana---
select countries, brands, sum(quantity) as popular_brands_ghana from breweries.pabod
where countries = 'Ghana'
group by countries, brands
order by 3 desc
limit 2

---3. find out the details of beer consumed in the past three years in Nigeria---
select countries,brands, sum(quantity) as total_consumption_ngr from breweries.pabod
where countries = 'Nigeria' and brands not like '%malt'
group by countries, brands

---4. favourite malt brand in Anglophone region between 2018 and 2019---
select brands, countries, years, sum(quantity) as popular_malt from breweries.pabod
where countries in('Nigeria','Ghana') and brands like '%malt' and years in(2018,2019)
group by brands, countries, years
order by popular_malt desc

---5. which brands sold the highest in 2019 in Nigeria
select brands, countries, years, sum(quantity) as highest_sales_ngr from breweries.pabod
where countries = 'Nigeria' and years = 2019
group by brands, countries, years
order by highest_sales_ngr desc

---6. favourite brands in South-South region in Nigeria
select brands, region, countries, sum(quantity) as highest_by_region from breweries.pabod
where countries ='Nigeria' and region = 'southsouth'
group by brands, countries, region
order by 4 desc

---7. beer consumption in Nigeria---
---refer to three above---

---8. level of consumption of Budweiser in the regions in Nigeria---
select countries,brands,region,sum(quantity) as budweiser_sales from breweries.pabod
where countries = 'Nigeria' and brands = 'budweiser'
group by countries, brands, region
order by 4 desc

---9. level of consumption of Budweiser in the regions in Nigeria in 2019---
select countries,brands,region,years,sum(quantity) as budweiser_sales from breweries.pabod
where countries = 'Nigeria' and brands = 'budweiser' and years = 2019
group by countries, brands, region, years
order by 5 desc

---Countries Analysis---
---1. country with the highest consumption of beer---
select countries,sum(quantity) as country_consumption from breweries.pabod
where brands not like '%malt'
group by countries
order by 2 desc

---2. highest sales personel of Budweiser in Senegal---
select sales_rep,brands,countries,sum(quantity) as top_salesrep from breweries.pabod
where countries = 'Senegal' and brands = 'budweiser'
group by sales_rep,countries,brands
order by top_salesrep desc

---3. country with the highest profit of the fourth quarter in 2019---
select countries,years,sum(profit)as highest_profit
from breweries.pabod
where months in('October','November','December') and years = 2019
group by countries,years
order by highest_profit desc