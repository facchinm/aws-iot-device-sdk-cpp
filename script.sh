#Merge src and include
rsync -av include/ src/
#Rename samples as examples
mv samples examples
#Create mega header file
search_dir=src/
for entry in "$search_dir"*; do
  if [ ${entry: -4} == ".hpp" ]
  then
      echo "#include \"${entry#$search_dir}\"" >> src/aws-iot-device-sdk.h
  fi
done
#Remove include folder
rm -rf include/
#Add corei7 folder to support load flags
mkdir src/corei7
:> src/corei7/empty
#Move common, network to src
mv common/ src/
mv network/ src/
#Remove doxygen, cli, tests
rm -rf doxygen
rm -rf cli
rm -rf tests
#Move readme to extras
mkdir extras
mv *.md extras/
mv LICENSE extras/
mv NOTICE extras/
