#!/bin/bash

docker build -t proxy . || {
    echo "Error while building image."
    exit 1
}