#!/bin/bash -e

#NOTE:  you don't normally need to execute this since generation of the generated code is handled by cmake

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ANTLR4_JAR=$SCRIPT_DIR/antlr4/antlr-4.6-complete.jar

GRAMMAR_FILE=$SCRIPT_DIR/src/Hello.g4
OUTPUT_DIR=$SCRIPT_DIR/src/generated
NAMESPACE=CookieParser

java -jar $ANTLR4_JAR \
    -Dlanguage=Cpp \
    -listener \
    -visitor \
    -o $OUTPUT_DIR \
    -package $NAMESPACE \
    $GRAMMAR_FILE


