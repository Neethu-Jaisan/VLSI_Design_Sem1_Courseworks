#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

struct Cell { double x,y; };

double dist(Cell a, Cell b) {
    return sqrt(pow(a.x-b.x,2)+pow(a.y-b.y,2));
}

int main() {
    vector<Cell> cells = {{1,1},{2,1},{8,8},{9,9}};
    vector<Cell> cluster;

    Cell seed = cells[0];
    cluster.push_back(seed);

    for(int i=1;i<cells.size();i++) {
        if(dist(seed, cells[i]) < 3)
            cluster.push_back(cells[i]);
    }

    cout << "Cluster size = " << cluster.size();
}
