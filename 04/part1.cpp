#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <iomanip>

using namespace std;

#define RESET   "\033[0m"
#define BLACK   "\033[30m"      /* Black */
#define RED     "\033[31m"      /* Red */

#define BOARD_SIZE 25           // 5x5

struct container_t {
    int num;
    bool drawn;
};

void print_boards(vector<vector<container_t>> *boards);
int  mark_draw(vector<container_t> *board, int num);
bool winning_row(vector<container_t> *board, int pos);
bool winning_column(vector<container_t> *board, int pos);
int  sum_of_unmarked(vector<container_t> *board);

int main() {

    ifstream input_file("input.txt");

    if (!input_file.is_open()) {
        cerr << "Could not open file\n";
        return EXIT_FAILURE;
    } 

    string input_str;

    input_file >> input_str;

    stringstream ss(input_str);
    string str;
    vector<int> draws;

    // tokenize and store numbers to be drawn
    while (getline(ss, str, ',')) {
        draws.push_back(stoi(str));
    }

    vector<vector<container_t>> boards;
    vector<container_t> board(BOARD_SIZE);
    int num, i;

    // populate boards
    while (input_file >> num) {
        i = 0;
        do {
            board[i].num = num;
            board[i].drawn = false;
            i++;
        } while(i < BOARD_SIZE && input_file >> num);
        boards.push_back(board);
    }
    
    for (int d : draws) {
        cout << "drawing number: " << d << endl;
        for (auto &b : boards) {
            int pos = mark_draw(&b, d);
            if (pos != -1) {
                if (winning_row(&b, pos) || winning_column(&b, pos)) {
                    print_boards(&boards);
                    cout << sum_of_unmarked(&b) * d << endl;
                    input_file.close();
                    return EXIT_SUCCESS;
                }
            }
        }
    }

    
    
    input_file.close();
    
    return EXIT_SUCCESS;
}

// dunno how reduce work in C++ lol
int sum_of_unmarked(vector<container_t> *board) {
    int sum = 0;
    for (container_t c : *board) {
        if (!c.drawn) {
            sum += c.num;
        }
    }
    return sum;
}

bool winning_row(vector<container_t> *board, int pos) {
    int initial = pos - (pos % 5); 
    for (int i = initial; i < BOARD_SIZE && i < initial + 5; i++) {
        if (!(*(board))[i].drawn) {
            return false;
        }
    }
    return true;
}

bool winning_column(vector<container_t> *board, int pos) {
    for (int i = pos % 5; i < BOARD_SIZE; i += 5) {
        if (!(*(board))[i].drawn) {
            return false;
        }
    }
    return true;
}

int mark_draw(vector<container_t> *board, int num) {
    for (int i = 0; i < BOARD_SIZE; i++) {
        if ((*(board))[i].num == num) {
            (*(board))[i].drawn = true;
            return i;
        }
    }
    
    return -1;
}

void print_boards(vector<vector<container_t>> *boards) {
    for (vector<container_t> b : *boards) {
        for (int i = 0; i < BOARD_SIZE; i++) {
            if (i % 5 == 0) {
                cout << endl;
            }

            if (b[i].drawn) {
                cout << RED << setw(2) << b[i].num << RESET << " ";
            } else {
                cout << setw(2) << b[i].num << " ";
            }
            
        }
        cout << endl;
    }
}
