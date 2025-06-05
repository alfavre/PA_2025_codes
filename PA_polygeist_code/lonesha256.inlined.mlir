#map = affine_map<()[s0] -> (s0 + 1)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @lonesha256(%arg0: memref<?xi8>, %arg1: memref<?xi8>, %arg2: i64) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c1116352408_i32 = arith.constant 1116352408 : i32
    %c1899447441_i32 = arith.constant 1899447441 : i32
    %c-1245643825_i32 = arith.constant -1245643825 : i32
    %c-373957723_i32 = arith.constant -373957723 : i32
    %c961987163_i32 = arith.constant 961987163 : i32
    %c1508970993_i32 = arith.constant 1508970993 : i32
    %c-1841331548_i32 = arith.constant -1841331548 : i32
    %c-1424204075_i32 = arith.constant -1424204075 : i32
    %c-670586216_i32 = arith.constant -670586216 : i32
    %c310598401_i32 = arith.constant 310598401 : i32
    %c607225278_i32 = arith.constant 607225278 : i32
    %c1426881987_i32 = arith.constant 1426881987 : i32
    %c1925078388_i32 = arith.constant 1925078388 : i32
    %c-2132889090_i32 = arith.constant -2132889090 : i32
    %c-1680079193_i32 = arith.constant -1680079193 : i32
    %c-1046744716_i32 = arith.constant -1046744716 : i32
    %c-459576895_i32 = arith.constant -459576895 : i32
    %c-272742522_i32 = arith.constant -272742522 : i32
    %c264347078_i32 = arith.constant 264347078 : i32
    %c604807628_i32 = arith.constant 604807628 : i32
    %c770255983_i32 = arith.constant 770255983 : i32
    %c1249150122_i32 = arith.constant 1249150122 : i32
    %c1555081692_i32 = arith.constant 1555081692 : i32
    %c1996064986_i32 = arith.constant 1996064986 : i32
    %c-1740746414_i32 = arith.constant -1740746414 : i32
    %c-1473132947_i32 = arith.constant -1473132947 : i32
    %c-1341970488_i32 = arith.constant -1341970488 : i32
    %c-1084653625_i32 = arith.constant -1084653625 : i32
    %c-958395405_i32 = arith.constant -958395405 : i32
    %c-710438585_i32 = arith.constant -710438585 : i32
    %c113926993_i32 = arith.constant 113926993 : i32
    %c338241895_i32 = arith.constant 338241895 : i32
    %c666307205_i32 = arith.constant 666307205 : i32
    %c773529912_i32 = arith.constant 773529912 : i32
    %c1294757372_i32 = arith.constant 1294757372 : i32
    %c1396182291_i32 = arith.constant 1396182291 : i32
    %c1695183700_i32 = arith.constant 1695183700 : i32
    %c1986661051_i32 = arith.constant 1986661051 : i32
    %c-2117940946_i32 = arith.constant -2117940946 : i32
    %c-1838011259_i32 = arith.constant -1838011259 : i32
    %c-1564481375_i32 = arith.constant -1564481375 : i32
    %c-1474664885_i32 = arith.constant -1474664885 : i32
    %c-1035236496_i32 = arith.constant -1035236496 : i32
    %c-949202525_i32 = arith.constant -949202525 : i32
    %c-778901479_i32 = arith.constant -778901479 : i32
    %c-694614492_i32 = arith.constant -694614492 : i32
    %c-200395387_i32 = arith.constant -200395387 : i32
    %c275423344_i32 = arith.constant 275423344 : i32
    %c430227734_i32 = arith.constant 430227734 : i32
    %c506948616_i32 = arith.constant 506948616 : i32
    %c659060556_i32 = arith.constant 659060556 : i32
    %c883997877_i32 = arith.constant 883997877 : i32
    %c958139571_i32 = arith.constant 958139571 : i32
    %c1322822218_i32 = arith.constant 1322822218 : i32
    %c1537002063_i32 = arith.constant 1537002063 : i32
    %c1747873779_i32 = arith.constant 1747873779 : i32
    %c1955562222_i32 = arith.constant 1955562222 : i32
    %c2024104815_i32 = arith.constant 2024104815 : i32
    %c-2067236844_i32 = arith.constant -2067236844 : i32
    %c-1933114872_i32 = arith.constant -1933114872 : i32
    %c-1866530822_i32 = arith.constant -1866530822 : i32
    %c-1538233109_i32 = arith.constant -1538233109 : i32
    %c-1090935817_i32 = arith.constant -1090935817 : i32
    %c-965641998_i32 = arith.constant -965641998 : i32
    %c0_i64 = arith.constant 0 : i64
    %c1779033703_i32 = arith.constant 1779033703 : i32
    %c-1150833019_i32 = arith.constant -1150833019 : i32
    %c1013904242_i32 = arith.constant 1013904242 : i32
    %c-1521486534_i32 = arith.constant -1521486534 : i32
    %c1359893119_i32 = arith.constant 1359893119 : i32
    %c-1694144372_i32 = arith.constant -1694144372 : i32
    %c528734635_i32 = arith.constant 528734635 : i32
    %c1541459225_i32 = arith.constant 1541459225 : i32
    %c0_i32 = arith.constant 0 : i32
    %c8_i32 = arith.constant 8 : i32
    %c16_i32 = arith.constant 16 : i32
    %c255_i32 = arith.constant 255 : i32
    %c24_i32 = arith.constant 24 : i32
    %c4294967295_i64 = arith.constant 4294967295 : i64
    %c19_i32 = arith.constant 19 : i32
    %c10_i64 = arith.constant 10 : i64
    %c7_i32 = arith.constant 7 : i32
    %c15_i32 = arith.constant 15 : i32
    %c3_i64 = arith.constant 3 : i64
    %c25_i32 = arith.constant 25 : i32
    %c13_i32 = arith.constant 13 : i32
    %c8_i64 = arith.constant 8 : i64
    %c-128_i8 = arith.constant -128 : i8
    %c56_i64 = arith.constant 56 : i64
    %c0_i8 = arith.constant 0 : i8
    %c255_i64 = arith.constant 255 : i64
    %c48_i64 = arith.constant 48 : i64
    %c40_i64 = arith.constant 40 : i64
    %c32_i64 = arith.constant 32 : i64
    %c24_i64 = arith.constant 24 : i64
    %c16_i64 = arith.constant 16 : i64
    %c22_i64 = arith.constant 22 : i64
    %c13_i64 = arith.constant 13 : i64
    %c10_i32 = arith.constant 10 : i32
    %c2_i64 = arith.constant 2 : i64
    %c30_i32 = arith.constant 30 : i32
    %c25_i64 = arith.constant 25 : i64
    %c11_i64 = arith.constant 11 : i64
    %c21_i32 = arith.constant 21 : i32
    %c6_i64 = arith.constant 6 : i64
    %c26_i32 = arith.constant 26 : i32
    %c18_i64 = arith.constant 18 : i64
    %c7_i64 = arith.constant 7 : i64
    %c19_i64 = arith.constant 19 : i64
    %c14_i32 = arith.constant 14 : i32
    %c17_i64 = arith.constant 17 : i64
    %c-64 = arith.constant -64 : index
    %c512 = arith.constant 512 : index
    %c64 = arith.constant 64 : index
    %c1_i64 = arith.constant 1 : i64
    %0 = arith.index_cast %arg2 : i64 to index
    %alloca = memref.alloca() : memref<64xi8>
    %alloca_0 = memref.alloca() : memref<64xi32>
    %alloca_1 = memref.alloca() : memref<8xi32>
    %alloca_2 = memref.alloca() : memref<8xi32>
    %alloca_3 = memref.alloca() : memref<64xi32>
    affine.store %c1116352408_i32, %alloca_3[0] : memref<64xi32>
    affine.store %c1899447441_i32, %alloca_3[1] : memref<64xi32>
    affine.store %c-1245643825_i32, %alloca_3[2] : memref<64xi32>
    affine.store %c-373957723_i32, %alloca_3[3] : memref<64xi32>
    affine.store %c961987163_i32, %alloca_3[4] : memref<64xi32>
    affine.store %c1508970993_i32, %alloca_3[5] : memref<64xi32>
    affine.store %c-1841331548_i32, %alloca_3[6] : memref<64xi32>
    affine.store %c-1424204075_i32, %alloca_3[7] : memref<64xi32>
    affine.store %c-670586216_i32, %alloca_3[8] : memref<64xi32>
    affine.store %c310598401_i32, %alloca_3[9] : memref<64xi32>
    affine.store %c607225278_i32, %alloca_3[10] : memref<64xi32>
    affine.store %c1426881987_i32, %alloca_3[11] : memref<64xi32>
    affine.store %c1925078388_i32, %alloca_3[12] : memref<64xi32>
    affine.store %c-2132889090_i32, %alloca_3[13] : memref<64xi32>
    affine.store %c-1680079193_i32, %alloca_3[14] : memref<64xi32>
    affine.store %c-1046744716_i32, %alloca_3[15] : memref<64xi32>
    affine.store %c-459576895_i32, %alloca_3[16] : memref<64xi32>
    affine.store %c-272742522_i32, %alloca_3[17] : memref<64xi32>
    affine.store %c264347078_i32, %alloca_3[18] : memref<64xi32>
    affine.store %c604807628_i32, %alloca_3[19] : memref<64xi32>
    affine.store %c770255983_i32, %alloca_3[20] : memref<64xi32>
    affine.store %c1249150122_i32, %alloca_3[21] : memref<64xi32>
    affine.store %c1555081692_i32, %alloca_3[22] : memref<64xi32>
    affine.store %c1996064986_i32, %alloca_3[23] : memref<64xi32>
    affine.store %c-1740746414_i32, %alloca_3[24] : memref<64xi32>
    affine.store %c-1473132947_i32, %alloca_3[25] : memref<64xi32>
    affine.store %c-1341970488_i32, %alloca_3[26] : memref<64xi32>
    affine.store %c-1084653625_i32, %alloca_3[27] : memref<64xi32>
    affine.store %c-958395405_i32, %alloca_3[28] : memref<64xi32>
    affine.store %c-710438585_i32, %alloca_3[29] : memref<64xi32>
    affine.store %c113926993_i32, %alloca_3[30] : memref<64xi32>
    affine.store %c338241895_i32, %alloca_3[31] : memref<64xi32>
    affine.store %c666307205_i32, %alloca_3[32] : memref<64xi32>
    affine.store %c773529912_i32, %alloca_3[33] : memref<64xi32>
    affine.store %c1294757372_i32, %alloca_3[34] : memref<64xi32>
    affine.store %c1396182291_i32, %alloca_3[35] : memref<64xi32>
    affine.store %c1695183700_i32, %alloca_3[36] : memref<64xi32>
    affine.store %c1986661051_i32, %alloca_3[37] : memref<64xi32>
    affine.store %c-2117940946_i32, %alloca_3[38] : memref<64xi32>
    affine.store %c-1838011259_i32, %alloca_3[39] : memref<64xi32>
    affine.store %c-1564481375_i32, %alloca_3[40] : memref<64xi32>
    affine.store %c-1474664885_i32, %alloca_3[41] : memref<64xi32>
    affine.store %c-1035236496_i32, %alloca_3[42] : memref<64xi32>
    affine.store %c-949202525_i32, %alloca_3[43] : memref<64xi32>
    affine.store %c-778901479_i32, %alloca_3[44] : memref<64xi32>
    affine.store %c-694614492_i32, %alloca_3[45] : memref<64xi32>
    affine.store %c-200395387_i32, %alloca_3[46] : memref<64xi32>
    affine.store %c275423344_i32, %alloca_3[47] : memref<64xi32>
    affine.store %c430227734_i32, %alloca_3[48] : memref<64xi32>
    affine.store %c506948616_i32, %alloca_3[49] : memref<64xi32>
    affine.store %c659060556_i32, %alloca_3[50] : memref<64xi32>
    affine.store %c883997877_i32, %alloca_3[51] : memref<64xi32>
    affine.store %c958139571_i32, %alloca_3[52] : memref<64xi32>
    affine.store %c1322822218_i32, %alloca_3[53] : memref<64xi32>
    affine.store %c1537002063_i32, %alloca_3[54] : memref<64xi32>
    affine.store %c1747873779_i32, %alloca_3[55] : memref<64xi32>
    affine.store %c1955562222_i32, %alloca_3[56] : memref<64xi32>
    affine.store %c2024104815_i32, %alloca_3[57] : memref<64xi32>
    affine.store %c-2067236844_i32, %alloca_3[58] : memref<64xi32>
    affine.store %c-1933114872_i32, %alloca_3[59] : memref<64xi32>
    affine.store %c-1866530822_i32, %alloca_3[60] : memref<64xi32>
    affine.store %c-1538233109_i32, %alloca_3[61] : memref<64xi32>
    affine.store %c-1090935817_i32, %alloca_3[62] : memref<64xi32>
    affine.store %c-965641998_i32, %alloca_3[63] : memref<64xi32>
    affine.store %c1779033703_i32, %alloca_2[0] : memref<8xi32>
    affine.store %c-1150833019_i32, %alloca_2[1] : memref<8xi32>
    affine.store %c1013904242_i32, %alloca_2[2] : memref<8xi32>
    affine.store %c-1521486534_i32, %alloca_2[3] : memref<8xi32>
    affine.store %c1359893119_i32, %alloca_2[4] : memref<8xi32>
    affine.store %c-1694144372_i32, %alloca_2[5] : memref<8xi32>
    affine.store %c528734635_i32, %alloca_2[6] : memref<8xi32>
    affine.store %c1541459225_i32, %alloca_2[7] : memref<8xi32>
    %1 = arith.addi %arg2, %c1_i64 : i64
    %2 = arith.index_cast %1 : i64 to index
    %3 = arith.subi %2, %c64 : index
    %4 = arith.divui %3, %c64 : index
    %5 = arith.muli %4, %c512 : index
    %6 = arith.index_cast %5 : index to i64
    %7 = arith.muli %4, %c-64 : index
    %8 = arith.addi %0, %7 : index
    %9 = arith.index_cast %8 : index to i64
    %10 = affine.for %arg3 = 64 to #map()[%0] step 64 iter_args(%arg4 = %arg1) -> (memref<?xi8>) {
      affine.for %arg5 = 0 to 8 {
        %41 = affine.load %alloca_2[%arg5] : memref<8xi32>
        affine.store %41, %alloca_1[%arg5] : memref<8xi32>
      }
      affine.for %arg5 = 0 to 16 {
        %41 = affine.load %arg4[%arg5 * 4] : memref<?xi8>
        %42 = arith.extui %41 : i8 to i32
        %43 = arith.andi %42, %c255_i32 : i32
        %44 = arith.shli %43, %c24_i32 : i32
        %45 = affine.load %arg4[%arg5 * 4 + 1] : memref<?xi8>
        %46 = arith.extui %45 : i8 to i32
        %47 = arith.andi %46, %c255_i32 : i32
        %48 = arith.shli %47, %c16_i32 : i32
        %49 = arith.ori %44, %48 : i32
        %50 = affine.load %arg4[%arg5 * 4 + 2] : memref<?xi8>
        %51 = arith.extui %50 : i8 to i32
        %52 = arith.andi %51, %c255_i32 : i32
        %53 = arith.shli %52, %c8_i32 : i32
        %54 = arith.ori %49, %53 : i32
        %55 = affine.load %arg4[%arg5 * 4 + 3] : memref<?xi8>
        %56 = arith.extui %55 : i8 to i32
        %57 = arith.andi %56, %c255_i32 : i32
        %58 = arith.ori %54, %57 : i32
        affine.store %58, %alloca_0[%arg5] : memref<64xi32>
      }
      affine.for %arg5 = 16 to 64 {
        %41 = affine.load %alloca_0[%arg5 - 2] : memref<64xi32>
        %42 = arith.extsi %41 : i32 to i64
        %43 = arith.andi %42, %c4294967295_i64 : i64
        %44 = arith.shrui %43, %c17_i64 : i64
        %45 = arith.shli %41, %c15_i32 : i32
        %46 = arith.extsi %45 : i32 to i64
        %47 = arith.ori %44, %46 : i64
        %48 = arith.andi %47, %c4294967295_i64 : i64
        %49 = arith.shrui %43, %c19_i64 : i64
        %50 = arith.shli %41, %c13_i32 : i32
        %51 = arith.extsi %50 : i32 to i64
        %52 = arith.ori %49, %51 : i64
        %53 = arith.andi %52, %c4294967295_i64 : i64
        %54 = arith.xori %48, %53 : i64
        %55 = arith.shrui %43, %c10_i64 : i64
        %56 = arith.xori %54, %55 : i64
        %57 = affine.load %alloca_0[%arg5 - 7] : memref<64xi32>
        %58 = arith.extsi %57 : i32 to i64
        %59 = arith.addi %56, %58 : i64
        %60 = affine.load %alloca_0[%arg5 - 15] : memref<64xi32>
        %61 = arith.extsi %60 : i32 to i64
        %62 = arith.andi %61, %c4294967295_i64 : i64
        %63 = arith.shrui %62, %c7_i64 : i64
        %64 = arith.shli %60, %c25_i32 : i32
        %65 = arith.extsi %64 : i32 to i64
        %66 = arith.ori %63, %65 : i64
        %67 = arith.andi %66, %c4294967295_i64 : i64
        %68 = arith.shrui %62, %c18_i64 : i64
        %69 = arith.shli %60, %c14_i32 : i32
        %70 = arith.extsi %69 : i32 to i64
        %71 = arith.ori %68, %70 : i64
        %72 = arith.andi %71, %c4294967295_i64 : i64
        %73 = arith.xori %67, %72 : i64
        %74 = arith.shrui %62, %c3_i64 : i64
        %75 = arith.xori %73, %74 : i64
        %76 = arith.addi %59, %75 : i64
        %77 = affine.load %alloca_0[%arg5 - 16] : memref<64xi32>
        %78 = arith.extsi %77 : i32 to i64
        %79 = arith.addi %76, %78 : i64
        %80 = arith.trunci %79 : i64 to i32
        affine.store %80, %alloca_0[%arg5] : memref<64xi32>
      }
      affine.for %arg5 = 0 to 64 {
        %41 = affine.load %alloca_1[7] : memref<8xi32>
        %42 = arith.extsi %41 : i32 to i64
        %43 = affine.load %alloca_1[4] : memref<8xi32>
        %44 = arith.extsi %43 : i32 to i64
        %45 = arith.andi %44, %c4294967295_i64 : i64
        %46 = arith.shrui %45, %c6_i64 : i64
        %47 = arith.shli %43, %c26_i32 : i32
        %48 = arith.extsi %47 : i32 to i64
        %49 = arith.ori %46, %48 : i64
        %50 = arith.andi %49, %c4294967295_i64 : i64
        %51 = arith.shrui %45, %c11_i64 : i64
        %52 = arith.shli %43, %c21_i32 : i32
        %53 = arith.extsi %52 : i32 to i64
        %54 = arith.ori %51, %53 : i64
        %55 = arith.andi %54, %c4294967295_i64 : i64
        %56 = arith.xori %50, %55 : i64
        %57 = arith.shrui %45, %c25_i64 : i64
        %58 = arith.shli %43, %c7_i32 : i32
        %59 = arith.extsi %58 : i32 to i64
        %60 = arith.ori %57, %59 : i64
        %61 = arith.andi %60, %c4294967295_i64 : i64
        %62 = arith.xori %56, %61 : i64
        %63 = arith.addi %42, %62 : i64
        %64 = affine.load %alloca_1[6] : memref<8xi32>
        %65 = affine.load %alloca_1[5] : memref<8xi32>
        %66 = arith.xori %65, %64 : i32
        %67 = arith.andi %43, %66 : i32
        %68 = arith.xori %64, %67 : i32
        %69 = arith.extsi %68 : i32 to i64
        %70 = arith.addi %63, %69 : i64
        %71 = affine.load %alloca_3[%arg5] : memref<64xi32>
        %72 = arith.extsi %71 : i32 to i64
        %73 = arith.addi %70, %72 : i64
        %74 = affine.load %alloca_0[%arg5] : memref<64xi32>
        %75 = arith.extsi %74 : i32 to i64
        %76 = arith.addi %73, %75 : i64
        %77 = arith.trunci %76 : i64 to i32
        %78 = affine.load %alloca_1[0] : memref<8xi32>
        %79 = arith.extsi %78 : i32 to i64
        %80 = arith.andi %79, %c4294967295_i64 : i64
        %81 = arith.shrui %80, %c2_i64 : i64
        %82 = arith.shli %78, %c30_i32 : i32
        %83 = arith.extsi %82 : i32 to i64
        %84 = arith.ori %81, %83 : i64
        %85 = arith.andi %84, %c4294967295_i64 : i64
        %86 = arith.shrui %80, %c13_i64 : i64
        %87 = arith.shli %78, %c19_i32 : i32
        %88 = arith.extsi %87 : i32 to i64
        %89 = arith.ori %86, %88 : i64
        %90 = arith.andi %89, %c4294967295_i64 : i64
        %91 = arith.xori %85, %90 : i64
        %92 = arith.shrui %80, %c22_i64 : i64
        %93 = arith.shli %78, %c10_i32 : i32
        %94 = arith.extsi %93 : i32 to i64
        %95 = arith.ori %92, %94 : i64
        %96 = arith.andi %95, %c4294967295_i64 : i64
        %97 = arith.xori %91, %96 : i64
        %98 = affine.load %alloca_1[1] : memref<8xi32>
        %99 = arith.ori %78, %98 : i32
        %100 = affine.load %alloca_1[2] : memref<8xi32>
        %101 = arith.andi %99, %100 : i32
        %102 = arith.andi %78, %98 : i32
        %103 = arith.ori %101, %102 : i32
        %104 = arith.extsi %103 : i32 to i64
        %105 = arith.addi %97, %104 : i64
        %106 = arith.trunci %105 : i64 to i32
        %107 = affine.load %alloca_1[3] : memref<8xi32>
        %108 = arith.addi %107, %77 : i32
        %109 = arith.addi %77, %106 : i32
        affine.store %64, %alloca_1[7] : memref<8xi32>
        affine.store %65, %alloca_1[6] : memref<8xi32>
        affine.store %43, %alloca_1[5] : memref<8xi32>
        affine.store %108, %alloca_1[4] : memref<8xi32>
        affine.store %100, %alloca_1[3] : memref<8xi32>
        affine.store %98, %alloca_1[2] : memref<8xi32>
        affine.store %78, %alloca_1[1] : memref<8xi32>
        affine.store %109, %alloca_1[0] : memref<8xi32>
      }
      affine.for %arg5 = 0 to 8 {
        %41 = affine.load %alloca_2[%arg5] : memref<8xi32>
        %42 = affine.load %alloca_1[%arg5] : memref<8xi32>
        %43 = arith.addi %41, %42 : i32
        affine.store %43, %alloca_2[%arg5] : memref<8xi32>
      }
      %40 = "polygeist.subindex"(%arg4, %c64) : (memref<?xi8>, index) -> memref<?xi8>
      affine.yield %40 : memref<?xi8>
    }
    affine.for %arg3 = 0 to %8 {
      %40 = affine.load %10[%arg3] : memref<?xi8>
      affine.store %40, %alloca[%arg3] : memref<64xi8>
    }
    %11 = arith.muli %9, %c8_i64 : i64
    %12 = arith.addi %6, %11 : i64
    %13 = arith.addi %9, %c1_i64 : i64
    affine.store %c-128_i8, %alloca[symbol(%8)] : memref<64xi8>
    %14 = arith.cmpi sgt, %13, %c56_i64 : i64
    %15 = arith.select %14, %c0_i64, %13 : i64
    scf.if %14 {
      affine.for %arg3 = #map()[%8] to 64 {
        affine.store %c0_i8, %alloca[%arg3] : memref<64xi8>
      }
      affine.for %arg3 = 0 to 8 {
        %40 = affine.load %alloca_2[%arg3] : memref<8xi32>
        affine.store %40, %alloca_1[%arg3] : memref<8xi32>
      }
      affine.for %arg3 = 0 to 16 {
        %40 = affine.load %alloca[%arg3 * 4] : memref<64xi8>
        %41 = arith.extui %40 : i8 to i32
        %42 = arith.andi %41, %c255_i32 : i32
        %43 = arith.shli %42, %c24_i32 : i32
        %44 = affine.load %alloca[%arg3 * 4 + 1] : memref<64xi8>
        %45 = arith.extui %44 : i8 to i32
        %46 = arith.andi %45, %c255_i32 : i32
        %47 = arith.shli %46, %c16_i32 : i32
        %48 = arith.ori %43, %47 : i32
        %49 = affine.load %alloca[%arg3 * 4 + 2] : memref<64xi8>
        %50 = arith.extui %49 : i8 to i32
        %51 = arith.andi %50, %c255_i32 : i32
        %52 = arith.shli %51, %c8_i32 : i32
        %53 = arith.ori %48, %52 : i32
        %54 = affine.load %alloca[%arg3 * 4 + 3] : memref<64xi8>
        %55 = arith.extui %54 : i8 to i32
        %56 = arith.andi %55, %c255_i32 : i32
        %57 = arith.ori %53, %56 : i32
        affine.store %57, %alloca_0[%arg3] : memref<64xi32>
      }
      affine.for %arg3 = 16 to 64 {
        %40 = affine.load %alloca_0[%arg3 - 2] : memref<64xi32>
        %41 = arith.extsi %40 : i32 to i64
        %42 = arith.andi %41, %c4294967295_i64 : i64
        %43 = arith.shrui %42, %c17_i64 : i64
        %44 = arith.shli %40, %c15_i32 : i32
        %45 = arith.extsi %44 : i32 to i64
        %46 = arith.ori %43, %45 : i64
        %47 = arith.andi %46, %c4294967295_i64 : i64
        %48 = arith.shrui %42, %c19_i64 : i64
        %49 = arith.shli %40, %c13_i32 : i32
        %50 = arith.extsi %49 : i32 to i64
        %51 = arith.ori %48, %50 : i64
        %52 = arith.andi %51, %c4294967295_i64 : i64
        %53 = arith.xori %47, %52 : i64
        %54 = arith.shrui %42, %c10_i64 : i64
        %55 = arith.xori %53, %54 : i64
        %56 = affine.load %alloca_0[%arg3 - 7] : memref<64xi32>
        %57 = arith.extsi %56 : i32 to i64
        %58 = arith.addi %55, %57 : i64
        %59 = affine.load %alloca_0[%arg3 - 15] : memref<64xi32>
        %60 = arith.extsi %59 : i32 to i64
        %61 = arith.andi %60, %c4294967295_i64 : i64
        %62 = arith.shrui %61, %c7_i64 : i64
        %63 = arith.shli %59, %c25_i32 : i32
        %64 = arith.extsi %63 : i32 to i64
        %65 = arith.ori %62, %64 : i64
        %66 = arith.andi %65, %c4294967295_i64 : i64
        %67 = arith.shrui %61, %c18_i64 : i64
        %68 = arith.shli %59, %c14_i32 : i32
        %69 = arith.extsi %68 : i32 to i64
        %70 = arith.ori %67, %69 : i64
        %71 = arith.andi %70, %c4294967295_i64 : i64
        %72 = arith.xori %66, %71 : i64
        %73 = arith.shrui %61, %c3_i64 : i64
        %74 = arith.xori %72, %73 : i64
        %75 = arith.addi %58, %74 : i64
        %76 = affine.load %alloca_0[%arg3 - 16] : memref<64xi32>
        %77 = arith.extsi %76 : i32 to i64
        %78 = arith.addi %75, %77 : i64
        %79 = arith.trunci %78 : i64 to i32
        affine.store %79, %alloca_0[%arg3] : memref<64xi32>
      }
      affine.for %arg3 = 0 to 64 {
        %40 = affine.load %alloca_1[7] : memref<8xi32>
        %41 = arith.extsi %40 : i32 to i64
        %42 = affine.load %alloca_1[4] : memref<8xi32>
        %43 = arith.extsi %42 : i32 to i64
        %44 = arith.andi %43, %c4294967295_i64 : i64
        %45 = arith.shrui %44, %c6_i64 : i64
        %46 = arith.shli %42, %c26_i32 : i32
        %47 = arith.extsi %46 : i32 to i64
        %48 = arith.ori %45, %47 : i64
        %49 = arith.andi %48, %c4294967295_i64 : i64
        %50 = arith.shrui %44, %c11_i64 : i64
        %51 = arith.shli %42, %c21_i32 : i32
        %52 = arith.extsi %51 : i32 to i64
        %53 = arith.ori %50, %52 : i64
        %54 = arith.andi %53, %c4294967295_i64 : i64
        %55 = arith.xori %49, %54 : i64
        %56 = arith.shrui %44, %c25_i64 : i64
        %57 = arith.shli %42, %c7_i32 : i32
        %58 = arith.extsi %57 : i32 to i64
        %59 = arith.ori %56, %58 : i64
        %60 = arith.andi %59, %c4294967295_i64 : i64
        %61 = arith.xori %55, %60 : i64
        %62 = arith.addi %41, %61 : i64
        %63 = affine.load %alloca_1[6] : memref<8xi32>
        %64 = affine.load %alloca_1[5] : memref<8xi32>
        %65 = arith.xori %64, %63 : i32
        %66 = arith.andi %42, %65 : i32
        %67 = arith.xori %63, %66 : i32
        %68 = arith.extsi %67 : i32 to i64
        %69 = arith.addi %62, %68 : i64
        %70 = affine.load %alloca_3[%arg3] : memref<64xi32>
        %71 = arith.extsi %70 : i32 to i64
        %72 = arith.addi %69, %71 : i64
        %73 = affine.load %alloca_0[%arg3] : memref<64xi32>
        %74 = arith.extsi %73 : i32 to i64
        %75 = arith.addi %72, %74 : i64
        %76 = arith.trunci %75 : i64 to i32
        %77 = affine.load %alloca_1[0] : memref<8xi32>
        %78 = arith.extsi %77 : i32 to i64
        %79 = arith.andi %78, %c4294967295_i64 : i64
        %80 = arith.shrui %79, %c2_i64 : i64
        %81 = arith.shli %77, %c30_i32 : i32
        %82 = arith.extsi %81 : i32 to i64
        %83 = arith.ori %80, %82 : i64
        %84 = arith.andi %83, %c4294967295_i64 : i64
        %85 = arith.shrui %79, %c13_i64 : i64
        %86 = arith.shli %77, %c19_i32 : i32
        %87 = arith.extsi %86 : i32 to i64
        %88 = arith.ori %85, %87 : i64
        %89 = arith.andi %88, %c4294967295_i64 : i64
        %90 = arith.xori %84, %89 : i64
        %91 = arith.shrui %79, %c22_i64 : i64
        %92 = arith.shli %77, %c10_i32 : i32
        %93 = arith.extsi %92 : i32 to i64
        %94 = arith.ori %91, %93 : i64
        %95 = arith.andi %94, %c4294967295_i64 : i64
        %96 = arith.xori %90, %95 : i64
        %97 = affine.load %alloca_1[1] : memref<8xi32>
        %98 = arith.ori %77, %97 : i32
        %99 = affine.load %alloca_1[2] : memref<8xi32>
        %100 = arith.andi %98, %99 : i32
        %101 = arith.andi %77, %97 : i32
        %102 = arith.ori %100, %101 : i32
        %103 = arith.extsi %102 : i32 to i64
        %104 = arith.addi %96, %103 : i64
        %105 = arith.trunci %104 : i64 to i32
        %106 = affine.load %alloca_1[3] : memref<8xi32>
        %107 = arith.addi %106, %76 : i32
        %108 = arith.addi %76, %105 : i32
        affine.store %63, %alloca_1[7] : memref<8xi32>
        affine.store %64, %alloca_1[6] : memref<8xi32>
        affine.store %42, %alloca_1[5] : memref<8xi32>
        affine.store %107, %alloca_1[4] : memref<8xi32>
        affine.store %99, %alloca_1[3] : memref<8xi32>
        affine.store %97, %alloca_1[2] : memref<8xi32>
        affine.store %77, %alloca_1[1] : memref<8xi32>
        affine.store %108, %alloca_1[0] : memref<8xi32>
      }
      affine.for %arg3 = 0 to 8 {
        %40 = affine.load %alloca_2[%arg3] : memref<8xi32>
        %41 = affine.load %alloca_1[%arg3] : memref<8xi32>
        %42 = arith.addi %40, %41 : i32
        affine.store %42, %alloca_2[%arg3] : memref<8xi32>
      }
    }
    %16 = arith.index_cast %15 : i64 to index
    affine.for %arg3 = %16 to 56 {
      affine.store %c0_i8, %alloca[%arg3] : memref<64xi8>
    }
    %17 = arith.shrsi %12, %c56_i64 : i64
    %18 = arith.andi %17, %c255_i64 : i64
    %19 = arith.trunci %18 : i64 to i8
    affine.store %19, %alloca[56] : memref<64xi8>
    %20 = arith.shrsi %12, %c48_i64 : i64
    %21 = arith.andi %20, %c255_i64 : i64
    %22 = arith.trunci %21 : i64 to i8
    affine.store %22, %alloca[57] : memref<64xi8>
    %23 = arith.shrsi %12, %c40_i64 : i64
    %24 = arith.andi %23, %c255_i64 : i64
    %25 = arith.trunci %24 : i64 to i8
    affine.store %25, %alloca[58] : memref<64xi8>
    %26 = arith.shrsi %12, %c32_i64 : i64
    %27 = arith.andi %26, %c255_i64 : i64
    %28 = arith.trunci %27 : i64 to i8
    affine.store %28, %alloca[59] : memref<64xi8>
    %29 = arith.shrsi %12, %c24_i64 : i64
    %30 = arith.andi %29, %c255_i64 : i64
    %31 = arith.trunci %30 : i64 to i8
    affine.store %31, %alloca[60] : memref<64xi8>
    %32 = arith.shrsi %12, %c16_i64 : i64
    %33 = arith.andi %32, %c255_i64 : i64
    %34 = arith.trunci %33 : i64 to i8
    affine.store %34, %alloca[61] : memref<64xi8>
    %35 = arith.shrsi %12, %c8_i64 : i64
    %36 = arith.andi %35, %c255_i64 : i64
    %37 = arith.trunci %36 : i64 to i8
    affine.store %37, %alloca[62] : memref<64xi8>
    %38 = arith.andi %12, %c255_i64 : i64
    %39 = arith.trunci %38 : i64 to i8
    affine.store %39, %alloca[63] : memref<64xi8>
    affine.for %arg3 = 0 to 8 {
      %40 = affine.load %alloca_2[%arg3] : memref<8xi32>
      affine.store %40, %alloca_1[%arg3] : memref<8xi32>
    }
    affine.for %arg3 = 0 to 16 {
      %40 = affine.load %alloca[%arg3 * 4] : memref<64xi8>
      %41 = arith.extui %40 : i8 to i32
      %42 = arith.andi %41, %c255_i32 : i32
      %43 = arith.shli %42, %c24_i32 : i32
      %44 = affine.load %alloca[%arg3 * 4 + 1] : memref<64xi8>
      %45 = arith.extui %44 : i8 to i32
      %46 = arith.andi %45, %c255_i32 : i32
      %47 = arith.shli %46, %c16_i32 : i32
      %48 = arith.ori %43, %47 : i32
      %49 = affine.load %alloca[%arg3 * 4 + 2] : memref<64xi8>
      %50 = arith.extui %49 : i8 to i32
      %51 = arith.andi %50, %c255_i32 : i32
      %52 = arith.shli %51, %c8_i32 : i32
      %53 = arith.ori %48, %52 : i32
      %54 = affine.load %alloca[%arg3 * 4 + 3] : memref<64xi8>
      %55 = arith.extui %54 : i8 to i32
      %56 = arith.andi %55, %c255_i32 : i32
      %57 = arith.ori %53, %56 : i32
      affine.store %57, %alloca_0[%arg3] : memref<64xi32>
    }
    affine.for %arg3 = 16 to 64 {
      %40 = affine.load %alloca_0[%arg3 - 2] : memref<64xi32>
      %41 = arith.extsi %40 : i32 to i64
      %42 = arith.andi %41, %c4294967295_i64 : i64
      %43 = arith.shrui %42, %c17_i64 : i64
      %44 = arith.shli %40, %c15_i32 : i32
      %45 = arith.extsi %44 : i32 to i64
      %46 = arith.ori %43, %45 : i64
      %47 = arith.andi %46, %c4294967295_i64 : i64
      %48 = arith.shrui %42, %c19_i64 : i64
      %49 = arith.shli %40, %c13_i32 : i32
      %50 = arith.extsi %49 : i32 to i64
      %51 = arith.ori %48, %50 : i64
      %52 = arith.andi %51, %c4294967295_i64 : i64
      %53 = arith.xori %47, %52 : i64
      %54 = arith.shrui %42, %c10_i64 : i64
      %55 = arith.xori %53, %54 : i64
      %56 = affine.load %alloca_0[%arg3 - 7] : memref<64xi32>
      %57 = arith.extsi %56 : i32 to i64
      %58 = arith.addi %55, %57 : i64
      %59 = affine.load %alloca_0[%arg3 - 15] : memref<64xi32>
      %60 = arith.extsi %59 : i32 to i64
      %61 = arith.andi %60, %c4294967295_i64 : i64
      %62 = arith.shrui %61, %c7_i64 : i64
      %63 = arith.shli %59, %c25_i32 : i32
      %64 = arith.extsi %63 : i32 to i64
      %65 = arith.ori %62, %64 : i64
      %66 = arith.andi %65, %c4294967295_i64 : i64
      %67 = arith.shrui %61, %c18_i64 : i64
      %68 = arith.shli %59, %c14_i32 : i32
      %69 = arith.extsi %68 : i32 to i64
      %70 = arith.ori %67, %69 : i64
      %71 = arith.andi %70, %c4294967295_i64 : i64
      %72 = arith.xori %66, %71 : i64
      %73 = arith.shrui %61, %c3_i64 : i64
      %74 = arith.xori %72, %73 : i64
      %75 = arith.addi %58, %74 : i64
      %76 = affine.load %alloca_0[%arg3 - 16] : memref<64xi32>
      %77 = arith.extsi %76 : i32 to i64
      %78 = arith.addi %75, %77 : i64
      %79 = arith.trunci %78 : i64 to i32
      affine.store %79, %alloca_0[%arg3] : memref<64xi32>
    }
    affine.for %arg3 = 0 to 64 {
      %40 = affine.load %alloca_1[7] : memref<8xi32>
      %41 = arith.extsi %40 : i32 to i64
      %42 = affine.load %alloca_1[4] : memref<8xi32>
      %43 = arith.extsi %42 : i32 to i64
      %44 = arith.andi %43, %c4294967295_i64 : i64
      %45 = arith.shrui %44, %c6_i64 : i64
      %46 = arith.shli %42, %c26_i32 : i32
      %47 = arith.extsi %46 : i32 to i64
      %48 = arith.ori %45, %47 : i64
      %49 = arith.andi %48, %c4294967295_i64 : i64
      %50 = arith.shrui %44, %c11_i64 : i64
      %51 = arith.shli %42, %c21_i32 : i32
      %52 = arith.extsi %51 : i32 to i64
      %53 = arith.ori %50, %52 : i64
      %54 = arith.andi %53, %c4294967295_i64 : i64
      %55 = arith.xori %49, %54 : i64
      %56 = arith.shrui %44, %c25_i64 : i64
      %57 = arith.shli %42, %c7_i32 : i32
      %58 = arith.extsi %57 : i32 to i64
      %59 = arith.ori %56, %58 : i64
      %60 = arith.andi %59, %c4294967295_i64 : i64
      %61 = arith.xori %55, %60 : i64
      %62 = arith.addi %41, %61 : i64
      %63 = affine.load %alloca_1[6] : memref<8xi32>
      %64 = affine.load %alloca_1[5] : memref<8xi32>
      %65 = arith.xori %64, %63 : i32
      %66 = arith.andi %42, %65 : i32
      %67 = arith.xori %63, %66 : i32
      %68 = arith.extsi %67 : i32 to i64
      %69 = arith.addi %62, %68 : i64
      %70 = affine.load %alloca_3[%arg3] : memref<64xi32>
      %71 = arith.extsi %70 : i32 to i64
      %72 = arith.addi %69, %71 : i64
      %73 = affine.load %alloca_0[%arg3] : memref<64xi32>
      %74 = arith.extsi %73 : i32 to i64
      %75 = arith.addi %72, %74 : i64
      %76 = arith.trunci %75 : i64 to i32
      %77 = affine.load %alloca_1[0] : memref<8xi32>
      %78 = arith.extsi %77 : i32 to i64
      %79 = arith.andi %78, %c4294967295_i64 : i64
      %80 = arith.shrui %79, %c2_i64 : i64
      %81 = arith.shli %77, %c30_i32 : i32
      %82 = arith.extsi %81 : i32 to i64
      %83 = arith.ori %80, %82 : i64
      %84 = arith.andi %83, %c4294967295_i64 : i64
      %85 = arith.shrui %79, %c13_i64 : i64
      %86 = arith.shli %77, %c19_i32 : i32
      %87 = arith.extsi %86 : i32 to i64
      %88 = arith.ori %85, %87 : i64
      %89 = arith.andi %88, %c4294967295_i64 : i64
      %90 = arith.xori %84, %89 : i64
      %91 = arith.shrui %79, %c22_i64 : i64
      %92 = arith.shli %77, %c10_i32 : i32
      %93 = arith.extsi %92 : i32 to i64
      %94 = arith.ori %91, %93 : i64
      %95 = arith.andi %94, %c4294967295_i64 : i64
      %96 = arith.xori %90, %95 : i64
      %97 = affine.load %alloca_1[1] : memref<8xi32>
      %98 = arith.ori %77, %97 : i32
      %99 = affine.load %alloca_1[2] : memref<8xi32>
      %100 = arith.andi %98, %99 : i32
      %101 = arith.andi %77, %97 : i32
      %102 = arith.ori %100, %101 : i32
      %103 = arith.extsi %102 : i32 to i64
      %104 = arith.addi %96, %103 : i64
      %105 = arith.trunci %104 : i64 to i32
      %106 = affine.load %alloca_1[3] : memref<8xi32>
      %107 = arith.addi %106, %76 : i32
      %108 = arith.addi %76, %105 : i32
      affine.store %63, %alloca_1[7] : memref<8xi32>
      affine.store %64, %alloca_1[6] : memref<8xi32>
      affine.store %42, %alloca_1[5] : memref<8xi32>
      affine.store %107, %alloca_1[4] : memref<8xi32>
      affine.store %99, %alloca_1[3] : memref<8xi32>
      affine.store %97, %alloca_1[2] : memref<8xi32>
      affine.store %77, %alloca_1[1] : memref<8xi32>
      affine.store %108, %alloca_1[0] : memref<8xi32>
    }
    affine.for %arg3 = 0 to 8 {
      %40 = affine.load %alloca_2[%arg3] : memref<8xi32>
      %41 = affine.load %alloca_1[%arg3] : memref<8xi32>
      %42 = arith.addi %40, %41 : i32
      affine.store %42, %alloca_2[%arg3] : memref<8xi32>
    }
    affine.for %arg3 = 0 to 8 {
      %40 = affine.load %alloca_2[%arg3] : memref<8xi32>
      %41 = arith.shrsi %40, %c24_i32 : i32
      %42 = arith.andi %41, %c255_i32 : i32
      %43 = arith.trunci %42 : i32 to i8
      affine.store %43, %arg0[%arg3 * 4] : memref<?xi8>
      %44 = arith.shrsi %40, %c16_i32 : i32
      %45 = arith.andi %44, %c255_i32 : i32
      %46 = arith.trunci %45 : i32 to i8
      affine.store %46, %arg0[%arg3 * 4 + 1] : memref<?xi8>
      %47 = arith.shrsi %40, %c8_i32 : i32
      %48 = arith.andi %47, %c255_i32 : i32
      %49 = arith.trunci %48 : i32 to i8
      affine.store %49, %arg0[%arg3 * 4 + 2] : memref<?xi8>
      %50 = arith.andi %40, %c255_i32 : i32
      %51 = arith.trunci %50 : i32 to i8
      affine.store %51, %arg0[%arg3 * 4 + 3] : memref<?xi8>
    }
    return %c0_i32 : i32
  }
}

