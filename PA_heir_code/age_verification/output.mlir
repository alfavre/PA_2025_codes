!Z1073750017_i64 = !mod_arith.int<1073750017 : i64>
!Z65537_i64 = !mod_arith.int<65537 : i64>
!Z67239937_i64 = !mod_arith.int<67239937 : i64>
!cc = !openfhe.crypto_context
!params = !openfhe.cc_params
!pk = !openfhe.public_key
!sk = !openfhe.private_key
#full_crt_packing_encoding = #lwe.full_crt_packing_encoding<scaling_factor = 1>
#full_crt_packing_encoding1 = #lwe.full_crt_packing_encoding<scaling_factor = 58256>
#key = #lwe.key<>
#modulus_chain_L1_C0 = #lwe.modulus_chain<elements = <67239937 : i64, 1073750017 : i64>, current = 0>
#modulus_chain_L1_C1 = #lwe.modulus_chain<elements = <67239937 : i64, 1073750017 : i64>, current = 1>
!rns_L0 = !rns.rns<!Z67239937_i64>
!rns_L1 = !rns.rns<!Z67239937_i64, !Z1073750017_i64>
#ring_Z65537_i64_1_x2 = #polynomial.ring<coefficientType = !Z65537_i64, polynomialModulus = <1 + x**2>>
#ring_rns_L0_1_x2 = #polynomial.ring<coefficientType = !rns_L0, polynomialModulus = <1 + x**2>>
#ring_rns_L1_1_x2 = #polynomial.ring<coefficientType = !rns_L1, polynomialModulus = <1 + x**2>>
!pt = !lwe.new_lwe_plaintext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding>>
!pt1 = !lwe.new_lwe_plaintext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding1>>
#ciphertext_space_L0 = #lwe.ciphertext_space<ring = #ring_rns_L0_1_x2, encryption_type = lsb>
#ciphertext_space_L1 = #lwe.ciphertext_space<ring = #ring_rns_L1_1_x2, encryption_type = lsb>
!ct_L0 = !lwe.new_lwe_ciphertext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding1>, ciphertext_space = #ciphertext_space_L0, key = #key, modulus_chain = #modulus_chain_L1_C0>
!ct_L1 = !lwe.new_lwe_ciphertext<application_data = <message_type = tensor<2xi16>>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding>, ciphertext_space = #ciphertext_space_L1, key = #key, modulus_chain = #modulus_chain_L1_C1>
!ct_L1_1 = !lwe.new_lwe_ciphertext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x2, encoding = #full_crt_packing_encoding>, ciphertext_space = #ciphertext_space_L1, key = #key, modulus_chain = #modulus_chain_L1_C1>
module attributes {scheme.bgv} {
  func.func @age_verification(%cc: !cc, %ct: !ct_L1, %ct_0: !ct_L1) -> !ct_L0 {
    %cst = arith.constant dense<[1, 0]> : tensor<2xi64>
    %ct_1 = openfhe.sub %cc, %ct, %ct_0 : (!cc, !ct_L1, !ct_L1) -> !ct_L1
    %pt = openfhe.make_packed_plaintext %cc, %cst : (!cc, tensor<2xi64>) -> !pt
    %ct_2 = openfhe.mul_plain %cc, %ct_1, %pt : (!cc, !ct_L1, !pt) -> !ct_L1
    %ct_3 = openfhe.rot %cc, %ct_2 {index = 0 : index} : (!cc, !ct_L1) -> !ct_L1
    %ct_4 = lwe.reinterpret_application_data %ct_3 : !ct_L1 to !ct_L1_1
    %ct_5 = openfhe.mod_reduce %cc, %ct_4 : (!cc, !ct_L1_1) -> !ct_L0
    return %ct_5 : !ct_L0
  }
  func.func @age_verification__encrypt__arg0(%cc: !cc, %arg0: tensor<2xi16>, %pk: !pk) -> !ct_L1 {
    %0 = arith.extsi %arg0 : tensor<2xi16> to tensor<2xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<2xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L1
    return %ct : !ct_L1
  }
  func.func @age_verification__encrypt__arg1(%cc: !cc, %arg0: tensor<2xi16>, %pk: !pk) -> !ct_L1 {
    %0 = arith.extsi %arg0 : tensor<2xi16> to tensor<2xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<2xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L1
    return %ct : !ct_L1
  }
  func.func @age_verification__decrypt__result0(%cc: !cc, %ct: !ct_L0, %sk: !sk) -> i16 {
    %pt = openfhe.decrypt %cc, %ct, %sk : (!cc, !ct_L0, !sk) -> !pt1
    %0 = lwe.rlwe_decode %pt {encoding = #full_crt_packing_encoding1, ring = #ring_Z65537_i64_1_x2} : !pt1 -> i16
    return %0 : i16
  }
  func.func @age_verification__generate_crypto_context() -> !cc {
    %params = openfhe.gen_params  {evalAddCount = 2 : i64, keySwitchCount = 1 : i64, mulDepth = 1 : i64, plainMod = 65537 : i64} : () -> !params
    %cc = openfhe.gen_context %params {supportFHE = false} : (!params) -> !cc
    return %cc : !cc
  }
  func.func @age_verification__configure_crypto_context(%cc: !cc, %sk: !sk) -> !cc {
    openfhe.gen_rotkey %cc, %sk {indices = array<i64: 0>} : (!cc, !sk) -> ()
    return %cc : !cc
  }
}

