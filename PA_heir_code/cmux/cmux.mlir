module {
  func.func @cmux(%arg0: i16, %arg1: i16, %arg2: i1) -> i16 {
    %0 = scf.if %arg2 -> (i16) {
      scf.yield %arg0 : i16
    } else {
      scf.yield %arg1 : i16
    }
    return %0 : i16
  }
}