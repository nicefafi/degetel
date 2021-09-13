#!/bin/bash

FILE=./html/sites/default/files
if [ -L "$FILE" ]; then
  echo "$FILE est déjà relié"
else
  cd html/sites/default/ && ln -s ../../../files
  ls -la files/
fi
