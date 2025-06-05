#include "diff.h"

bool av(int16_t input, int16_t days_in_25) {
    int16_t c = input - days_in_25;
    return (c > 0);
}
