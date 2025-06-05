func.func @age_verification(%arg0: tensor<2xi16> {secret.secret}, %arg1: tensor<2xi16> {secret.secret}) -> i16 {
  %c0 = arith.constant 0 : index

  // Extract the single value from each 1-element tensor
  %0 = tensor.extract %arg0[%c0] : tensor<2xi16>
  %1 = tensor.extract %arg1[%c0] : tensor<2xi16>

  // Subtract the second from the first
  %2 = arith.subi %0, %1 : i16

  return %2 : i16
}

