#include <iostream>
#include <vector>
using namespace std;

int main() {
    int n = 4;
    int cost[4][4] = {
        {0,1,1,0},
        {1,0,1,1},
        {1,1,0,1},
        {0,1,1,0}
    };

    vector<int> part = {0,0,1,1};

    auto cutsize = [&]() {
        int cut=0;
        for(int i=0;i<n;i++)
            for(int j=i+1;j<n;j++)
                if(part[i]!=part[j])
                    cut += cost[i][j];
        return cut;
    };

    cout<<"Initial cutsize = "<<cutsize()<<endl;

    swap(part[1], part[2]);

    cout<<"Final cutsize = "<<cutsize()<<endl;
}
