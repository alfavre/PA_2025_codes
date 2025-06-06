#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <vector>

#include "heir_output_2.h"
#include "src/pke/include/openfhe.h"  // from @openfhe

// for serialization
#include "ciphertext-ser.h"
#include "cryptocontext-ser.h"
#include "key/key-ser.h"
#include "scheme/bgvrns/bgvrns-ser.h"

static void usage(const char* argv0) {
  printf("Usage: %s\n", argv0);
  exit(1);
}

int main(int argc, char* argv[]) {
  // if (argc != 3) {
  //   usage(argv[0]);
  // }

  // create crypto context
  CryptoContext<DCRTPoly> cryptoContext =
      age_verification__generate_crypto_context();

  // generate keyPair
  KeyPair<DCRTPoly> keyPair;
  keyPair = cryptoContext->KeyGen();

  // Rotate key
  cryptoContext = age_verification__configure_crypto_context(cryptoContext,
                                                             keyPair.secretKey);

  // (code block from
  // https://github.com/openfheorg/openfhe-development/blob/main/src/pke/examples/simple-integers-serial-bgvrns.cpp)
  // I could have used this instead:
  // cc->Serialize("crypto_context.json", SerType::JSON);
  // cc->SerializeEvalMultKey("mult_keys.json", SerType::JSON);
  // cc->SerializeEvalAutomorphismKey("rot_keys.json", SerType::JSON);
  // serialize crypto context:
  if (!Serial::SerializeToFile("cryptocontext_av.bin", cryptoContext,
                               SerType::BINARY)) {
    std::cerr << "Error writing serialization of the crypto context to "
                 "cryptocontext_av.bin"
              << std::endl;
    return 1;
  }
  std::cout << "The cryptocontext has been serialized." << std::endl;

  // because cc has been encrypted without all intermediary keys generated at
  // age_verification__configure_crypto_context we need to serialize them too:

  // Serialize the rotation keyhs
  std::ofstream erkeyfile("key-eval-rot.bin", std::ios::out | std::ios::binary);
  if (erkeyfile.is_open()) {
    if (!cryptoContext->SerializeEvalAutomorphismKey(erkeyfile,
                                                     SerType::BINARY)) {
      std::cerr << "Error writing serialization of the eval rotation keys to "
                   "key-eval-rot.bin"
                << std::endl;
      return 1;
    }
    std::cout << "The eval rotation keys have been serialized." << std::endl;

    erkeyfile.close();
  } else {
    std::cerr << "Error serializing eval rotation keys" << std::endl;
    return 1;
  }

  // Serialize the multi key
  std::ofstream emkeyfile("key-eval-mult.bin",
                          std::ios::out | std::ios::binary);
  if (emkeyfile.is_open()) {
    if (!cryptoContext->SerializeEvalMultKey(emkeyfile, SerType::BINARY)) {
      std::cerr << "Error writing serialization of eval mult keys to "
                   "key-eval-mult.bin"
                << std::endl;
      return 1;
    }
    std::cout << "The eval mult keys have been serialized." << std::endl;
    
    emkeyfile.close();
  } else {
    std::cerr << "Error opening file for eval mult keys" << std::endl;
    return 1;
  }

  // Serialize the public key
  if (!Serial::SerializeToFile("pubkey_av.bin", keyPair.publicKey,
                               SerType::BINARY)) {
    std::cerr << "Error writing serialization of public key to pubkey_av.bin"
              << std::endl;
    return 1;
  }
  std::cout << "The public key has been serialized." << std::endl;

  // Serialize the secret key
  if (!Serial::SerializeToFile("privkey_av.bin", keyPair.secretKey,
                               SerType::BINARY)) {
    std::cerr << "Error writing serialization of private key to privkey_av.bin"
              << std::endl;
    return 1;
  }
  std::cout << "The secret key has been serialized." << std::endl;

  /*
  // second value 1 is unused in this code
  std::vector<int16_t> arg0 = {left, 2};
  std::vector<int16_t> arg1 = {right, 3};
  int64_t expected = left - right;

  // the two args encryption are stupid, its the same function, but it means we
  // could have different args struct
  auto arg0Encrypted =
      age_verification__encrypt__arg0(cryptoContext, arg0, keyPair.publicKey);
  auto arg1Encrypted =
      age_verification__encrypt__arg1(cryptoContext, arg1, keyPair.publicKey);
  auto outputEncrypted =
      age_verification(cryptoContext, arg0Encrypted, arg1Encrypted);
  auto actual = age_verification__decrypt__result0(
      cryptoContext, outputEncrypted, keyPair.secretKey);

  // std::cout << "Expected: " << expected << "\n";
  // std::cout << "Actual: " << actual << "\n";
  */
  printf("Key and context initialized.\n");
  return 0;
}