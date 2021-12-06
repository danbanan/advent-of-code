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

    int x = 0;
    int y = 0;
    
    string command;
    int value;
    
    while (input_file >> command) {
        input_file >> value;
        
        if (!command.compare("forward")) {
            x += value;
        } else if (!command.compare("up")) {
            y -= value;
        } else {                // down 
            y += value;
        }
    }

    cout << x * y << "\n";
    
    input_file.close();
    
    return EXIT_SUCCESS;
}
