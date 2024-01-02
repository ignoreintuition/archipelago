#!/bin/bash

# Build Archipelago
/Applications/PICO-8.app/Contents/MacOS/pico8 archipelago.p8 -export dist/archipelago.p8.png

# Run Archipelago
/Applications/PICO-8.app/Contents/MacOS/pico8 -windowed 0 -run archipelago.p8 