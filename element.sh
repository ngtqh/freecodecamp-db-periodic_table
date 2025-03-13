#!/bin/bash

USER_INPUT=$1

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