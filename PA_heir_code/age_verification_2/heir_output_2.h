
#include "src/pke/include/openfhe.h"  // from @openfhe

using namespace lbcrypto;
using CiphertextT = ConstCiphertext<DCRTPoly>;
using MutableCiphertextT = Ciphertext<DCRTPoly>;
using CCParamsT = CCParams<CryptoContextBGVRNS>;
using CryptoContextT = CryptoContext<DCRTPoly>;
using EvalKeyT = EvalKey<DCRTPoly>;
using PlaintextT = Plaintext;
using PrivateKeyT = PrivateKey<DCRTPoly>;
using PublicKeyT = PublicKey<DCRTPoly>;

CiphertextT age_verification(CryptoContextT cc, CiphertextT ct, CiphertextT ct1, CiphertextT ct2);
CiphertextT age_verification__encrypt__arg0(CryptoContextT cc, std::vector<int16_t> v0, PublicKeyT pk);
CiphertextT age_verification__encrypt__arg1(CryptoContextT cc, std::vector<int16_t> v0, PublicKeyT pk);
CiphertextT age_verification__encrypt__arg2(CryptoContextT cc, std::vector<int16_t> v0, PublicKeyT pk);
int16_t age_verification__decrypt__result0(CryptoContextT cc, CiphertextT ct, PrivateKeyT sk);
CryptoContextT age_verification__generate_crypto_context();
CryptoContextT age_verification__configure_crypto_context(CryptoContextT cc, PrivateKeyT sk);
