#!/bin/bash

# maybe add the release option

#echo maybe make the BINARY_NAME an argument
BINARY_NAME='cmux'
HEIR_PATH='/home/nut/Documents/PA_doc/heir'
FOLDER_PATH="$HEIR_PATH/alban_pa"
SUB_FOLDER_PATH="$FOLDER_PATH/$BINARY_NAME"


echo heir-opt pass, ...
#bazel run @heir//tools:heir-opt -- --scheme-to-tfhe-rs $SUB_FOLDER_PATH/$BINARY_NAME.mlir > $SUB_FOLDER_PATH/output_simple.mlir
bazel run @heir//tools:heir-opt -- \
  --verify-diagnostics \
  --secretize \
  --wrap-generic \
  --convert-to-data-oblivious \
  --yosys-optimizer=mode=Boolean \
  --secret-distribute-generic \
  --secret-to-cggi \
  --cse \
  --cggi-to-tfhe-rust-bool \
  --canonicalize \
  --cse \
  $SUB_FOLDER_PATH/$BINARY_NAME.mlir > $SUB_FOLDER_PATH/output.mlir
echo
echo opt pass done
sleep 1


echo heir-translate pass, ...
#bazel run @heir//tools:heir-translate -- --emit-tfhe-rust --use-levels $SUB_FOLDER_PATH/output.mlir > $SUB_FOLDER_PATH/$BINARY_NAME.rs
bazel run @heir//tools:heir-translate -- --emit-tfhe-rust-bool $SUB_FOLDER_PATH/output.mlir > $SUB_FOLDER_PATH/$BINARY_NAME.rs
echo
echo second pass done
sleep 1


echo cargo build pass, ...
cargo build --manifest-path $SUB_FOLDER_PATH/Cargo.toml --release --bin $BINARY_NAME\_main
echo
echo third pass done
sleep 1


BINARY_PATH=$SUB_FOLDER_PATH/target/debug/$BINARY_NAME\_main
echo binary path: $BINARY_PATH
echo "run with 12 22 and 1, expected 12"
$BINARY_PATH 12 22 1


