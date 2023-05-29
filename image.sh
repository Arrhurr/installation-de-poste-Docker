#!/bin/bash
adresse=$(pwd) #on recupère l'adresse du fichier
for image in ./photos/*.svg #on récupère les images
do
	tmp=${image%.svg}
	if test $1 = 1
		then
    			docker run -v $adresse/:/work bigpapoo/sae103-imagick "magick ./$image -shave 45x45 -resize 200x200  -colorspace Gray ./$tmp.png"
    		else
    			docker run -v $adresse/:/work sae103-imagick "magick ./$image.svg -shave 45x45 -resize 200x200  -colorspace Gray ./$tmp.png"
fi
done
