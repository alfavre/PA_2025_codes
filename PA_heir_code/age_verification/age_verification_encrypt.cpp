#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <vector>

//#include "ciphertext-ser.h"
#include "cryptocontext-ser.h"
#include "heir_output.h"
//#include "key/key-ser.h"
#include "src/pke/include/openfhe.h"  // from @openfhe

static void usage(const char* argv0) {
  printf("Usage: %s <int16_t>\n", argv0);
  exit(1);
}

static bool check_int16(const char* my_uint, int16_t* value) {
  char* endptr;

  long tmp_long = strtol(my_uint, &endptr, 10);

  if (*endptr != '\0' || tmp_long < INT16_MIN || tmp_long > INT16_MAX) {
    return false;
  }

  *value = (int16_t)tmp_long;
  return true;
}

int main(int argc, char* argv[]) {
  if (argc != 2) {
    usage(argv[0]);
  }

  // get the shorts:
  int16_t my_int16;
  if (!check_int16(argv[1], &my_int16)) {
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

  // Deserialize the pubkey
  PublicKey<DCRTPoly> pk;
  if (!Serial::DeserializeFromFile("pubkey_av.bin", pk, SerType::BINARY)) {
    std::cerr << "Could not read pubkey_av" << std::endl;
    return 1;
  }
  std::cout << "The public key has been deserialized." << std::endl;

  // second value [1] is unused in this code
  std::vector<int16_t> arg0 = {my_int16, 2};

  // the two args encryption are stupid, its the same function, but it means we
  // could have different args struct
  auto arg0Encrypted = age_verification__encrypt__arg0(cryptoContext, arg0, pk);

  // Serialize the ct
  if (!Serial::SerializeToFile("ct_av.bin", arg0Encrypted, SerType::BINARY)) {
    std::cerr << "Could not read cipher text" << std::endl;
    return 1;
  }
  std::cout << "The ciphertext has been serialized." << std::endl;

  return 0;
}