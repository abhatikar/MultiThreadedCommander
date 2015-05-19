#!/bin/bash

for dir in $(ls Code) ;
do

cd Code/$dir
git pull
cd -

done
