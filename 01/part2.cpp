#include <cstdlib>
#include <iostream>
#include <fstream>
#include <numeric>

using namespace std;

#define WINDOW_LEN 3

int main() {

    ifstream input_file("input.txt");

    if (!input_file.is_open()) {
        cerr << "Could not open file\n";
        return EXIT_FAILURE;
    } 

    int count    = 0;
    int curr_sum = 0;
    int prev_sum = 0;

    int window[WINDOW_LEN] = { 0 };

    input_file >> window[0];
    input_file >> window[1];
    input_file >> window[2];
    
    curr_sum = accumulate(window, window+WINDOW_LEN, 0.0);
    prev_sum = curr_sum;
    
    int i = 0;
    
    while (input_file >> window[i % WINDOW_LEN]) {
        curr_sum = accumulate(window, window+WINDOW_LEN, 0.0);

        if (curr_sum > prev_sum) 
            count++;
        
        prev_sum = curr_sum;
        i++;
    } 

    cout << count << "\n";
    
    input_file.close();
    
    return EXIT_SUCCESS;
}
