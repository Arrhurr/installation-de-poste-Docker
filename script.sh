#!/bin/bash
set -x
./image.sh

for file in $1/*.txt; 
do
dest=$(pwd)

#Recupere les informations provenant des fichiers textes pour les placer dans 3 fichiers
docker container run -v "$dest":/work sae103-php php -f script_principal.php "$file"

#execute le scipt qui genere le qrcode
./genqr.sh
php iso.php "$file"
iso=iso.data
tmp="${file%.txt}"
region="${tmp##*/}"
echo "$region"
docker container run -v "$dest":/work sae103-php php -f script-html.php > "$region".html
./html2pdf.sh "$region".html "$2"/"$iso"-"$region".pdf 0
done

