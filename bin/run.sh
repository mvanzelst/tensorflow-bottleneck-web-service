#!/bin/sh

ROOT=$(realpath $(dirname ${0})/..)

python \
    ${ROOT}/src/app.py \
    ${ROOT}/example/tensorflow-logo.jpg
