#!/usr/bin/env bash

flameshot gui --raw > /tmp/image.png

convert /tmp/image.png \
   \( +clone  -alpha extract \
      -draw 'fill black polygon 0,0 0,15 15,0 fill white circle 15,15 15,0' \
      \( +clone -flip \) -compose Multiply -composite \
      \( +clone -flop \) -compose Multiply -composite \
   \) -alpha off -compose CopyOpacity -composite  /tmp/image.png

# shadow
convert /tmp/image.png \
  \( +clone -background black -shadow 40x5+0+0 \) \
  +swap -background none -layers merge +repage /tmp/image.png;

# white backdrop
convert /tmp/image.png -bordercolor white -border 10 /tmp/image.png

# copy to clipboard
xclip -selection clipboard -i /tmp/image.png -t image/png
