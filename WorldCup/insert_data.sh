#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
#do echo "$YEAR | $ROUND | $WINNER | $OPPONENT | $WINNER_GOALS | $OPPONENT_GOALS"
do 
#echo "$WINNER | $OPPONENT"
#check if winner country exist
WINNER_TEAM=$($PSQL "select team_id from teams where name='$WINNER'")
OPPONENT_TEAM=$($PSQL "select team_id from teams where name='$OPPONENT'")
if [[ -z $WINNER_TEAM ]]
then INSERT_TEAM=$($PSQL "insert into teams(name) values ('$WINNER')") 
#refetch team id
WINNER_TEAM=$($PSQL "select team_id from teams where name='$WINNER'")
fi
 if [[ -z $OPPONENT_TEAM ]]
 then INSERT_OPPONENT_TEAM=$($PSQL "insert into teams(name) values ('$OPPONENT')") 
 #refetch team id
 OPPONENT_TEAM=$($PSQL "select team_id from teams where name='$OPPONENT'")
 fi

# Insert game record;
 $PSQL "insert into games (round, year,winner_id, opponent_id, winner_goals, opponent_goals) values ('$ROUND',$YEAR,$WINNER_TEAM,$OPPONENT_TEAM,$WINNER_GOALS,$OPPONENT_GOALS)"
done