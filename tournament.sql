-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


drop database if exists tournament;
create database tournament;
\c tournament

-- players table is used for storing player information
-- the table has 2 fields: player id and player name
create table players (id serial primary key,
                      name varchar(50));

-- matches table is used for storing all matches finished in the tournament
-- the table has 3 fields: match id, winner id and loser id
create table matches (match_id serial primary key,
                      winner integer references players (id),
                      loser integer references players (id));
                      
-- this view is used to track how many matches each player has won
-- the view has 2 fields: player id, how many matches he has won
create view wins as
select id, count(winner) as won
from players left join matches
on id = winner
group by id
order by id;

-- this view is used to track how many matches each player has lost
-- the view has 2 fields: player id, how many matches he has won
create view loses as
select id, count(loser) as lost
from players left join matches
on id = loser
group by id
order by id;

-- this view is used for showing the current standing of players
-- the view has 4 fields: player id, player name, number of matches he won and played
create view standings as
select players.id, players.name, wins.won, wins.won + loses.lost as played
from players, wins, loses
where players.id = wins.id and wins.id = loses.id
order by wins.won desc, players.id asc