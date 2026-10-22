select director,country,listed_in,count(*) from netflix
where not director = "" and not country = "" 
group by director,country,listed_in 
order by country,count(*) desc; 

select director,country,listed_in,count(*) from netflix
where not director = "" and country = "Japan" and listed_in like "%Anime Series%Kids' TV%"
group by director,country,listed_in 
order by country,count(*) desc; 


create table netflix_staging1 as (select * from netflix);

select count(*) from netflix_staging1 where country = "";

with cte as
(select director,country,count(*) from netflix_staging1
where not director = "" and not country =""
group by director,country 
order by count(*) desc)

update netflix_staging1 
set country = (select country from cte where netflix_staging1.country = cte.country limit 1) 
where not director = "" and country = "";

select count(*) from netflix_staging1 where director = "" and country = "";


with director_assign as 
(select director,country,listed_in,count(*) from netflix_staging1 
where not director = "" and not country = "" 
group by director,country,listed_in
order by count(*) desc )

update netflix_staging1 set director = (select director_assign.director from director_assign 
where netflix_staging1.country=director_assign.country 
and netflix_staging1.listed_in=director_assign.listed_in limit 1) where director = "" and not country = "";
 
select count(*) from netflix_staging1 where director = "Not Given";