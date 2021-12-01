#include <cstdlib>
#include <iostream>
#include <fstream>

using namespace std;

int main() {

    ifstream input_file("input.txt");

    if (!input_file.is_open()) {
        cerr << "Could not open file\n";
        return EXIT_FAILURE;
    } 

    int prev, curr, count = 0;

    input_file >> curr;
    prev = curr;

    do {
        if (curr > prev) {
            count++;
        }
        prev = curr;
    } while (input_file >> curr);

    cout << count << "\n";
    
    input_file.close();
    
    return EXIT_SUCCESS;
}
