// SHA256 implementation originally by Jérémy LAMBERT (SystemGlitch)
// https://github.com/System-Glitch/SHA256/blob/master/src/main.cpp

#include <iostream>
#include <chrono>
#include <ctime>
#include "SHA256.h"

int main(int argc, char ** argv) {

	for(int i = 1 ; i < argc ; i++) {
		SHA256 sha;
		sha.update(argv[i]);
		std::array<uint8_t, 32> digest = sha.digest();

		std::cout << SHA256::toString(digest) << std::endl;
	}

	return EXIT_SUCCESS;
}