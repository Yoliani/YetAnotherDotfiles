#!/bin/sh
echo "Ejecutando servidor"
directory=$(pwd)
{ # try
	echo $PWD
	php 	-S 127.0.0.1:35601 -t $PWD
} || { # catch
  echo "Ocurrio un problema por favor revise si es un directorio"
	
}
