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
  echo $USER_INPUT
}

MAIN $USER_INPUT