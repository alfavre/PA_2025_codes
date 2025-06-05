#!/bin/bash

#this needs to be at the start
if [ -n "$1" ]; then
  echo "the binary that we want to build is: $1"
  BINARY_NAME=$1
else
  BINARY_NAME='age_verification'
  echo no argument given, we will build $BINARY_NAME
fi

if [ -n "$2" ]; then
  echo "the dimesion is : $2"
  CYPHERTEXT_DEGREE_BGV=$2
else
  CYPHERTEXT_DEGREE_BGV='2'
  echo no argument given, we will build $CYPHERTEXT_DEGREE_BGV
fi


#echo maybe make the BINARY_NAME an argument
HEIR_PATH='/home/nut/Documents/PA_doc/heir'
FOLDER_PATH="$HEIR_PATH/alban_pa"
SUB_FOLDER_PATH="$FOLDER_PATH/$BINARY_NAME"
STUPID_COMMAND="//tools:heir-opt -- --mlir-to-bgv='ciphertext-degree=$CYPHERTEXT_DEGREE_BGV' --scheme-to-openfhe='entry-function=$BINARY_NAME' $SUB_FOLDER_PATH/$BINARY_NAME.mlir > $SUB_FOLDER_PATH/output.mlir'"

echo start of alban FHE pipeline!

#first compile initial MLIR into intermediary MLIR
echo heir-opt pass, ...: command = $STUPID_COMMAND
#bazel run $STUPID_COMMAND

bazel run //tools:heir-opt -- \
  --mlir-to-bgv="ciphertext-degree=$CYPHERTEXT_DEGREE_BGV" \
  --scheme-to-openfhe="entry-function=$BINARY_NAME" \
  $SUB_FOLDER_PATH/$BINARY_NAME.mlir >$SUB_FOLDER_PATH/output.mlir

echo
echo first pass done
sleep 1

#second make c++ from the intermediary MLIR
echo heir-translate pass, ...
bazel run //tools:heir-translate -- --emit-openfhe-pke-header --openfhe-include-type=source-relative $SUB_FOLDER_PATH/output.mlir >$SUB_FOLDER_PATH/heir_output.h
bazel run //tools:heir-translate -- --emit-openfhe-pke --openfhe-include-type=source-relative $SUB_FOLDER_PATH/output.mlir >$SUB_FOLDER_PATH/heir_output.cpp

echo
echo second pass done
sleep 1

#types
MAIN='_main'
INIT='_init'
DECRYPT='_decrypt'
ENCRYPT='_encrypt'

run_harness() {
  local LOCAL_HARNESS_NAME=$1
  local LOCAL_BINARY_NAME="$BINARY_NAME$LOCAL_HARNESS_NAME"
  local SOURCE_NAME="$LOCAL_BINARY_NAME.cpp"

  echo "BINARY_NAME is: $BINARY_NAME"
  echo "LOCAL_HARNESS_NAME is: $LOCAL_HARNESS_NAME"
  echo "LOCAL_BINARY_NAME is: $LOCAL_BINARY_NAME"
  echo "SOURCE_NAME is: $SOURCE_NAME"

  #we need a harness to frame the random functions we built in the previous step
  #this is the part where you can do whatever
  echo "checking that harness file $SOURCE_NAME exists"
  ls -la "$SUB_FOLDER_PATH/$SOURCE_NAME"

  #end, we build and run the binary
  echo "running binary"
  bazel run "$LOCAL_BINARY_NAME" 20226 18449

  #cp the binary
  echo "copying binary in $FOLDER_PATH/bin"
  cp "$HEIR_PATH/bazel-bin/alban_pa/$LOCAL_BINARY_NAME" "$FOLDER_PATH/bin"
  #chmoding because by default bazel makes binary non w
  echo "chmod +w $FOLDER_PATH/bin/$LOCAL_BINARY_NAME"
  chmod +w "$FOLDER_PATH/bin/$LOCAL_BINARY_NAME"

  echo ""
  echo end of run_harness for $LOCAL_HARNESS_NAME
  echo ""
  sleep 2
}

# Call the function with your parameters
run_harness $MAIN
run_harness $INIT
run_harness $DECRYPT
run_harness $ENCRYPT

echo end of alban_pipeline.sh
