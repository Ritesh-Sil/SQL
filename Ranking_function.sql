/*
Ranking functions - introduction

Now, we'll practice different functions that go well with OVER() – ranking functions. 
The general syntax is as follows:

			<function> OVER (ORDER BY <order by columns>)
			
As to OVER (ORDER BY col1, col2...), this is the part where we will specify the order in which rows should be sorted and therefore ranked.

**Acknowledgement and ref : learnsql.com

*/

/*

Function RANK()

The syntax is as follows:

		RANK() OVER (ORDER BY ...)
		
What does RANK() do? It returns the rank (a number) of each row with respect to the sorting specified within parentheses.

ORDER BY sorts rows and shows them in a specific order to you. 

RANK() OVER(ORDER BY ...) is a function that shows the rank(place, position) of each row in a separate column.

**Acknowledgement and ref : learnsql.com

*/


/*-------------------------------------------------------------
Exercise :-

For each game, show name, genre, date of update and its rank. The rank should be created with RANK() and take into account the date of update.

*/

SELECT
NAME,
GENRE,
UPDATED,
RANK() OVER(ORDER BY UPDATED)
FROM
GAME;



/*
DENSE_RANK()

As we said, RANK() will always leave gaps in numbering when more than 1 row share the same value. You can change that behavior by using another function: DENSE_RANK():
*/


/*-------------------------------------------------------------
Exercise :-
Use DENSE_RANK() and for each game, show name, size and the rank in terms of its size.


*/

SELECT
NAME,
SIZE,
DENSE_RANK() OVER(ORDER BY SIZE)
FROM GAME;



/*
ROW_NUMBER()

Each row gets its own, unique rank number, so even rows with the same value get consecutive numbers.

The only problem is with the order of these consecutive numbers. You could ask yourself – how does my database determine which of the games with editor_rating = 4 gets 1, 2 or 3 as the rank? The answer is – it doesn't, really. The order is nondeterministic. When you execute ROW_NUMBER(), you never really know what the output will be.

Acknowledgement and Ref : learnsql.com
*/


SELECT
  name,
  platform,
  editor_rating,
  ROW_NUMBER() OVER(ORDER BY editor_rating)
FROM game;



/*-------------------------------------------------------------
Exercise :-

Use ROW_NUMBER() and for each game, show their name, date of release and the rank based on the date of release.

*/

SELECT
NAME,
RELEASED,
ROW_NUMBER() OVER(ORDER BY RELEASED)
FROM GAME;





/*-------------------------------------------------------------
Exercise :-
For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.


*/

SELECT
NAME,
GENRE,
RELEASED,
RANK() OVER(ORDER BY RELEASED),
DENSE_RANK() OVER(ORDER BY RELEASED),
ROW_NUMBER() OVER(ORDER BY RELEASED)
FROM
GAME;


/*-------------------------------------------------------------
Exercise :-

Let's use DENSE_RANK() to show the latest games from our studio. For each game, show its name, genre, date of release and DENSE_RANK() in the descending order.

*/

SELECT
NAME,
GENRE,
RELEASED,
DENSE_RANK() OVER(ORDER BY RELEASED DESC)
FROM GAME;






/*-------------------------------------------------------------
Exercise :-

We want to find games which were both recently released and recently updated. For each game, show name, date of release and last update date, as well as their rank: use ROW_NUMBER(), sort by release date and then by update date, both in the descending order.

*/

SELECT
NAME,
RELEASED,
UPDATED,
ROW_NUMBER() OVER(ORDER BY RELEASED DESC,UPDATED DESC)
FROM
GAME;




/*-------------------------------------------------------------
Exercise :-
For each game find its name, genre, its rank by size. Order the games by date of release with newest games coming first.


*/

SELECT
NAME,
GENRE,
RANK() OVER(ORDER BY SIZE)
FROM GAME
ORDER BY RELEASED DESC;




/*-------------------------------------------------------------
Exercise :-

For each purchase, find the name of the game, the price, and the date of the purchase. Give purchases consecutive numbers by date when the purchase happened, so that the latest purchase gets number 1. Order the result by editor's rating of the game.

*/

SELECT
G.NAME,
P.PRICE,
P.DATE,
ROW_NUMBER() OVER(ORDER BY P.DATE DESC)
FROM 
GAME G
INNER JOIN
PURCHASE P ON P.GAME_ID=G.ID
ORDER BY G.EDITOR_RATING;




/*-------------------------------------------------------------
Exercise :-



*/







/*-------------------------------------------------------------
Exercise :-



*/