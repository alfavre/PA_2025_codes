
#include "src/pke/include/openfhe.h"  // from @openfhe
#include "heir_output_2.h"

using namespace lbcrypto;
using CiphertextT = ConstCiphertext<DCRTPoly>;
using MutableCiphertextT = Ciphertext<DCRTPoly>;
using CCParamsT = CCParams<CryptoContextBGVRNS>;
using CryptoContextT = CryptoContext<DCRTPoly>;
using EvalKeyT = EvalKey<DCRTPoly>;
using PlaintextT = Plaintext;
using PrivateKeyT = PrivateKey<DCRTPoly>;
using PublicKeyT = PublicKey<DCRTPoly>;

CiphertextT age_verification(CryptoContextT cc, CiphertextT ct, CiphertextT ct1, CiphertextT ct2) {
  std::vector<int64_t> v0 = {1, 0};
  const auto& ct3 = cc->EvalMultNoRelin(ct1, ct2);
  const auto& ct4 = cc->EvalMultNoRelin(ct, ct2);
  const auto& ct5 = cc->EvalSub(ct4, ct3);
  const auto& ct6 = cc->Relinearize(ct5);
  const auto& ct7 = cc->ModReduce(ct6);
  auto pt_filled_n = cc->GetCryptoParameters()->GetElementParams()->GetRingDimension() / 2;
  auto pt_filled = v0;
  pt_filled.clear();
  pt_filled.reserve(pt_filled_n);
  for (unsigned i = 0; i < pt_filled_n; ++i) {
    pt_filled.push_back(v0[i % v0.size()]);
  }
  const auto& pt = cc->MakePackedPlaintext(pt_filled);
  const auto& ct8 = cc->EvalMult(ct7, pt);
  const auto& ct9 = cc->EvalRotate(ct8, 0);
  const auto& ct10 = ct9;
  const auto& ct11 = cc->ModReduce(ct10);
  return ct11;
}
CiphertextT age_verification__encrypt__arg0(CryptoContextT cc, std::vector<int16_t> v0, PublicKeyT pk) {
  std::vector<int64_t> v1(std::begin(v0), std::end(v0));
  auto pt_filled_n = cc->GetCryptoParameters()->GetElementParams()->GetRingDimension() / 2;
  auto pt_filled = v1;
  pt_filled.clear();
  pt_filled.reserve(pt_filled_n);
  for (unsigned i = 0; i < pt_filled_n; ++i) {
    pt_filled.push_back(v1[i % v1.size()]);
  }
  const auto& pt = cc->MakePackedPlaintext(pt_filled);
  const auto& ct = cc->Encrypt(pk, pt);
  return ct;
}
CiphertextT age_verification__encrypt__arg1(CryptoContextT cc, std::vector<int16_t> v0, PublicKeyT pk) {
  std::vector<int64_t> v1(std::begin(v0), std::end(v0));
  auto pt_filled_n = cc->GetCryptoParameters()->GetElementParams()->GetRingDimension() / 2;
  auto pt_filled = v1;
  pt_filled.clear();
  pt_filled.reserve(pt_filled_n);
  for (unsigned i = 0; i < pt_filled_n; ++i) {
    pt_filled.push_back(v1[i % v1.size()]);
  }
  const auto& pt = cc->MakePackedPlaintext(pt_filled);
  const auto& ct = cc->Encrypt(pk, pt);
  return ct;
}
CiphertextT age_verification__encrypt__arg2(CryptoContextT cc, std::vector<int16_t> v0, PublicKeyT pk) {
  std::vector<int64_t> v1(std::begin(v0), std::end(v0));
  auto pt_filled_n = cc->GetCryptoParameters()->GetElementParams()->GetRingDimension() / 2;
  auto pt_filled = v1;
  pt_filled.clear();
  pt_filled.reserve(pt_filled_n);
  for (unsigned i = 0; i < pt_filled_n; ++i) {
    pt_filled.push_back(v1[i % v1.size()]);
  }
  const auto& pt = cc->MakePackedPlaintext(pt_filled);
  const auto& ct = cc->Encrypt(pk, pt);
  return ct;
}
int16_t age_verification__decrypt__result0(CryptoContextT cc, CiphertextT ct, PrivateKeyT sk) {
  PlaintextT pt;
  cc->Decrypt(sk, ct, &pt);
  int16_t v0 = pt->GetPackedValue()[0];
  return v0;
}
CryptoContextT age_verification__generate_crypto_context() {
  CCParamsT params;
  params.SetMultiplicativeDepth(2);
  params.SetPlaintextModulus(65537);
  params.SetEvalAddCount(2);
  params.SetKeySwitchCount(1);
  params.SetKeySwitchTechnique(HYBRID);
  CryptoContextT cc = GenCryptoContext(params);
  cc->Enable(PKE);
  cc->Enable(KEYSWITCH);
  cc->Enable(LEVELEDSHE);
  return cc;
}
CryptoContextT age_verification__configure_crypto_context(CryptoContextT cc, PrivateKeyT sk) {
  cc->EvalMultKeyGen(sk);
  cc->EvalRotateKeyGen(sk, {0});
  return cc;
}
