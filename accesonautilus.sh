#!/bin/bash
#Script para redimencionar imagenes al 50% para Nautilus
#
########## Declaro Variables ##########
#
let ContOk=0
let ContNo=0

#
########## Funciones ##########
#
#funtion convertir {
#   [[ "$1" != rs_* ]] && convert -resize 50% $1 "rs_${1}"
#}
#
########## Main ##########
#
# Verifico si puedo escribir en la Carpeta
if [[ ! -w `pwd` ]] && exit 0
echo "Verifico y puedo Escribit"
#case $@ in
#   *.jpg) convertir $1 && let ContOk+1;;
#   *)  let ContNo+1;;
#echo "Converti $ContOk Archivos, sin embargo no realizé cambios en $ContNo Archivos"

#
########## Borro Temporales ##########
#

#
########## Fin Script ##########


