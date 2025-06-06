#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <iostream>

//#include "ciphertext-ser.h"
#include "cryptocontext-ser.h"
#include "heir_output_2.h"
//#include "key/key-ser.h"
#include "src/pke/include/openfhe.h"  // from @openfhe

static bool convert_to_int16(const char* my_uint, int16_t* value) {
  char* endptr;

  long tmp_long = strtol(my_uint, &endptr, 10);

  if (*endptr != '\0' || tmp_long < INT16_MIN || tmp_long > INT16_MAX) {
    return false;
  }

  *value = (int16_t)tmp_long;
  return true;
}

static void usage(const char* argv0) {
  printf("Usage: %s <path to key> <path to ct>\n", argv0);
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

  // Deserialize the privkey
  PrivateKey<DCRTPoly> sk;
  if (!Serial::DeserializeFromFile(argv[1], sk, SerType::BINARY)) {
    std::cerr << "Could not read privkey: " << argv[1] << std::endl;
    return 1;
  }
  std::cout << "The private key has been deserialized." << std::endl;

  // deserializing ciphertexts
  Ciphertext<DCRTPoly> ct;
  if (!Serial::DeserializeFromFile(argv[2], ct, SerType::BINARY)) {
    std::cerr << "Could not read the ciphertext: " << argv[2] << std::endl;
    return 1;
  }
  std::cout << "The ciphertext has been deserialized." << std::endl;

  auto actual = age_verification__decrypt__result0(cryptoContext, ct, sk);

  printf("%d\n", actual);
  return 0;
}