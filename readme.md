# Tournament Result
This is the project 4 for Full Stack Web Developer Nanodegree Program. In here, a PostgreSQL database schema is designed to simulate a tournament record system using Swiss round. A python module is also written to manipulate the database and tables defined by such schema.

## Database Schema Setup
- First make sure you have installed Python 2.7 and PostgreSQL.
- Make sure you also install the ```psycopg2``` package.
- Download the repository and unzip if necessary. Open your terminal, and move into the folder you just downloaded, in here you should see the following files: ```tournament.py```, ```tournament.sql```, ```tournament_test.py```.
- Now in your terminal, type ```psql``` so that you will log in to PostgresQL.
- Then type ```\i tournament.sql``` to import the database schema into PostgreSQL. This step will generate a new database called ```tournament``` and several tables and views within that database.
- Now we should make sure the database schema we just imported has nothing wrong, and we want to test it using unit test. In order to do that, type ```\q``` to quit PostgreSQL, and then type ```python tournament_test.py```, if everything is fine, you should see some message telling you that all the test has been passed.
- At this point, you have a database schema ready to record a Swiss round tournament. You can use ```tournament.py``` to manipulate with the database.

## More about database schema and code usage
In the database ```tournament```, we have two tables which are ```players``` and ```matches```. ```players``` table is used to track the currently registered players and ```matches``` table is used to record all the matches played in the tournament. You can find details about them in ```tournament.sql```.

In ```tournament.py``` we mainly use the following functions to manipulate the database. Of course, you are welcome to add more functions if you feel necessary.


```
deleteMatches()
```
Delete all the macthes recorded, and this will clear the ```matches``` table.


```
deletePlayers()
```
Delete all the players registered, and this will clear the ```players``` table.


```
registerPlayer(name)
```
Register a player in the tournament, this will create a new record in the ```players``` table, for example ```register("Chandra")```.


```
reportMatch(winner, loser)
```
Report a match result, and this will create a new record in the ```matches``` table. The winner are loser here refer to the id of the winner and loser, for example ```reportMatch(1, 2)``` means that the player with id 1 defeated player with id 2 in a match.


```
playerStandings()
```
Show the current standing of all the players. This function will return a list, each element in the list is a player's information. The player with highest score is in the first place.


```
swissPairings()
```
Base on the current standing, this function will return the pairings in the next round.This function will return a list, each element in the list is the pair of two plays who will fight in the next round.


## License
This project is licensed under the terms of the **MIT** license.