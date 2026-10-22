#-----------------2nd AND THE SUCCESSFUL TRY TOWARDS THE CLEANING OF DATASET-----------------
use netflix;

# CREATING BACKUP
create table newnet as select * from netflix;

update newnet set director = null where director = ""; 
update newnet set country = null where country = ""; 
update newnet set cast = null where cast = "";

select * from newnet where country ="";

# filling country using director and country
with fill_country as
(select country,director,count(*) from newnet 
where director is not null and country is not null
group by country,director 
order by count(*) desc)

update newnet set country = (select country from fill_country where newnet.director = fill_country.director limit 1)
where director is not null and country is null; 


#filling country using cast
with cast_fill as
(select cast,country,count(*) from newnet 
where cast is not null and country is not null
group by cast,country
order by count(*) desc)

update newnet set country = (select country from cast_fill where newnet.cast=cast_fill.cast limit 1) 
where country is null and cast is not null;


select * from newnet where director is null;

# filling director using country and genre
with fill_director as
(select director,country,listed_in,count(*) from newnet
where country is not null and director is not null
group by director,country,listed_in 
order by count(*) desc)

update newnet set director = (select director from fill_director where newnet.country=fill_director.country and newnet.listed_in=fill_director.listed_in limit 1) 
where director is null and country is not null and listed_in is not null;



# filling director using country and cast
with fill_director1 as
(select director,country,cast,count(*) from newnet
where country is not null and director is not null and cast is not null
group by director,country,cast 
order by count(*) desc)

update newnet set director = (select director from fill_director1 where newnet.country=fill_director1.country and newnet.cast=fill_director1.cast limit 1) 
where director is null and country is not null and cast is not null;



# filling director using cast and genre
with fill_director2 as
(select director,listed_in,cast,count(*) from newnet
where director is not null and cast is not null and listed_in is not null 
group by director,cast,listed_in
order by count(*) desc)

update newnet set director = (select director from fill_director2 where newnet.cast=fill_director2.cast and newnet.listed_in=fill_director2.listed_in limit 1) 
where director is null and cast is not null and listed_in is not null;


select * from newnet where director = "Not Given";
update newnet set director = null where director = "Not Given";

select * from newnet where rating = "";
delete from newnet where rating = "";
select * from newnet;
alter table newnet drop column description;

select * from newnet where rating is null;
select * from newnet where rating like "%min";
delete from newnet where rating like "%min";


select * from newnet where country is null;
select * from newnet where director is null;
delete from newnet where director is null and country is null ;
update newnet set director = "Not Given" where director is null; 
update newnet set country = "Not Given" where country is null;

select * from newnet;