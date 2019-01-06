#!/bin/bash

jupyter-nbconvert `find html -name *.ipynb`

for dir in $(find html -type d | tail +2)
do
    cp html/custom.css $dir/custom.css
    cp html/custom.js $dir/custom.js
done

rsync -r html root@tgeneration.ru:/var/www
git add *
read -p "Commit description: " desc
git commit -m "$desc"
git push
