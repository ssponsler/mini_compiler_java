#!/bin/bash

clang tests/test.ll -o tests/test
sleep 1
./tests/test