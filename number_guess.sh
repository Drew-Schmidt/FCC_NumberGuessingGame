#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

# request usernamme
echo "Enter your username:"
read USERNAME

# check if existing
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# if RETURNING user
if [[ -n $USER_ID ]]
then
  USER_DATA=$($PSQL "SELECT games_played,best_game FROM users WHERE user_id = $USER_ID")
  echo $USER_DATA | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
# if NEW user
else
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  NEW_USER=$($PSQL "INSERT INTO users(username,games_played) VALUES('$USERNAME',0)")
fi

# request user guess
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# if not a number
while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read USER_GUESS
done

# generate secret number and start guess counter
SECRET_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
NUMBER_OF_GUESSES='1'

# if wrong guess, give hint (higher/lower) , keep count of guesses
while [[ ! $USER_GUESS -eq $SECRET_NUMBER ]]
do
  # if higher than secret number
  if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    read USER_GUESS
  # if lower than secret number
  elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    read USER_GUESS
  fi 
done
  
  # if correct answer, add count and increment games played
  if [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  then
    echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    # check best game is not empty or new score is high score.
    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -le $BEST_GAME ]]
    then 
      # if new best score, update score and increment games played
      NEW_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES, games_played = games_played + 1 WHERE username = '$USERNAME'")  
    else
      # if not new best score, increment games played only
      ADD_GAME_COUNT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
  fi
fi 