#!/bin/bash


find . -type f -name "*.pi" -exec rm {}  \;
find . -type f -name "*.dbg" -exec rm {} \;
find . -type f -name "*.err" -exec rm {} \;
find . -type f -name "*.time" -exec rm {} \;
find . -type f -name "*.interface" -exec rm {} \;
find . -type f -name "*.dbginterface" -exec rm {} \;
find . -type f -name "*.ast" -exec rm {} \;
