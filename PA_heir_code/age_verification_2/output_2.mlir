!Z134250497_i64 = !mod_arith.int<134250497 : i64>
!Z33832961_i64 = !mod_arith.int<33832961 : i64>
!Z35184372121601_i64 = !mod_arith.int<35184372121601 : i64>
!Z65537_i64 = !mod_arith.int<65537 : i64>
!cc = !openfhe.crypto_context
!params = !openfhe.cc_params
!pk = !openfhe.public_key
!sk = !openfhe.private_key
#full_crt_packing_encoding = #lwe.full_crt_packing_encoding<scaling_factor = 1>
#full_crt_packing_encoding1 = #lwe.full_crt_packing_encoding<scaling_factor = 15281>
#full_crt_packing_encoding2 = #lwe.full_crt_packing_encoding<scaling_factor = 43694>
#full_crt_packing_encoding3 = #lwe.full_crt_packing_encoding<scaling_factor = 7289>
#key = #lwe.key<>
#modulus_chain_L2_C0 = #lwe.modulus_chain<elements = <134250497 : i64, 33832961 : i64, 35184372121601 : i64>, current = 0>
#modulus_chain_L2_C1 = #lwe.modulus_chain<elements = <134250497 : i64, 33832961 : i64, 35184372121601 : i64>, current = 1>
#modulus_chain_L2_C2 = #lwe.modulus_chain<elements = <134250497 : i64, 33832961 : i64, 35184372121601 : i64>, current = 2>
!rns_L0 = !rns.rns<!Z134250497_i64>
!rns_L1 = !rns.rns<!Z134250497_i64, !Z33832961_i64>
!rns_L2 = !rns.rns<!Z134250497_i64, !Z33832961_i64, !Z35184372121601_i64>
#ring_Z65537_i64_1_x2 = #polynomial.ring<coefficientType = !Z65537_i64, polynomialModulus = <1 + x**2>>
#ring_rns_L0_1_x2 = #polynomial.ring<coefficientType = !rns_L0, polynomialModulus = <1 + x**2>>
#ring_rns_L1_1_x2 = #polynomial.ring<coefficientType = !rns_L1, polynomialModulus = <1 + x**2>>
#ring_rns_L2_1_x2 = #polynomial.ring<coefficientType = !rns_L2, polynomialModulus = <1 + x**2>>
!pt = !lwe.new_lwe_plaintext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding2>>
!pt1 = !lwe.new_lwe_plaintext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding>>
!pt2 = !lwe.new_lwe_plaintext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding1>>
#ciphertext_space_L0 = #lwe.ciphertext_space<ring = #ring_rns_L0_1_x2, encryption_type = lsb>
#ciphertext_space_L1 = #lwe.ciphertext_space<ring = #ring_rns_L1_1_x2, encryption_type = lsb>
#ciphertext_space_L2 = #lwe.ciphertext_space<ring = #ring_rns_L2_1_x2, encryption_type = lsb>
#ciphertext_space_L2_D3 = #lwe.ciphertext_space<ring = #ring_rns_L2_1_x2, encryption_type = lsb, size = 3>
!ct_L0 = !lwe.new_lwe_ciphertext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding1>, ciphertext_space = #ciphertext_space_L0, key = #key, modulus_chain = #modulus_chain_L2_C0>
!ct_L1 = !lwe.new_lwe_ciphertext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding2>, ciphertext_space = #ciphertext_space_L1, key = #key, modulus_chain = #modulus_chain_L2_C1>
!ct_L1_1 = !lwe.new_lwe_ciphertext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding3>, ciphertext_space = #ciphertext_space_L1, key = #key, modulus_chain = #modulus_chain_L2_C1>
!ct_L1_2 = !lwe.new_lwe_ciphertext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding3>, ciphertext_space = #ciphertext_space_L1, key = #key, modulus_chain = #modulus_chain_L2_C1>
!ct_L2 = !lwe.new_lwe_ciphertext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding>, ciphertext_space = #ciphertext_space_L2, key = #key, modulus_chain = #modulus_chain_L2_C2>
!ct_L2_D3 = !lwe.new_lwe_ciphertext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding>, ciphertext_space = #ciphertext_space_L2_D3, key = #key, modulus_chain = #modulus_chain_L2_C2>
module attributes {scheme.bgv} {
  func.func @age_verification(%cc: !cc, %ct: !ct_L2, %ct_0: !ct_L2, %ct_1: !ct_L2) -> !ct_L0 {
    %cst = arith.constant dense<[1, 0]> : tensor<2xi64>
    %ct_2 = openfhe.mul_no_relin %cc, %ct_0, %ct_1 : (!cc, !ct_L2, !ct_L2) -> !ct_L2_D3
    %ct_3 = openfhe.mul_no_relin %cc, %ct, %ct_1 : (!cc, !ct_L2, !ct_L2) -> !ct_L2_D3
    %ct_4 = openfhe.sub %cc, %ct_3, %ct_2 : (!cc, !ct_L2_D3, !ct_L2_D3) -> !ct_L2_D3
    %ct_5 = openfhe.relin %cc, %ct_4 : (!cc, !ct_L2_D3) -> !ct_L2
    %ct_6 = openfhe.mod_reduce %cc, %ct_5 : (!cc, !ct_L2) -> !ct_L1
    %pt = openfhe.make_packed_plaintext %cc, %cst : (!cc, tensor<2xi64>) -> !pt
    %ct_7 = openfhe.mul_plain %cc, %ct_6, %pt : (!cc, !ct_L1, !pt) -> !ct_L1_1
    %ct_8 = openfhe.rot %cc, %ct_7 {index = 0 : index} : (!cc, !ct_L1_1) -> !ct_L1_1
    %ct_9 = lwe.reinterpret_application_data %ct_8 : !ct_L1_1 to !ct_L1_2
    %ct_10 = openfhe.mod_reduce %cc, %ct_9 : (!cc, !ct_L1_2) -> !ct_L0
    return %ct_10 : !ct_L0
  }
  func.func @age_verification__encrypt__arg0(%cc: !cc, %arg0: tensor<2xi16>, %pk: !pk) -> !ct_L2 {
    %0 = arith.extsi %arg0 : tensor<2xi16> to tensor<2xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<2xi64>) -> !pt1
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt1, !pk) -> !ct_L2
    return %ct : !ct_L2
  }
  func.func @age_verification__encrypt__arg1(%cc: !cc, %arg0: tensor<2xi16>, %pk: !pk) -> !ct_L2 {
    %0 = arith.extsi %arg0 : tensor<2xi16> to tensor<2xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<2xi64>) -> !pt1
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt1, !pk) -> !ct_L2
    return %ct : !ct_L2
  }
  func.func @age_verification__encrypt__arg2(%cc: !cc, %arg0: tensor<2xi16>, %pk: !pk) -> !ct_L2 {
    %0 = arith.extsi %arg0 : tensor<2xi16> to tensor<2xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<2xi64>) -> !pt1
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt1, !pk) -> !ct_L2
    return %ct : !ct_L2
  }
  func.func @age_verification__decrypt__result0(%cc: !cc, %ct: !ct_L0, %sk: !sk) -> i16 {
    %pt = openfhe.decrypt %cc, %ct, %sk : (!cc, !ct_L0, !sk) -> !pt2
    %0 = lwe.rlwe_decode %pt {encoding = #full_crt_packing_encoding1, ring = #ring_Z65537_i64_1_x2} : !pt2 -> i16
    return %0 : i16
  }
  func.func @age_verification__generate_crypto_context() -> !cc {
    %params = openfhe.gen_params  {evalAddCount = 2 : i64, keySwitchCount = 1 : i64, mulDepth = 2 : i64, plainMod = 65537 : i64} : () -> !params
    %cc = openfhe.gen_context %params {supportFHE = false} : (!params) -> !cc
    return %cc : !cc
  }
  func.func @age_verification__configure_crypto_context(%cc: !cc, %sk: !sk) -> !cc {
    openfhe.gen_mulkey %cc, %sk : (!cc, !sk) -> ()
    openfhe.gen_rotkey %cc, %sk {indices = array<i64: 0>} : (!cc, !sk) -> ()
    return %cc : !cc
  }
}

