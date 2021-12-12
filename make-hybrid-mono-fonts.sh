#!/bin/bash

# Base
BASE_COPYRIGHT="Copyright (c) 2021, Ghazy Abdallah (https://github.com/aster-phoenix)."


# Define fonts

# JetBrains Mono
JB_VER=2.242
JB_LINK=https://github.com/JetBrains/JetBrainsMono/releases/download/v$JB_VER/JetBrainsMono-$JB_VER.zip
JB_COPYRIGHT="Copyright (c) 2020, The JetBrains Mono Project Authors (https://github.com/JetBrains/JetBrainsMono)."
wget $JB_LINK -O jb.zip
unzip jb.zip -d jb

# Fira Code
FR_VER=6.2
FR_LINK=https://github.com/tonsky/FiraCode/releases/download/$FR_VER/Fira_Code_v$FR_VER.zip
FR_COPYRIGHT="Copyright (c) 2014, The Fira Code Project Authors (https://github.com/tonsky/FiraCode)."
wget $FR_LINK -O fr.zip
unzip fr.zip -d fr

# Kawkab Mono
KK_VER=0.501
KK_LINK=https://github.com/aiaf/kawkab-mono/releases/download/v$KK_VER/kawkab-mono-$KK_VER.zip
KK_COPYRIGHT="Copyright (c) 2015, Abdullah Arif (https://github.com/aiaf/kawkab-mono)."
wget $KK_LINK -O kk.zip
unzip kk.zip -d kk

# Vazir Code
VZ_VER=1.1.2
VZ_LINK=https://github.com/rastikerdar/vazir-code-font/releases/download/v$VZ_VER/vazir-code-font-v$VZ_VER.zip
VZ_COPYRIGHT="Copyright (c) 2016, Vazir Code Font Project Authors (https://github.com/rastikerdar/vazir-code-font)."
wget $VZ_LINK -O vz.zip
unzip vz.zip -d vz


# Merge fonts

# JetBrains Mono + Kawkab Mono
FONT_NAME="JetBrains-Mono-Kawkab-Regular"
FONT_FAMILY="JetBrains Mono Kawkab"
FONT_FULLNAME="JetBrains Mono Kawkab Regular"
FONT_WEIGHT="Regular"
FONT_COPYRIGHT="$BASE_COPYRIGHT $JB_COPYRIGHT $KK_COPYRIGHT"

FONT1=jb/fonts/ttf/JetBrainsMono-Regular.ttf
FONT2=kk/kawkab-mono-$KK_VER/KawkabMono-Regular.ttf
RESULT_FONT=JetBrains-Mono-Kawkab-Regular.ttf

fontforge -lang=ff -script merge.ff "$FONT1" "$FONT2" "$FONT_NAME" "$FONT_FAMILY" "$FONT_FULLNAME" "$FONT_WEIGHT" "$FONT_COPYRIGHT" "$RESULT_FONT"


# JetBrains Mono + Vazir Code
FONT_NAME="JetBrains-Mono-Vazir-Regular"
FONT_FAMILY="JetBrains Mono Vazir"
FONT_FULLNAME="JetBrains Mono Vazir Regular"
FONT_WEIGHT="Regular"
FONT_COPYRIGHT="$BASE_COPYRIGHT $JB_COPYRIGHT $VZ_COPYRIGHT"

FONT1=jb/fonts/ttf/JetBrainsMono-Regular.ttf
FONT2=vz/Without-Latin/Vazir-Code-WOL.ttf
RESULT_FONT=JetBrains-Mono-Vazir-Regular.ttf

fontforge -lang=ff -script merge.ff "$FONT1" "$FONT2" "$FONT_NAME" "$FONT_FAMILY" "$FONT_FULLNAME" "$FONT_WEIGHT" "$FONT_COPYRIGHT" "$RESULT_FONT"

# Fira Code + Kawkab Mono
FONT_NAME="FiraCode-Kawkab-Regular"
FONT_FAMILY="FiraCode Kawkab"
FONT_FULLNAME="FiraCode Kawkab Regular"
FONT_WEIGHT="Regular"
FONT_COPYRIGHT="$BASE_COPYRIGHT $FR_COPYRIGHT $KK_COPYRIGHT"

FONT1=fr/ttf/FiraCode-Regular.ttf
FONT2=kk/kawkab-mono-$KK_VER/KawkabMono-Regular.ttf
RESULT_FONT=FiraCode-Kawkab-Regular.ttf

fontforge -lang=ff -script merge.ff "$FONT1" "$FONT2" "$FONT_NAME" "$FONT_FAMILY" "$FONT_FULLNAME" "$FONT_WEIGHT" "$FONT_COPYRIGHT" "$RESULT_FONT"

# Fira Code + Vazir Code
FONT_NAME="FiraCode-Vazir-Regular"
FONT_FAMILY="FiraCode Vazir"
FONT_FULLNAME="FiraCode Vazir Regular"
FONT_WEIGHT="Regular"
FONT_COPYRIGHT="$BASE_COPYRIGHT $FR_COPYRIGHT $VZ_COPYRIGHT"

FONT1=fr/ttf/FiraCode-Regular.ttf
FONT2=vz/Without-Latin/Vazir-Code-WOL.ttf
RESULT_FONT=FiraCode-Vazir-Regular.ttf

fontforge -lang=ff -script merge.ff "$FONT1" "$FONT2" "$FONT_NAME" "$FONT_FAMILY" "$FONT_FULLNAME" "$FONT_WEIGHT" "$FONT_COPYRIGHT" "$RESULT_FONT"


# Archive fonts
zip hybrid-mono-fonts.zip *.ttf
