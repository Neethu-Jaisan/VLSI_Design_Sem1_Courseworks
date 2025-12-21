#include <iostream>
#include <vector>
#include <queue>
using namespace std;

#define INF 1e9

int main() {
    int n = 5;
    vector<vector<pair<int,int>>> graph(n);

    graph[0].push_back({1,2});
    graph[0].push_back({2,4});
    graph[1].push_back({2,1});
    graph[1].push_back({3,7});
    graph[2].push_back({4,3});

    vector<int> dist(n, INF);
    priority_queue<pair<int,int>, vector<pair<int,int>>, greater<>> pq;

    dist[0] = 0;
    pq.push({0,0});

    while(!pq.empty()) {
        int u = pq.top().second;
        pq.pop();

        for(auto e : graph[u]) {
            int v = e.first, w = e.second;
            if(dist[v] > dist[u] + w) {
                dist[v] = dist[u] + w;
                pq.push({dist[v], v});
            }
        }
    }

    for(int i=0;i<n;i++)
        cout << "Distance to " << i << " = " << dist[i] << endl;
}
