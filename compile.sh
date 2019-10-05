#!/bin/sh
IMAGE=jpdias92/cv-template-latex:1.00
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" latexmk -pdflatex=lualatex -cd -f -interaction=batchmode -pdf template.tex
