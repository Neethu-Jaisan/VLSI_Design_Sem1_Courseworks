#include <iostream>
#include <vector>
#include <cmath>
#include <cstdlib>

using namespace std;

struct Cell {
    double x, y;
    int cluster;
};

double distance(Cell a, Cell b) {
    return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}

int main() {
    int N, K;
    cout << "Enter number of cells: ";
    cin >> N;

    cout << "Enter number of clusters: ";
    cin >> K;

    vector<Cell> cells(N);
    vector<Cell> centroids(K);

    cout << "Enter x y coordinates of cells:\n";
    for (int i = 0; i < N; i++) {
        cin >> cells[i].x >> cells[i].y;
        cells[i].cluster = -1;
    }

    // Initialize centroids (first K cells)
    for (int i = 0; i < K; i++) {
        centroids[i] = cells[i];
    }

    bool changed = true;
    while (changed) {
        changed = false;

        // Assignment step
        for (int i = 0; i < N; i++) {
            double minDist = 1e9;
            int bestCluster = 0;

            for (int j = 0; j < K; j++) {
                double dist = distance(cells[i], centroids[j]);
                if (dist < minDist) {
                    minDist = dist;
                    bestCluster = j;
                }
            }

            if (cells[i].cluster != bestCluster) {
                cells[i].cluster = bestCluster;
                changed = true;
            }
        }

        // Update step
        vector<double> sumX(K, 0), sumY(K, 0);
        vector<int> count(K, 0);

        for (int i = 0; i < N; i++) {
            int c = cells[i].cluster;
            sumX[c] += cells[i].x;
            sumY[c] += cells[i].y;
            count[c]++;
        }

        for (int j = 0; j < K; j++) {
            if (count[j] != 0) {
                centroids[j].x = sumX[j] / count[j];
                centroids[j].y = sumY[j] / count[j];
            }
        }
    }

    cout << "\nFinal Clusters:\n";
    for (int i = 0; i < N; i++) {
        cout << "Cell (" << cells[i].x << ", " << cells[i].y 
             << ") -> Cluster " << cells[i].cluster << endl;
    }

    return 0;
}
