#!/bin/bash

################################################################################
#                                                                              #
#  Script to build and test all urbancode Docker images                        #
#                                                                              #
#                                                                              #
#  Usage : buildAll.sh							                                           #
#                                                                              #
################################################################################

mkdir ./logs

while read -r imageName buildContextDirectory
do
  ./tools/build.sh $imageName $buildContextDirectory

  if [ $? != 0 ]; then
    echo "Failed at image $imageName - exiting"
    exit 1
  fi

done < "images.txt"
