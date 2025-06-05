module attributes {scheme.cggi} {
  func.func @av(%arg0: !tfhe_rust.server_key, %arg1: memref<16x!tfhe_rust.eui3>, %arg2: memref<16x!tfhe_rust.eui3>) -> memref<8x!tfhe_rust.eui3> {
    %false = arith.constant false
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c7 = arith.constant 7 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %c9 = arith.constant 9 : index
    %c10 = arith.constant 10 : index
    %c11 = arith.constant 11 : index
    %c12 = arith.constant 12 : index
    %c13 = arith.constant 13 : index
    %c14 = arith.constant 14 : index
    %c15 = arith.constant 15 : index
    %0 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 20 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %1 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 9 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %2 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 128 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %3 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 8 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %4 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 16 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %5 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 6 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %6 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 150 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %7 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 4 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %8 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 144 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %9 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 105 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %10 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 178 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %11 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 43 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %12 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 113 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %13 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 13 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %14 = tfhe_rust.generate_lookup_table %arg0 {hoisted = true, truthTable = 208 : ui8} : (!tfhe_rust.server_key) -> !tfhe_rust.lookup_table
    %15 = tfhe_rust.create_trivial %arg0, %false {hoisted = true} : (!tfhe_rust.server_key, i1) -> !tfhe_rust.eui3
    %16 = memref.load %arg2[%c0] : memref<16x!tfhe_rust.eui3>
    %17 = memref.load %arg1[%c0] : memref<16x!tfhe_rust.eui3>
    %18 = tfhe_rust.scalar_left_shift %arg0, %15 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %19 = tfhe_rust.scalar_left_shift %arg0, %16 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %20 = tfhe_rust.add %arg0, %18, %19 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %21 = tfhe_rust.add %arg0, %20, %17 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %22 = tfhe_rust.apply_lookup_table %arg0, %21, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %23 = memref.load %arg2[%c1] : memref<16x!tfhe_rust.eui3>
    %24 = memref.load %arg1[%c1] : memref<16x!tfhe_rust.eui3>
    %25 = tfhe_rust.scalar_left_shift %arg0, %23 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %26 = tfhe_rust.scalar_left_shift %arg0, %24 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %27 = tfhe_rust.add %arg0, %25, %26 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %28 = tfhe_rust.add %arg0, %27, %22 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %29 = tfhe_rust.apply_lookup_table %arg0, %28, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %30 = memref.load %arg2[%c2] : memref<16x!tfhe_rust.eui3>
    %31 = memref.load %arg1[%c2] : memref<16x!tfhe_rust.eui3>
    %32 = tfhe_rust.scalar_left_shift %arg0, %30 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %33 = tfhe_rust.scalar_left_shift %arg0, %31 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %34 = tfhe_rust.add %arg0, %32, %33 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %35 = tfhe_rust.add %arg0, %34, %29 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %36 = tfhe_rust.apply_lookup_table %arg0, %35, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %37 = memref.load %arg2[%c3] : memref<16x!tfhe_rust.eui3>
    %38 = memref.load %arg1[%c3] : memref<16x!tfhe_rust.eui3>
    %39 = tfhe_rust.scalar_left_shift %arg0, %37 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %40 = tfhe_rust.scalar_left_shift %arg0, %38 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %41 = tfhe_rust.add %arg0, %39, %40 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %42 = tfhe_rust.add %arg0, %41, %36 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %43 = tfhe_rust.apply_lookup_table %arg0, %42, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %44 = memref.load %arg2[%c4] : memref<16x!tfhe_rust.eui3>
    %45 = memref.load %arg1[%c4] : memref<16x!tfhe_rust.eui3>
    %46 = tfhe_rust.scalar_left_shift %arg0, %44 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %47 = tfhe_rust.scalar_left_shift %arg0, %45 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %48 = tfhe_rust.add %arg0, %46, %47 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %49 = tfhe_rust.add %arg0, %48, %43 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %50 = tfhe_rust.apply_lookup_table %arg0, %49, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %51 = memref.load %arg2[%c5] : memref<16x!tfhe_rust.eui3>
    %52 = memref.load %arg1[%c5] : memref<16x!tfhe_rust.eui3>
    %53 = tfhe_rust.scalar_left_shift %arg0, %51 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %54 = tfhe_rust.scalar_left_shift %arg0, %52 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %55 = tfhe_rust.add %arg0, %53, %54 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %56 = tfhe_rust.add %arg0, %55, %50 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %57 = tfhe_rust.apply_lookup_table %arg0, %56, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %58 = memref.load %arg1[%c7] : memref<16x!tfhe_rust.eui3>
    %59 = memref.load %arg2[%c7] : memref<16x!tfhe_rust.eui3>
    %60 = tfhe_rust.scalar_left_shift %arg0, %58 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %61 = tfhe_rust.add %arg0, %18, %60 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %62 = tfhe_rust.add %arg0, %61, %59 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %63 = tfhe_rust.apply_lookup_table %arg0, %62, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %64 = memref.load %arg2[%c6] : memref<16x!tfhe_rust.eui3>
    %65 = memref.load %arg1[%c6] : memref<16x!tfhe_rust.eui3>
    %66 = tfhe_rust.scalar_left_shift %arg0, %63 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %67 = tfhe_rust.scalar_left_shift %arg0, %64 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %68 = tfhe_rust.add %arg0, %66, %67 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %69 = tfhe_rust.add %arg0, %68, %65 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %70 = tfhe_rust.apply_lookup_table %arg0, %69, %13 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %71 = tfhe_rust.scalar_left_shift %arg0, %65 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %72 = tfhe_rust.add %arg0, %18, %71 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %73 = tfhe_rust.add %arg0, %72, %64 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %74 = tfhe_rust.apply_lookup_table %arg0, %73, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %75 = tfhe_rust.scalar_left_shift %arg0, %70 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %76 = tfhe_rust.scalar_left_shift %arg0, %57 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %77 = tfhe_rust.add %arg0, %75, %76 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %78 = tfhe_rust.add %arg0, %77, %74 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %79 = tfhe_rust.apply_lookup_table %arg0, %78, %14 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %80 = memref.load %arg1[%c8] : memref<16x!tfhe_rust.eui3>
    %81 = memref.load %arg2[%c8] : memref<16x!tfhe_rust.eui3>
    %82 = tfhe_rust.scalar_left_shift %arg0, %80 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %83 = tfhe_rust.add %arg0, %18, %82 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %84 = tfhe_rust.add %arg0, %83, %81 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %85 = tfhe_rust.apply_lookup_table %arg0, %84, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %86 = tfhe_rust.scalar_left_shift %arg0, %59 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %87 = tfhe_rust.add %arg0, %18, %86 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %88 = tfhe_rust.add %arg0, %87, %58 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %89 = tfhe_rust.apply_lookup_table %arg0, %88, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %90 = tfhe_rust.scalar_left_shift %arg0, %85 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %91 = tfhe_rust.scalar_left_shift %arg0, %89 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %92 = tfhe_rust.add %arg0, %90, %91 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %93 = tfhe_rust.add %arg0, %92, %79 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %94 = tfhe_rust.apply_lookup_table %arg0, %93, %4 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %95 = memref.load %arg1[%c9] : memref<16x!tfhe_rust.eui3>
    %96 = memref.load %arg2[%c9] : memref<16x!tfhe_rust.eui3>
    %97 = tfhe_rust.scalar_left_shift %arg0, %95 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %98 = tfhe_rust.add %arg0, %18, %97 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %99 = tfhe_rust.add %arg0, %98, %96 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %100 = tfhe_rust.apply_lookup_table %arg0, %99, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %101 = tfhe_rust.scalar_left_shift %arg0, %100 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %102 = tfhe_rust.scalar_left_shift %arg0, %81 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %103 = tfhe_rust.add %arg0, %101, %102 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %104 = tfhe_rust.add %arg0, %103, %80 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %105 = tfhe_rust.apply_lookup_table %arg0, %104, %13 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %106 = tfhe_rust.scalar_left_shift %arg0, %96 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %107 = tfhe_rust.add %arg0, %18, %106 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %108 = tfhe_rust.add %arg0, %107, %95 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %109 = tfhe_rust.apply_lookup_table %arg0, %108, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %110 = tfhe_rust.scalar_left_shift %arg0, %109 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %111 = tfhe_rust.scalar_left_shift %arg0, %94 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %112 = tfhe_rust.add %arg0, %110, %111 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %113 = tfhe_rust.add %arg0, %112, %105 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %114 = tfhe_rust.apply_lookup_table %arg0, %113, %13 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %115 = memref.load %arg1[%c10] : memref<16x!tfhe_rust.eui3>
    %116 = memref.load %arg2[%c10] : memref<16x!tfhe_rust.eui3>
    %117 = tfhe_rust.scalar_left_shift %arg0, %114 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %118 = tfhe_rust.scalar_left_shift %arg0, %115 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %119 = tfhe_rust.add %arg0, %117, %118 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %120 = tfhe_rust.add %arg0, %119, %116 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %121 = tfhe_rust.apply_lookup_table %arg0, %120, %11 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %122 = memref.load %arg1[%c11] : memref<16x!tfhe_rust.eui3>
    %123 = memref.load %arg2[%c11] : memref<16x!tfhe_rust.eui3>
    %124 = tfhe_rust.scalar_left_shift %arg0, %122 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %125 = tfhe_rust.scalar_left_shift %arg0, %121 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %126 = tfhe_rust.add %arg0, %124, %125 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %127 = tfhe_rust.add %arg0, %126, %123 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %128 = tfhe_rust.apply_lookup_table %arg0, %127, %12 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %129 = memref.load %arg1[%c12] : memref<16x!tfhe_rust.eui3>
    %130 = memref.load %arg2[%c12] : memref<16x!tfhe_rust.eui3>
    %131 = tfhe_rust.scalar_left_shift %arg0, %128 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %132 = tfhe_rust.scalar_left_shift %arg0, %129 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %133 = tfhe_rust.add %arg0, %131, %132 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %134 = tfhe_rust.add %arg0, %133, %130 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %135 = tfhe_rust.apply_lookup_table %arg0, %134, %11 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %136 = memref.load %arg1[%c13] : memref<16x!tfhe_rust.eui3>
    %137 = memref.load %arg2[%c13] : memref<16x!tfhe_rust.eui3>
    %138 = tfhe_rust.scalar_left_shift %arg0, %135 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %139 = tfhe_rust.scalar_left_shift %arg0, %136 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %140 = tfhe_rust.add %arg0, %138, %139 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %141 = tfhe_rust.add %arg0, %140, %137 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %142 = tfhe_rust.apply_lookup_table %arg0, %141, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %143 = memref.load %arg2[%c14] : memref<16x!tfhe_rust.eui3>
    %144 = memref.load %arg1[%c14] : memref<16x!tfhe_rust.eui3>
    %145 = tfhe_rust.scalar_left_shift %arg0, %143 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %146 = tfhe_rust.scalar_left_shift %arg0, %144 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %147 = tfhe_rust.add %arg0, %145, %146 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %148 = tfhe_rust.add %arg0, %147, %142 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %149 = tfhe_rust.apply_lookup_table %arg0, %148, %10 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %150 = tfhe_rust.add %arg0, %18, %139 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %151 = tfhe_rust.add %arg0, %150, %137 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %152 = tfhe_rust.apply_lookup_table %arg0, %151, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %153 = tfhe_rust.add %arg0, %18, %146 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %154 = tfhe_rust.add %arg0, %153, %143 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %155 = tfhe_rust.apply_lookup_table %arg0, %154, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %156 = tfhe_rust.add %arg0, %18, %132 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %157 = tfhe_rust.add %arg0, %156, %130 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %158 = tfhe_rust.apply_lookup_table %arg0, %157, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %159 = tfhe_rust.add %arg0, %18, %118 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %160 = tfhe_rust.add %arg0, %159, %116 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %161 = tfhe_rust.apply_lookup_table %arg0, %160, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %162 = tfhe_rust.add %arg0, %18, %54 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %163 = tfhe_rust.add %arg0, %162, %51 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %164 = tfhe_rust.apply_lookup_table %arg0, %163, %5 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %165 = tfhe_rust.add %arg0, %18, %47 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %166 = tfhe_rust.add %arg0, %165, %44 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %167 = tfhe_rust.apply_lookup_table %arg0, %166, %5 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %168 = tfhe_rust.add %arg0, %18, %40 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %169 = tfhe_rust.add %arg0, %168, %37 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %170 = tfhe_rust.apply_lookup_table %arg0, %169, %5 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %171 = tfhe_rust.add %arg0, %18, %67 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %172 = tfhe_rust.add %arg0, %171, %65 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %173 = tfhe_rust.apply_lookup_table %arg0, %172, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %174 = tfhe_rust.scalar_left_shift %arg0, %58 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %175 = tfhe_rust.add %arg0, %174, %86 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %176 = tfhe_rust.add %arg0, %175, %173 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %177 = tfhe_rust.apply_lookup_table %arg0, %176, %9 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %178 = tfhe_rust.add %arg0, %18, %26 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %179 = tfhe_rust.add %arg0, %178, %23 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %180 = tfhe_rust.apply_lookup_table %arg0, %179, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %181 = tfhe_rust.scalar_left_shift %arg0, %180 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %182 = tfhe_rust.scalar_left_shift %arg0, %17 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %183 = tfhe_rust.add %arg0, %181, %182 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %184 = tfhe_rust.add %arg0, %183, %16 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %185 = tfhe_rust.apply_lookup_table %arg0, %184, %8 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %186 = tfhe_rust.scalar_left_shift %arg0, %185 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %187 = tfhe_rust.add %arg0, %18, %186 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %188 = tfhe_rust.add %arg0, %187, %177 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %189 = tfhe_rust.apply_lookup_table %arg0, %188, %3 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %190 = tfhe_rust.add %arg0, %18, %102 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %191 = tfhe_rust.add %arg0, %190, %80 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %192 = tfhe_rust.apply_lookup_table %arg0, %191, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %193 = tfhe_rust.scalar_left_shift %arg0, %95 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %194 = tfhe_rust.add %arg0, %193, %106 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %195 = tfhe_rust.add %arg0, %194, %192 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %196 = tfhe_rust.apply_lookup_table %arg0, %195, %6 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %197 = tfhe_rust.scalar_left_shift %arg0, %116 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %198 = tfhe_rust.add %arg0, %18, %197 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %199 = tfhe_rust.add %arg0, %198, %115 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %200 = tfhe_rust.apply_lookup_table %arg0, %199, %7 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %201 = tfhe_rust.scalar_left_shift %arg0, %123 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %202 = tfhe_rust.add %arg0, %124, %201 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %203 = tfhe_rust.add %arg0, %202, %200 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %204 = tfhe_rust.apply_lookup_table %arg0, %203, %6 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %205 = tfhe_rust.scalar_left_shift %arg0, %189 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %206 = tfhe_rust.scalar_left_shift %arg0, %204 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %207 = tfhe_rust.add %arg0, %205, %206 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %208 = tfhe_rust.add %arg0, %207, %196 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %209 = tfhe_rust.apply_lookup_table %arg0, %208, %4 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %210 = tfhe_rust.add %arg0, %18, %33 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %211 = tfhe_rust.add %arg0, %210, %30 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %212 = tfhe_rust.apply_lookup_table %arg0, %211, %5 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %213 = tfhe_rust.scalar_left_shift %arg0, %209 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %214 = tfhe_rust.scalar_left_shift %arg0, %212 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %215 = tfhe_rust.add %arg0, %213, %214 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %216 = tfhe_rust.add %arg0, %215, %170 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %217 = tfhe_rust.apply_lookup_table %arg0, %216, %4 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %218 = tfhe_rust.scalar_left_shift %arg0, %217 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %219 = tfhe_rust.scalar_left_shift %arg0, %167 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %220 = tfhe_rust.add %arg0, %218, %219 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %221 = tfhe_rust.add %arg0, %220, %164 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %222 = tfhe_rust.apply_lookup_table %arg0, %221, %4 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %223 = tfhe_rust.scalar_left_shift %arg0, %222 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %224 = tfhe_rust.add %arg0, %18, %223 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %225 = tfhe_rust.add %arg0, %224, %74 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %226 = tfhe_rust.apply_lookup_table %arg0, %225, %3 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %227 = tfhe_rust.scalar_left_shift %arg0, %85 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %228 = tfhe_rust.add %arg0, %18, %227 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %229 = tfhe_rust.add %arg0, %228, %226 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %230 = tfhe_rust.apply_lookup_table %arg0, %229, %3 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %231 = tfhe_rust.scalar_left_shift %arg0, %230 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %232 = tfhe_rust.add %arg0, %18, %231 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %233 = tfhe_rust.add %arg0, %232, %161 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %234 = tfhe_rust.apply_lookup_table %arg0, %233, %3 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %235 = tfhe_rust.scalar_left_shift %arg0, %158 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %236 = tfhe_rust.add %arg0, %18, %235 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %237 = tfhe_rust.add %arg0, %236, %234 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %238 = tfhe_rust.apply_lookup_table %arg0, %237, %3 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %239 = tfhe_rust.scalar_left_shift %arg0, %152 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %240 = tfhe_rust.scalar_left_shift %arg0, %155 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %241 = tfhe_rust.add %arg0, %239, %240 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %242 = tfhe_rust.add %arg0, %241, %238 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %243 = tfhe_rust.apply_lookup_table %arg0, %242, %2 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %244 = memref.load %arg1[%c15] : memref<16x!tfhe_rust.eui3>
    %245 = memref.load %arg2[%c15] : memref<16x!tfhe_rust.eui3>
    %246 = tfhe_rust.scalar_left_shift %arg0, %244 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %247 = tfhe_rust.add %arg0, %18, %246 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %248 = tfhe_rust.add %arg0, %247, %245 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %249 = tfhe_rust.apply_lookup_table %arg0, %248, %1 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %250 = tfhe_rust.scalar_left_shift %arg0, %249 {shiftAmount = 2 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %251 = tfhe_rust.scalar_left_shift %arg0, %149 {shiftAmount = 1 : index} : (!tfhe_rust.server_key, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %252 = tfhe_rust.add %arg0, %250, %251 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %253 = tfhe_rust.add %arg0, %252, %243 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.eui3) -> !tfhe_rust.eui3
    %254 = tfhe_rust.apply_lookup_table %arg0, %253, %0 : (!tfhe_rust.server_key, !tfhe_rust.eui3, !tfhe_rust.lookup_table) -> !tfhe_rust.eui3
    %alloc = memref.alloc() : memref<8x!tfhe_rust.eui3>
    memref.store %254, %alloc[%c0] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c1] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c2] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c3] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c4] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c5] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c6] : memref<8x!tfhe_rust.eui3>
    memref.store %15, %alloc[%c7] : memref<8x!tfhe_rust.eui3>
    return %alloc : memref<8x!tfhe_rust.eui3>
  }
}

