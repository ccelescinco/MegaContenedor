#!/bin/bash
#Script para redimencionar imagenes (por ahora JPG) al 50% para Nautilus
#
########## Declaro Variables ##########
#
let ContJPG=0
let ContNo=0
#
########## Funciones ##########
#
function chequeo {
dpkg -l | grep zenity &> /dev/null
if [ "$?" != "0" ] ; then
  echo "No Puedo ejecutarme, por falta de zenity.... Instale y vuelva a ejecutar!!"
  exit 1
fi
# Verifico si puedo escribir en la Carpeta
if [ ! -w `pwd` ]; then 
  zenity --error --title "Error!!!!" --text="No tiene permiso para escribir en la carpeta Seleccionada."
  exit 2
fi
}
#
function tamano {
Size=`zenity --scale --text="Elija el tamaño destino." --value=50`
  case $? in
    -1)  zenity --error --title "Error!!!!" --text="Ha ocurrido un error inesperado!!." && exit 3;;
  esac
}
#
function convertir {
  local ConTMP
  ConTMP=$2
  [[ "$1" != rs_* ]] && convert -resize $Size% $1 "rs_${1}" && let ConTMP=$ConTMP+1 && return $ConTMP
}
#
########## Main ##########
#
# Llamo a las funciones para chequear si puedo ejecutar sin problemas.
ArchivoSelect=$@
chequeo
# Pregunto el % a disminuir
tamano
# Empieza a convertir....
for i in $ArchivoSelect; do
   case $i in
      *.jpg|*.JPG) convertir $i $ContJPG ;
             ContJPG=$? ;;
      *)  let ContNo=$ContNo+1 && break ;;
   esac
done
#
zenity --width=360 --height=320 --info --text="Converti $ContJPG Archivos JPG, sin embargo no realizé cambios en $ContNo Archivos"
#
########## Borro Temporales ##########
#

#
########## Fin Script ##########
exit 0
