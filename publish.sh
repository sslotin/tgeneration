#!/bin/bash

for dir in $(ls ipynb)
do
    jupyter-nbconvert ipynb/$dir/*.ipynb
    mv ipynb/$dir/*.html html/$dir
    cp html/custom.css html/$dir/custom.css
done

rsync -r html root@185.246.65.88:/var/www/html
git add *
read -p "Commit description: " desc
git commit -m "$desc"
git push
