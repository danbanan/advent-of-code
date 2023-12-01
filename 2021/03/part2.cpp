#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
#include <vector>

using namespace std;

#define BITNUM_LEN 5

int main() {

    ifstream input_file("input-test.txt");

    if (!input_file.is_open()) {
        cerr << "Could not open file\n";
        return EXIT_FAILURE;
    } 

    vector<bitset<BITNUM_LEN>> ox_gen_rating;
    vector<bitset<BITNUM_LEN>> scrubber_rating;
    vector<bitset<BITNUM_LEN>> all_bits;
    vector<bitset<BITNUM_LEN>>::iterator it;
    
    bitset<BITNUM_LEN> input_bits;

    int main_counter = 0;
    int counters[BITNUM_LEN] = { 0 };
    
    it = all_bits.begin();
    
    // count bits
    while (input_file >> input_bits) {
        it = all_bits.insert(it, input_bits);
        // bit at the is least significant set?
        if (input_bits.test(0)) {
            
        } else {
            
        }
    }

    // find most common bit
    for (int i = 0; i < BITNUM_LEN; i++) {
        if (counters[i] >= (main_counter / 2)) {
            
        } else {

        }
    }

    
    // cout << gamma.to_ulong() * epsilon.to_ulong() << "\n";
    
    input_file.close();
    
    return EXIT_SUCCESS;
}

int set_bit_count(vector<bitset<BITNUM_LEN>> vec, int pos){
    int count = 0;

    for (bitset<BITNUM_LEN> b : vec) {
        if (b.test(pos)) {
            count++;
        }
    }
    
    return count;
}
