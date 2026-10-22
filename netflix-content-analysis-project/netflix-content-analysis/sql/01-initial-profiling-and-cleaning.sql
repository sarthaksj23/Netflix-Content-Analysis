#CREATING THE SCHEMA
CREATE DATABASE Netflix;
USE Netflix;

#CREATING THE TABLE 
CREATE TABLE netflix (show_id text, type text, title text, director text, cast text, country text, date_added text, release_year int, rating text, duration text, listed_in text, `description` text);

# LOADING THE DATA FROM CSV
LOAD DATA INFILE "C:/Users/sarth/OneDrive/Desktop/Analyst/My projects/netflix raw and not cleaned/netflix.csv" INTO TABLE netflix
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

# DUPLICATES
SELECT show_id, count(*)
FROM netflix
GROUP BY show_id
ORDER BY show_id  DESC;
# NO DUPLICATES FOUND

# Checking SHow_id Column
SELECT * FROM netflix 
WHERE show_id IS NULL OR
show_id = ""; 


# Checking the type column
# 1. if there are any other type
SELECT count(*) FROM netflix 
GROUP BY `type`;

# 2. if there are nulls or empty values
SELECT * FROM netflix 
WHERE `type` IS NULL OR
`type` = "";


# title column

SELECT title FROM netflix
WHERE title = "" or title IS NULL;


# DIRECTOR COLUMN
SELECT director, count(*) FROM netflix
WHERE director = "" ;

# checking nulls 
select count(*) from netflix
where director = "" and cast = "" and country = "" and director is null;

# ---------------------------------ALL HIT AND TRIALS BELOW!!!!!!-------------------------------------
delete from netflix where director = "" and cast = "" and country = "";

select * from netflix;


select director,country,listed_in,count(*) from netflix
where director="" and not country = "" and not listed_in =""
group by country,listed_in
having count(*) >10
order by country,count(*) desc;

#1. 
update netflix set director = 'Hernán Guerschuny' 
where director = "" and country = "Argentina" and listed_in = "Crime TV Shows, International TV Shows, Spanish-Language TV Shows";

#2. 
update netflix set director = 'Tony Collingwood' 
where director = "" and country = "Canada" and listed_in = "Kids' TV";

#3. 
update netflix set director = 'Richard Weston' 
where director = "" and country = "Canada" and listed_in = "Children & Family Movies";

#4. 
update netflix set director = 'Richard Weston' 
where director = "" and country = "Canada" and listed_in = "Children & Family Movies";

#5.
update netflix set director = "Alejandro Lozano"
where director = "" and country = "Colombia" and listed_in = "Crime TV Shows, International TV Shows, Spanish-Language TV Shows";

#6.
update netflix set director = "Kenny Ortega"
where director = "" and country = "United States" and listed_in = "Kids' TV";

#7.
update netflix set director = "Michael Simon"
where director = "" and country = "United States" and listed_in = "Reality TV";

#7.
update netflix set director = "Ryan Polito"
where director = "" and country = "United States" and listed_in = "TV Comedies";

#8.
update netflix set director = "Ken Burns"
where director = "" and country = "United States" and listed_in = "Docuseries";

#9.
update netflix set director = "Kenny Ortega"
where director = "" and country = "United States" and listed_in = "Kids' TV, TV Comedies";

#10.
update netflix set director = "Daniel Minahan"
where director = "" and country = "United States" and listed_in = "TV Dramas";

#11.
update netflix set director = "Billy Corben"
where director = "" and country = "United States" and listed_in = "Crime TV Shows, Docuseries";

#12.
update netflix set director = "Everardo Gout"
where director = "" and country = "United States" and listed_in = "Docuseries, Science & Nature TV";

#13.
update netflix set director = "Jay Chandrasekhar"
where director = "" and country = "United States" and listed_in = "TV Comedies, TV Dramas";


select director,country,listed_in,count(*) from netflix
where director="" and not country = "" and not listed_in =""
group by country,listed_in
having count(*) >10
order by country,count(*) desc;


#14.
update netflix set director = "Stan Lathan"
where director = "" and country = "United States" and listed_in = "Stand-Up Comedy & Talk Shows, TV Comedies";

#15.
update netflix set director = "Michèle Ohayon"
where director = "" and country = "United States" and listed_in = "Documentaries";

