#!/bin/bash
if test $3 = 1
then
docker run -v $(pwd):/work bigpapoo/sae103-html2pdf "html2pdf $1 $2"
else
docker container run -v $(pwd):/work sae103-html2pdf "html2pdf $1 $2"
fi
