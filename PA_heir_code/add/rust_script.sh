#!/bin/bash

# maybe add the release option

#echo maybe make the BINARY_NAME an argument
BINARY_NAME='add'
HEIR_PATH='/home/nut/Documents/PA_doc/heir'
FOLDER_PATH="$HEIR_PATH/alban_pa"
SUB_FOLDER_PATH="$FOLDER_PATH/$BINARY_NAME"

echo heir-opt pass, ...
echo NO SUCH PASS YET
echo
echo first pass done
sleep 1


echo heir-translate pass, ...
bazel run @heir//tools:heir-translate -- --emit-tfhe-rust --use-levels $SUB_FOLDER_PATH/add.mlir > $SUB_FOLDER_PATH/add.rs
echo
echo second pass done
sleep 1

echo cargo build pass, ...
cargo build --manifest-path $SUB_FOLDER_PATH/Cargo.toml --bin add_main
echo
echo third pass done
sleep 1

BINARY_PATH=$SUB_FOLDER_PATH/target/debug/$BINARY_NAME\_main
echo binary path: $BINARY_PATH
echo 'run with 8 and 5 (expected 5 with 3 bits)'
$BINARY_PATH 8 5 --message_bits 3
