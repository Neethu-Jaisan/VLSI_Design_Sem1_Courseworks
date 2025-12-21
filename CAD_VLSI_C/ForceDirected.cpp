#include <iostream>
#include <vector>
using namespace std;

struct Cell {
    double x, y;
};

int main() {
    vector<Cell> cells = {{1,1},{5,1},{3,4}};
    double k = 0.1;

    for(int iter=0; iter<10; iter++) {
        for(int i=0;i<cells.size();i++) {
            double fx=0, fy=0;
            for(int j=0;j<cells.size();j++) {
                if(i!=j) {
                    fx += k*(cells[j].x - cells[i].x);
                    fy += k*(cells[j].y - cells[i].y);
                }
            }
            cells[i].x += fx;
            cells[i].y += fy;
        }
    }

    for(int i=0;i<cells.size();i++)
        cout<<"Cell "<<i<<" -> ("<<cells[i].x<<","<<cells[i].y<<")\n";
}
