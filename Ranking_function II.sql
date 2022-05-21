/*-------------------------------------------------------------
Exercise :-

Find the name, genre and size of the smallest game in our studio.

Remember the steps:

Create the ranking query so that the smallest game gets rank 1.
Use WITH to select rows with rank 1.

*/

WITH RANKING AS (
	SELECT NAME,GENRE,SIZE,RANK() OVER(ORDER BY SIZE ) AS rank
  FROM GAME
)

SELECT NAME,GENRE,SIZE FROM RANKING WHERE rank=1;


/*-------------------------------------------------------------
Exercise :-

Show the name, platform and update date of the second most recently updated game.

*/

WITH RANKING AS 
(
	SELECT NAME,PLATFORM,UPDATED,DENSE_RANK() OVER(ORDER BY UPDATED DESC) AS RANK
  FROM GAME
)

SELECT NAME,PLATFORM,UPDATED FROM RANKING WHERE RANK =2;

/*-------------------------------------------------------------
Exercise :-

For each application, show its name, average_rating and its rank, with best rated apps coming first.

*/

select name,average_rating,dense_rank() over(order by average_rating desc) as rank
from application



/*-------------------------------------------------------------
Exercise :-

Find the application that ranked 3rd in terms of the greatest number of downloads.
Show its name and the number of downloads.

*/

with ranking as
(
	select name,downloads,dense_rank() over(order by downloads desc) as rank from application
)

select name,downloads from ranking where rank = 3;



/*-------------------------------------------------------------
Exercise :-



*/