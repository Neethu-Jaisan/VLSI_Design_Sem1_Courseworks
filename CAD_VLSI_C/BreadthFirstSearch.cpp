#include <iostream>
#include <queue>
using namespace std;

int main() {
    int n = 5;
    int graph[5][5] = {{0,1,1,0,0},{1,0,0,1,0},{1,0,0,0,1},{0,1,0,0,0},{0,0,1,0,0}};
    bool visited[5] = {false};

    queue<int> q;
    q.push(0);
    visited[0] = true;

    while(!q.empty()) {
        int u = q.front(); q.pop();
        cout << u << " ";

        for(int v=0;v<n;v++) {
            if(graph[u][v] && !visited[v]) {
                visited[v] = true;
                q.push(v);
            }
        }
    }
}
