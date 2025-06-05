module {
  func.func @av(%arg0: i16, %arg1: i16) -> i8 {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.extsi %arg0 : i16 to i32
    %1 = arith.extsi %arg1 : i16 to i32
    %2 = arith.subi %0, %1 : i32
    %3 = arith.trunci %2 : i32 to i16
    %4 = arith.extsi %3 : i16 to i32
    %5 = arith.cmpi sgt, %4, %c0_i32 : i32
    %6 = arith.extui %5 : i1 to i8
    return %6 : i8
  }
}
