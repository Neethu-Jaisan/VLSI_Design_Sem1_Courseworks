#include <iostream>
using namespace std;

int graph[5][5] = {{0,1,1,0,0},{1,0,0,1,0},{1,0,0,0,1},{0,1,0,0,0},{0,0,1,0,0}};
bool visited[5];

void dfs(int u) {
    visited[u] = true;
    cout << u << " ";
    for(int v=0;v<5;v++)
        if(graph[u][v] && !visited[v])
            dfs(v);
}

int main() {
    dfs(0);
}
