rsync -av include/ src/
mv samples examples
search_dir=src
for entry in "$search_dir"/*; do
  if [ ${entry: -4} == ".hpp" ]
  then
      echo "#include \"$entry\"" >> src/aws-iot-device-sdk.h
  fi
done
rm -rf include/
mkdir src/corei7
:> src/corei7/empty

