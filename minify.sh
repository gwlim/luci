#! /bin/bash
directory=./*
for file in $( find $directory -name '*.js' )
do
  echo $file
  java -jar compiler.jar --compilation_level=SIMPLE_OPTIMIZATIONS --js="$file" --js_output_file="$file-min.js"
  mv "$file" original_js_css/
  mv "$file-min.js" "$file"
done 

for file in $( find $directory -name '*.css' )
do
  echo $file
  java -jar yuicompressor-2.4.8pre.jar -o "$file-min.css" "$file"
  mv "$file" original_js_css/
  mv "$file-min.css" "$file"
done 