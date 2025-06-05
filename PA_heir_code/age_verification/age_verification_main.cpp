#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <vector>

#include "heir_output.h"
#include "src/pke/include/openfhe.h"  // from @openfhe

// for serialization
#include "ciphertext-ser.h"
#include "cryptocontext-ser.h"
#include "key/key-ser.h"
#include "scheme/bgvrns/bgvrns-ser.h"

static void usage(const char* argv0) {
  printf("Usage: %s <ct 1 path> <ct 2 path>\n", argv0);
  exit(1);
}

int main(int argc, char* argv[]) {
  if (argc != 3) {
    usage(argv[0]);
  }

  // Deserialize the crypto context
  CryptoContext<DCRTPoly> cryptoContext;
  if (!Serial::DeserializeFromFile("cryptocontext_av.bin", cryptoContext,
                                   SerType::BINARY)) {
    std::cerr << "I cannot read serialization from "
              << "cryptocontext_av.bin" << std::endl;
    return 1;
  }
  std::cout << "The cryptocontext has been deserialized." << std::endl;

  // Deserialize the rotation key

  std::ifstream erkeys("key-eval-rot.bin",
                       std::ios::in | std::ios::binary);
  if (!erkeys.is_open()) {
    std::cerr << "I cannot read serialization from "
              << "key-eval-rot.bin" << std::endl;
    return 1;
  }
  if (!cryptoContext->DeserializeEvalAutomorphismKey(erkeys, SerType::BINARY)) {
    std::cerr << "Could not deserialize the eval rotation key file"
              << std::endl;
    return 1;
  }
  std::cout << "Deserialized the eval rotation keys." << std::endl;

  // deserializing ciphertexts 1
  Ciphertext<DCRTPoly> ct1;
  if (!Serial::DeserializeFromFile(argv[1], ct1, SerType::BINARY)) {
    std::cerr << "Could not read the ciphertext 1: " << argv[1] << std::endl;
    return 1;
  }
  std::cout << "The ciphertext 1 has been deserialized." << std::endl;

  // deserializing ciphertexts 2
  Ciphertext<DCRTPoly> ct_2;
  if (!Serial::DeserializeFromFile(argv[2], ct_2, SerType::BINARY)) {
    std::cerr << "Could not read the ciphertext 2: " << argv[2] << std::endl;
    return 1;
  }
  std::cout << "The ciphertext 2 has been deserialized." << std::endl;

  auto outputEncrypted = age_verification(cryptoContext, ct1, ct_2);

  // Serialize the ct
  if (!Serial::SerializeToFile("ct_av_result.bin", outputEncrypted,
                               SerType::BINARY)) {
    std::cerr << "Could not read cipher text" << std::endl;
    return 1;
  }
  std::cout << "The ciphertext has been serialized." << std::endl;
  // std::cout << "Expected: " << expected << "\n";
  // std::cout << "Actual: " << actual << "\n";
  printf("Computation done.\n");
  return 0;
}