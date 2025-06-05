#!/bin/bash
CXX_INCLUDE_FLAGS="\
-I/usr/include/c++/11 \
-I/usr/include/x86_64-linux-gnu/c++/11 \
-I/usr/lib/llvm-14/lib/clang/14.0.0/include \
-I/usr/local/include \
-I/usr/include/x86_64-linux-gnu \
-I/usr/include"
CGEIST_PATH="/mnt/storage/PA/Polygeist/build/bin/cgeist"
POLYGEIST_OPT_PATH="/mnt/storage/PA/Polygeist/build/bin/polygeist-opt"
MLIR_OPT_PATH="/mnt/storage/PA/Polygeist/llvm-project/build/bin/mlir-opt"

echo testing tools
$CGEIST_PATH --version
$MLIR_OPT_PATH --version
echo ""
echo end test tools
sleep 1

run_tools() {
    SOURCE_NAME=$1
    EXTENSION=$2
    SOURCE_PATH="/mnt/storage/PA/Polygeist/build/toy/$SOURCE_NAME"


    echo "lowering cpp to mlir w/ cgeist"
    $CGEIST_PATH "$SOURCE_PATH.$EXTENSION" -function=* -S -raise-scf-to-affine $CXX_INCLUDE_FLAGS > "$SOURCE_PATH.mlir"
    echo "end lowering"
    echo ""
    sleep 1

    echo "inlining MLIR"
    $POLYGEIST_OPT_PATH -inline -canonicalize -cse "$SOURCE_PATH.mlir" -o "$SOURCE_PATH.inlined.mlir"
    echo "end inlining"
    echo ""
    sleep 1
}

run_tools diff cpp
run_tools "lonesha256" c

echo end of script

