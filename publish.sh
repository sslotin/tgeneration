#!/bin/bash

jupyter-nbconvert `find content -name *.ipynb`

for dir in $(find content -type d | tail +2)
do
    cp content/custom.css $dir/custom.css
    cp content/custom.js $dir/custom.js
done

rsync -r content root@tgeneration.ru:/var/www
git add *
read -p "Commit description: " desc
git commit -m "$desc"
git push
