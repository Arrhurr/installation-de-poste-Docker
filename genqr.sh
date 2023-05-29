#!/bin/bash
vari=$(cat iso.data)
dest=$(pwd)
docker run -v $dest:/work  sae103-qrcode qrcode -o qrcode.png "https://bigbrain.biz/$vari"