#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

source $DIR/common.sh

for REPOSITORY in $REPOSITORIES
do
  cd $DIR/$REPOSITORY && \
  git pull git@github.com:$GIT_ORGANIZATION/$REPOSITORY.git
done
