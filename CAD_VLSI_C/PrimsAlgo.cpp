#include <iostream>
#include <vector>
using namespace std;

#define INF 1e9

int main() {
    int n = 4;
    int cost[4][4] = {
        {0,10,6,5},
        {10,0,0,15},
        {6,0,0,4},
        {5,15,4,0}
    };

    vector<int> key(n, INF);
    vector<bool> mst(n, false);

    key[0] = 0;

    for(int i=0;i<n;i++) {
        int u = -1;
        for(int j=0;j<n;j++)
            if(!mst[j] && (u==-1 || key[j] < key[u]))
                u = j;

        mst[u] = true;

        for(int v=0;v<n;v++)
            if(cost[u][v] && !mst[v] && cost[u][v] < key[v])
                key[v] = cost[u][v];
    }

    int total = 0;
    for(int i=0;i<n;i++) total += key[i];
    cout << "Total wirelength = " << total;
}
