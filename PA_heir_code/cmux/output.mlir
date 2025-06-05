module attributes {scheme.cggi} {
  func.func private @internal_generic_1335627609387333698(%arg0: i16, %arg1: i16, %arg2: i1) -> i16 {
    %0 = arith.select %arg2, %arg0, %arg1 : i16
    return %0 : i16
  }
  func.func @cmux(%arg0: !tfhe_rust_bool.server_key, %arg1: memref<16x!tfhe_rust_bool.eb>, %arg2: memref<16x!tfhe_rust_bool.eb>, %arg3: !tfhe_rust_bool.eb) -> memref<16x!tfhe_rust_bool.eb> {
    %c7 = arith.constant 7 : index
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c15 = arith.constant 15 : index
    %c14 = arith.constant 14 : index
    %c13 = arith.constant 13 : index
    %c12 = arith.constant 12 : index
    %c11 = arith.constant 11 : index
    %c10 = arith.constant 10 : index
    %c9 = arith.constant 9 : index
    %c8 = arith.constant 8 : index
    %0 = tfhe_rust_bool.not %arg0, %arg3 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %1 = memref.load %arg1[%c8] : memref<16x!tfhe_rust_bool.eb>
    %2 = tfhe_rust_bool.nand %arg0, %1, %arg3 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %3 = memref.load %arg2[%c8] : memref<16x!tfhe_rust_bool.eb>
    %4 = tfhe_rust_bool.nand %arg0, %3, %0 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %5 = tfhe_rust_bool.nand %arg0, %2, %4 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %6 = memref.load %arg1[%c9] : memref<16x!tfhe_rust_bool.eb>
    %7 = tfhe_rust_bool.nand %arg0, %arg3, %6 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %8 = memref.load %arg2[%c9] : memref<16x!tfhe_rust_bool.eb>
    %9 = tfhe_rust_bool.nand %arg0, %0, %8 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %10 = tfhe_rust_bool.nand %arg0, %7, %9 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %11 = memref.load %arg1[%c10] : memref<16x!tfhe_rust_bool.eb>
    %12 = tfhe_rust_bool.nand %arg0, %arg3, %11 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %13 = memref.load %arg2[%c10] : memref<16x!tfhe_rust_bool.eb>
    %14 = tfhe_rust_bool.nand %arg0, %0, %13 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %15 = tfhe_rust_bool.nand %arg0, %12, %14 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %16 = memref.load %arg1[%c11] : memref<16x!tfhe_rust_bool.eb>
    %17 = tfhe_rust_bool.nand %arg0, %arg3, %16 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %18 = memref.load %arg2[%c11] : memref<16x!tfhe_rust_bool.eb>
    %19 = tfhe_rust_bool.nand %arg0, %0, %18 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %20 = tfhe_rust_bool.nand %arg0, %17, %19 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %21 = memref.load %arg1[%c12] : memref<16x!tfhe_rust_bool.eb>
    %22 = tfhe_rust_bool.nand %arg0, %arg3, %21 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %23 = memref.load %arg2[%c12] : memref<16x!tfhe_rust_bool.eb>
    %24 = tfhe_rust_bool.nand %arg0, %0, %23 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %25 = tfhe_rust_bool.nand %arg0, %22, %24 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %26 = memref.load %arg1[%c13] : memref<16x!tfhe_rust_bool.eb>
    %27 = tfhe_rust_bool.nand %arg0, %arg3, %26 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %28 = memref.load %arg2[%c13] : memref<16x!tfhe_rust_bool.eb>
    %29 = tfhe_rust_bool.nand %arg0, %0, %28 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %30 = tfhe_rust_bool.nand %arg0, %27, %29 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %31 = memref.load %arg1[%c14] : memref<16x!tfhe_rust_bool.eb>
    %32 = tfhe_rust_bool.nand %arg0, %arg3, %31 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %33 = memref.load %arg2[%c14] : memref<16x!tfhe_rust_bool.eb>
    %34 = tfhe_rust_bool.nand %arg0, %0, %33 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %35 = tfhe_rust_bool.nand %arg0, %32, %34 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %36 = memref.load %arg1[%c15] : memref<16x!tfhe_rust_bool.eb>
    %37 = tfhe_rust_bool.nand %arg0, %arg3, %36 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %38 = memref.load %arg2[%c15] : memref<16x!tfhe_rust_bool.eb>
    %39 = tfhe_rust_bool.nand %arg0, %0, %38 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %40 = tfhe_rust_bool.nand %arg0, %37, %39 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %41 = memref.load %arg1[%c0] : memref<16x!tfhe_rust_bool.eb>
    %42 = tfhe_rust_bool.nand %arg0, %arg3, %41 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %43 = memref.load %arg2[%c0] : memref<16x!tfhe_rust_bool.eb>
    %44 = tfhe_rust_bool.nand %arg0, %0, %43 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %45 = tfhe_rust_bool.nand %arg0, %42, %44 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %46 = memref.load %arg1[%c1] : memref<16x!tfhe_rust_bool.eb>
    %47 = tfhe_rust_bool.nand %arg0, %arg3, %46 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %48 = memref.load %arg2[%c1] : memref<16x!tfhe_rust_bool.eb>
    %49 = tfhe_rust_bool.nand %arg0, %0, %48 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %50 = tfhe_rust_bool.nand %arg0, %47, %49 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %51 = memref.load %arg1[%c2] : memref<16x!tfhe_rust_bool.eb>
    %52 = tfhe_rust_bool.nand %arg0, %arg3, %51 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %53 = memref.load %arg2[%c2] : memref<16x!tfhe_rust_bool.eb>
    %54 = tfhe_rust_bool.nand %arg0, %0, %53 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %55 = tfhe_rust_bool.nand %arg0, %52, %54 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %56 = memref.load %arg1[%c3] : memref<16x!tfhe_rust_bool.eb>
    %57 = tfhe_rust_bool.nand %arg0, %arg3, %56 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %58 = memref.load %arg2[%c3] : memref<16x!tfhe_rust_bool.eb>
    %59 = tfhe_rust_bool.nand %arg0, %0, %58 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %60 = tfhe_rust_bool.nand %arg0, %57, %59 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %61 = memref.load %arg1[%c4] : memref<16x!tfhe_rust_bool.eb>
    %62 = tfhe_rust_bool.nand %arg0, %arg3, %61 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %63 = memref.load %arg2[%c4] : memref<16x!tfhe_rust_bool.eb>
    %64 = tfhe_rust_bool.nand %arg0, %0, %63 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %65 = tfhe_rust_bool.nand %arg0, %62, %64 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %66 = memref.load %arg1[%c5] : memref<16x!tfhe_rust_bool.eb>
    %67 = tfhe_rust_bool.nand %arg0, %arg3, %66 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %68 = memref.load %arg2[%c5] : memref<16x!tfhe_rust_bool.eb>
    %69 = tfhe_rust_bool.nand %arg0, %0, %68 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %70 = tfhe_rust_bool.nand %arg0, %67, %69 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %71 = memref.load %arg1[%c6] : memref<16x!tfhe_rust_bool.eb>
    %72 = tfhe_rust_bool.nand %arg0, %arg3, %71 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %73 = memref.load %arg2[%c6] : memref<16x!tfhe_rust_bool.eb>
    %74 = tfhe_rust_bool.nand %arg0, %0, %73 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %75 = tfhe_rust_bool.nand %arg0, %72, %74 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %76 = memref.load %arg1[%c7] : memref<16x!tfhe_rust_bool.eb>
    %77 = tfhe_rust_bool.nand %arg0, %arg3, %76 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %78 = memref.load %arg2[%c7] : memref<16x!tfhe_rust_bool.eb>
    %79 = tfhe_rust_bool.nand %arg0, %0, %78 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %80 = tfhe_rust_bool.nand %arg0, %77, %79 : (!tfhe_rust_bool.server_key, !tfhe_rust_bool.eb, !tfhe_rust_bool.eb) -> !tfhe_rust_bool.eb
    %alloc = memref.alloc() : memref<16x!tfhe_rust_bool.eb>
    memref.store %45, %alloc[%c0] : memref<16x!tfhe_rust_bool.eb>
    memref.store %50, %alloc[%c1] : memref<16x!tfhe_rust_bool.eb>
    memref.store %55, %alloc[%c2] : memref<16x!tfhe_rust_bool.eb>
    memref.store %60, %alloc[%c3] : memref<16x!tfhe_rust_bool.eb>
    memref.store %65, %alloc[%c4] : memref<16x!tfhe_rust_bool.eb>
    memref.store %70, %alloc[%c5] : memref<16x!tfhe_rust_bool.eb>
    memref.store %75, %alloc[%c6] : memref<16x!tfhe_rust_bool.eb>
    memref.store %80, %alloc[%c7] : memref<16x!tfhe_rust_bool.eb>
    memref.store %5, %alloc[%c8] : memref<16x!tfhe_rust_bool.eb>
    memref.store %10, %alloc[%c9] : memref<16x!tfhe_rust_bool.eb>
    memref.store %15, %alloc[%c10] : memref<16x!tfhe_rust_bool.eb>
    memref.store %20, %alloc[%c11] : memref<16x!tfhe_rust_bool.eb>
    memref.store %25, %alloc[%c12] : memref<16x!tfhe_rust_bool.eb>
    memref.store %30, %alloc[%c13] : memref<16x!tfhe_rust_bool.eb>
    memref.store %35, %alloc[%c14] : memref<16x!tfhe_rust_bool.eb>
    memref.store %40, %alloc[%c15] : memref<16x!tfhe_rust_bool.eb>
    return %alloc : memref<16x!tfhe_rust_bool.eb>
  }
}

