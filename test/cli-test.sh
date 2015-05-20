#!/bin/sh
#
# Quick and dirty script to exercise all of the cli functions

set -e

TEST_DIR=/tmp/s3ts-test
rm -rf $TEST_DIR

export S3TS_LOCALCACHE=$TEST_DIR/cache

s3ts() {
    PYTHONPATH=src ./python-venv/bin/python src/s3ts/main.py "$@"
}

s3ts init
s3ts upload src-1.0 src
s3ts upload test test
s3ts prime-cache src
s3ts download src-1.0
s3ts download test
s3ts install src-1.0 $TEST_DIR/src-1.0
s3ts install test $TEST_DIR/test
s3ts list
s3ts info src-1.0


