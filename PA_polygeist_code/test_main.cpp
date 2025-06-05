#include <iostream>
#include <cstdlib>   // for std::atoi
#include <cstdint>
#include "diff.h"

int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0] << " <input>\n";
        return 1;
    }

    int16_t a = static_cast<int16_t>(std::atoi(argv[1]));
    int16_t days_in_25 = static_cast<int16_t>(std::atoi(argv[2]));

    bool result = av(a, days_in_25);

    std::cout << "av(" << a << ", " << days_in_25 << ") = " 
              << (result ? "true" : "false") << std::endl;

    return 0;
}