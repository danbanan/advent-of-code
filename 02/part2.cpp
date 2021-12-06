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

    int pos   = 0;
    int depth = 0;
    int aim   = 0;
    
    string command;
    int value;
    
    while (input_file >> command) {
        input_file >> value;
        
        if (!command.compare("forward")) {
            pos   += value;
            depth += aim * value;
        } else if (!command.compare("up")) {
            aim -= value;
        } else {                // down 
            aim += value;
        }
    }

    cout << pos * depth << "\n";
    
    input_file.close();
    
    return EXIT_SUCCESS;
}
