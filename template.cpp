#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {

    ifstream input_file("input.txt");

    if (!input_file.is_open()) {
        cerr << "Could not open file\n";
        return EXIT_FAILURE;
    } 

    input_file.close();
    
    return EXIT_SUCCESS;
}
