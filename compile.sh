#!/bin/sh

# Constants
IMAGE=jpdias92/cv-template-latex:1.00
CV_DIR=cvs/template-cv
CV_TEX_FILE=template-cv.tex

cd $(dirname $0)

exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" bash -c \
"ls; pwd;
cp twentysecondcv.cls $CV_DIR; cp -R fonts/ $CV_DIR/
latexmk -pdflatex=lualatex -cd -f -interaction=batchmode -pdf $CV_DIR/$CV_TEX_FILE
rm $CV_DIR/twentysecondcv.cls; rm -rf $CV_DIR/fonts"
