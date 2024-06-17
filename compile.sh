#!/bin/bash

java -cp .:$ANTLRJAR:$JSONJAR MiniCompiler "$@"
