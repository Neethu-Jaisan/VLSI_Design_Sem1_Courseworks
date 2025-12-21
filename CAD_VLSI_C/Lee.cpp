#include <iostream>
#include <queue>
using namespace std;

#define N 5
int grid[N][N] = {
    {0,0,0,0,0},
    {0,1,1,1,0},
    {0,0,0,1,0},
    {1,1,0,0,0},
    {0,0,0,1,0}
};

int dx[4]={1,-1,0,0};
int dy[4]={0,0,1,-1};

int main() {
    int sx=0, sy=0, tx=4, ty=4;
    queue<pair<int,int>> q;
    q.push({sx,sy});
    grid[sx][sy]()