#16.
update netflix set director = "Not Given"
where director = "" and country = "United States" and listed_in = "Docuseries, Reality TV";

#17.
update netflix set director = "Not Given"
where director = "" and country = "United States" and listed_in = "Crime TV Shows, TV Dramas";

#18.
update netflix set director = "Rob Seidenglanz"
where director = "" and country = "United States" and listed_in = "Crime TV Shows, TV Dramas, TV Mysteries";

#19.
update netflix set director = "Shin Won-ho"
where director = "" and country = "South Korea" and listed_in = "International TV Shows, Korean TV Shows, Romantic TV Shows";


select director,country,listed_in,count(*) from netflix
where director="" and not country = "" and not listed_in =""
group by country,listed_in
having count(*) >10
order by country,count(*) desc;


#20.
update netflix set director = "Chang-Min Lee"
where director = "" and country = "South Korea" and listed_in = "Crime TV Shows, International TV Shows, Korean TV Shows";

#21.
update netflix set director = "Lee Kyoungmi, Yim Pilsung, Jeon Go-woon, Kim Jong-kwan"
where director = "" and country = "South Korea" and listed_in = "International TV Shows, Korean TV Shows, TV Dramas";

#22.
update netflix set director = "Hsu Fu-chun"
where director = "" and country = "Taiwan" and listed_in = "International TV Shows, Romantic TV Shows, TV Comedies";

#23.
update netflix set director = "Alastair Fothergill"
where director = "" and country = "United Kingdom" and listed_in = "British TV Shows, Docuseries, International TV Shows";

#24.
update netflix set director = "Not Given"
where director = "" and country = "United Kingdom" and listed_in = "British TV Shows, International TV Shows, Reality TV";

#25.
update netflix set director = "Not Given"
where director = "" and country = "United Kingdom" and listed_in = "British TV Shows, International TV Shows, TV Comedies";

#26.
update netflix set director = "Not Given"
where director = "" and country = "United Kingdom" and listed_in = "British TV Shows, Docuseries, Science & Nature TV";

#27.
update netflix set director = "Jakob Verbruggen"
where director = "" and country = "United Kingdom" and listed_in = "British TV Shows, Crime TV Shows, International TV Shows";

#28.
update netflix set director = "Ellena Wood, Jesse Vile"
where director = "" and country = "United Kingdom" and listed_in = "British TV Shows, Crime TV Shows, Docuseries";

#29.
update netflix set director = "Felipe Cano"
where director = "" and country = "Mexico" and listed_in = "Crime TV Shows, International TV Shows, Spanish-Language TV Shows";


select director,country,listed_in,count(*) from netflix
where director="" and not country = "" and not listed_in =""
group by country,listed_in
having count(*) >10
order by country,count(*) desc;


#30.
update netflix set director = "Mateo Gil"
where director = "" and country = "Spain" and listed_in = "Crime TV Shows, International TV Shows, Spanish-Language TV Shows";

#31.
update netflix set director = "Go Koga"
where director = "" and country = "Japan" and listed_in = "Anime Series, Kids' TV";


select count(*) from netflix where director="Not Given";

select director,country,listed_in,count(*) from netflix
where director="" and not country = "" and not listed_in =""
group by country,listed_in
having count(*) =6
order by count(*) desc;

create table netflix_staging1 as (select * from netflix);

with cte as
(select director,country,count(*) from netflix_staging1
where not director = "" and not country ="" 
group by director,country 
order by count(*) desc)

update netflix_staging1 
set country = (select country from cte where netflix_staging1.country = cte.country limit 1) 
where not director = "" and country ="";

select count(*) from netflix_staging1 where director = "" and country = "";


with director_assign as 
(select director,country,listed_in,count(*) from netflix_staging1 
where not director = "" and not country = "" 
group by director,country,listed_in
order by count(*) desc )

update netflix_staging1 set director = (select director_assign.director from director_assign 
where netflix_staging1.country=director_assign.country 
and netflix_staging1.listed_in=director_assign.listed_in limit 1) where director ="" and not country = "";
 
select * from netflix_staging1 where country = "" and director = "";
delete from netflix_staging1 where country = "" and director = "";

select * from netflix_staging1 where country is null;
