#!/bin/bash


export CSCOPE_EDITOR=vim

ctags -R *

find . -name "*.[ch]" -o -name "*.cpp" -o -name "*.hpp" > cscope.files

cscope -q -R -b -i cscope.files

cscope -d

