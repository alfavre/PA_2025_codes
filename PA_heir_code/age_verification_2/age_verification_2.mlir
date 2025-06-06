func.func @age_verification(%arg0: tensor<2xi16> {secret.secret}, %arg1: tensor<2xi16> {secret.secret}, %arg2: tensor<2xi16> {secret.secret}) -> i16 {
  %c0 = arith.constant 0 : index

  // Extract the single value from each 1-element tensor
  %0 = tensor.extract %arg0[%c0] : tensor<2xi16>
  %1 = tensor.extract %arg1[%c0] : tensor<2xi16>
  %2 = tensor.extract %arg2[%c0] : tensor<2xi16>

  // Compute %0 * %2 and %1 * %2
  %mul0 = arith.muli %0, %2 : i16
  %mul1 = arith.muli %1, %2 : i16

  // Compute the difference: (%0 * %2) - (%1 * %2)
  %diff = arith.subi %mul0, %mul1 : i16

  return %diff : i16
}

