#! /bin/bash
brillo=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
brillo=$(expr $brillo + 301)
echo $brillo > /sys/class/backlight/amdgpu_bl0/brightness
