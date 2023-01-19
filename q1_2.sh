#!/bin/bash
echo "q1 answer: "
docker build --help | grep '\--i' | grep 'id'
echo "q2 answer: "
docker run --rm python:3.9 pip list | grep "[0-9]*.[0-9]\$" | wc -l
