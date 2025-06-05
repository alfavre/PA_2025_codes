#!/bin/bash

# maybe add the release option

#echo maybe make the BINARY_NAME an argument
BINARY_NAME='av'
HEIR_PATH='/home/nut/Documents/PA_doc/heir'
FOLDER_PATH="$HEIR_PATH/alban_pa"
SUB_FOLDER_PATH="$FOLDER_PATH/$BINARY_NAME"

run_heir_opt_pass() {
    echo "out is: $SUB_FOLDER_PATH/output.mlir"
    echo "heir-opt pass, ..."
    bazel run @heir//tools:heir-opt -- \
    --forward-store-to-load \
    --secretize \
    --secret-distribute-generic \
    --secret-to-cggi \
    --mlir-to-cggi \
    --arith-to-cggi \
    --cggi-to-tfhe-rust \
    --canonicalize \
    --cse \
    "$SUB_FOLDER_PATH/$BINARY_NAME.mlir" > "$SUB_FOLDER_PATH/output.mlir"
    echo
    echo "opt pass done"
    sleep 1
}

run_heir_translate_pass() {
    echo "heir-translate pass, ..."
    bazel run @heir//tools:heir-translate -- --emit-tfhe-rust --use-levels "$SUB_FOLDER_PATH/output.mlir" > "$SUB_FOLDER_PATH/$BINARY_NAME.rs"
    echo
    echo "second pass done"
    sleep 1
}

run_cargo_pass() {
    echo cargo build pass, ...
    #cargo build --manifest-path $SUB_FOLDER_PATH/Cargo.toml --bin $BINARY_NAME\_main
    cargo build --release --manifest-path $SUB_FOLDER_PATH/Cargo.toml --bin $BINARY_NAME\_main
    echo
    echo third pass done
    sleep 1
}

run_move_pass() {
    BINARY_PATH=$SUB_FOLDER_PATH/target/debug/$BINARY_NAME\_main
    echo "move binary:"
    mv $BINARY_PATH $FOLDER_PATH/bin
    echo binary path: $BINARY_PATH
    echo 'run with 30 and 25 expected true , also 8 bits ?'
    $BINARY_PATH 30 25
}


#run_heir_opt_pass
#run_heir_translate_pass
#need an intermediary pass to do the moves
#run_cargo_pass
run_move_pass





