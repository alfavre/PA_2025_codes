// RUN: heir-translate %s --emit-tfhe-rust --use-levels > %S/add/add.rs
// bazel run @heir//tools:heir-translate -- --emit-tfhe-rust --use-levels /home/nut/Documents/PA_doc/heir/alban_pa/add/add.mlir > /home/nut/Documents/PA_doc/heir/alban_pa/add/add.rs
// RUN: cargo run --release --manifest-path %S/Cargo.toml --bin main -- 2 3 --message_bits=3 | FileCheck %s

!sks = !tfhe_rust.server_key
//!lut = !tfhe_rust.lookup_table
!eui3 = !tfhe_rust.eui3

func.func @add(%sks : !sks, %a: !eui3, %b: !eui3) -> !eui3 {
  %res = tfhe_rust.add %sks, %a, %b: (!sks, !eui3, !eui3) -> !eui3
  return %res : !eui3
}
