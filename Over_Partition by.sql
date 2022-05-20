/*
Acknowledgement and Ref : 

I am thankful to the awsome portal *learnsql.com* for this wonderful sereis of concepts and exercises regarding the sql.


*/


/*
Exercise :- 
Show the id of each journey, its date and the number of journeys that took place on that date.

*/

select
id,
date,
count(id) over(partition by date)
from 
journey;


/*--------------------------------------------------
Range of OVER(PARTITION BY)

Exercise :-
Show id, model,first_class_places, second_class_places, and the number of trains of each model 
with more than 30 first class places and more than 180 second class places.

*/

select 
id,
model,
first_class_places,
second_class_places,
count(id) over(partition by model) 
from train 
where 
first_class_places >30 
and  second_class_places>180;


/*----------------------------------------------------
PARTITION BY MULTIPLE COLUMNS =========

Exercise :-
Show the id of each journey, the date on which it took place, the model of the train that was used, 
the max_speed of that train and the highest max_speed from all the trains that ever went on the same
 route on the same day.
*/

select 
j.id,
j.date,
t.model,
t.max_speed,
max(t.max_speed) over(partition by r.id,j.date)
from 
journey j,train t,route r
where 
j.train_id=t.id
and j.route_id=r.id;



/*------------------------------------------------------
Exercise : - 

For each journey, show its id, the production_year of the train on that journey, the number of 
journeys the train took and the number of journeys on the same route.

*/

select
j.id,
t.production_year,
count(j.id) over(partition by t.id),
count(j.id) over(partition by j.route_id)
from 
journey j, train t
where j.train_id=t.id;



/*---------------------------------------------------------
Exercise :-

For each ticket, show its id, price, date of its journey, the average price of tickets sold on that
day and the number of tickets sold on that day. Exclude journeys with train_id = 5.

*/
select
t.id,
t.price,
j.date,
avg(t.price) over(partition by j.date),
count(t.id) over(partition by j.date)
from 
journey j,ticket t
where j.id=t.journey_id and j.train_id<>5;




/*-------------------------------------------------------------
Exercise :-
For each ticket, show its id, price and, the column named ratio. The ratio is the ticket price to the 
sum of all ticket prices purchased on the same journey.
*/

select 
id,
price,
CAST(price as numeric)/sum(cast(price as numeric)) over(partition by journey_id) as ratio
from
ticket;


/*-------------------------------------------------------------
Exercise :-
For each employee, show their first_name, last_name, department, salary, 
as well as the minimal and maximal salary in that department.
*/

select
first_name,
last_name,
department,
salary,
min(salary) over(partition by department),
max(salary) over(partition by department)
from
employee;


/*-------------------------------------------------------------
Exercise :-
For each employee, show their first_name, last_name, department, salary and the proportion of their 
salary to the sum of all salaries in that department. To avoid the integer division remember to CAST the dividend to numeric.

*/

select
first_name,
last_name,
department,
salary,
salary::numeric / sum(salary) over(partition by department)
from
employee;


/*-------------------------------------------------------------
Exercise :-


*/
