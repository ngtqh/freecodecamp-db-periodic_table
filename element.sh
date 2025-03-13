#!/bin/bash

USER_INPUT=$1
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN() {
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    OUTPUT_INFO $USER_INPUT
  fi
}

OUTPUT_INFO() {
  if [[ $USER_INPUT =~ ^[0-9]+$ ]]
  then
    CONDITION="atomic_number = $USER_INPUT"
  else
    CONDITION="symbol = '$USER_INPUT' OR name = '$USER_INPUT'"
  fi

  RESULT=$($PSQL "
  SELECT * FROM elements
  INNER JOIN properties USING(atomic_number)
  INNER JOIN types USING(type_id)
  WHERE $CONDITION")

  if [[ -z $RESULT ]] 
  then
    echo "I could not fint that element in the database."
    return
  fi

  echo "$RESULT" | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_C BOILING_C TYPE
  do
    echo "got it"
  done
}

MAIN $USER_INPUT