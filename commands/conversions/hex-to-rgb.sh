#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Hex to RGB
# @raycast.mode silent

# Optional parameters:
# @raycast.author Caleb Stauffer
# @raycast.authorURL https://github.com/crstauf
# @raycast.description Convert HEX color values to RGB values.
# @raycast.icon 🎨
# @raycast.argument1 { "type": "text", "placeholder": "HEX" }

hex=$1
first="${hex:0:1}"

if [ "#" = "$first" ]; then
	hex="${hex:1:6}"
fi

hex_r="${hex:0:2}"
hex_g="${hex:2:2}"
hex_b="${hex:4:2}"

rgb_r=`echo "obase=10; ibase=16; $hex_r" | bc`
rgb_g=`echo "obase=10; ibase=16; $hex_g" | bc`
rgb_b=`echo "obase=10; ibase=16; $hex_b" | bc`

rgb="rgb( $rgb_r, $rgb_g, $rgb_b )"

echo $rgb | pbcopy

echo "Converted #$hex to $rgb"