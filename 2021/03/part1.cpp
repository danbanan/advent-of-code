#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <bitset>

using namespace std;

#define BITNUM_LEN 12

int main() {

    ifstream input_file("input.txt");

    if (!input_file.is_open()) {
        cerr << "Could not open file\n";
        return EXIT_FAILURE;
    } 

    bitset<BITNUM_LEN> gamma;
    bitset<BITNUM_LEN> epsilon;
    bitset<BITNUM_LEN> input_bits;

    int main_counter = 0;
    int counters[BITNUM_LEN] = { 0 };

    // count bits
    while (input_file >> input_bits) {
        for (int i = 0; i < BITNUM_LEN; i++) {
            // bit at position i set? position 0 is least significant
            if (input_bits.test(i)) {
                counters[i] += 1;
            }
        }
        main_counter++;
    }
    
    // find most common bit
    for (int i = 0; i < BITNUM_LEN; i++) {
        if (counters[i] > (main_counter / 2)) {
            gamma.set(i, true);
        } else {
            epsilon.set(i, true);
        }
    }
    
    cout << gamma.to_ulong() * epsilon.to_ulong() << "\n";
    
    input_file.close();
    
    return EXIT_SUCCESS;
}
