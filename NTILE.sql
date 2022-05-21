/*
Acknowledgement and Ref : 
I am thankful to the awsome portal *learnsql.com* for this wonderful sereis of concepts and exercises regarding the sql.
*/

/*

NTILE(X)

It distributes the rows into a specific number of groups, provided as X. For instance:

SELECT
  name,
  genre,
  editor_rating,
  NTILE(3) OVER (ORDER BY editor_rating DESC)
FROM game;


In the above example, we create three groups with NTILE(3) that are divided based on the values in the column editor_rating. The "best" games will beput in group 1, "average" games in group 2, "worst" games in group 3.


*/

/*-------------------------------------------------------------
Exercise :-

Split the games into 5 groups based on their date of last update. The most recently updated games should come first. For each of them, show the name, genre, date of update and the group they were assigned to. In the result, notice how many items the groups have (varying value).

*/

SELECT
NAME,
GENRE,
UPDATED,
NTILE(5) OVER(ORDER BY UPDATED DESC)
FROM GAME;
