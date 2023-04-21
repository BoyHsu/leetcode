//
//  main.cpp
//  605. Can Place Flowers
//
//  Created by ada_PC007 on 2017/11/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    bool canPlaceFlowers(vector<int>& flowerbed, int n) {
        int i = 0, z = 1, res = 0;
        while (i < flowerbed.size()) {
            for (; i < flowerbed.size() && flowerbed[i]==0; ++i) {
                z += 1;
            }
            if (i == flowerbed.size()) {
                ++z;
            }
            res += (z-1)>>1;
            for (; i < flowerbed.size() && flowerbed[i] == 1; ++i);
            z = 0;
        }
        cout << "res == " << res << endl;
        return res >= n;
    }
};

int main(int argc, const char * argv[]) {
    
    int flowerbed[] = {1,0,0,0,1};
    vector<int> f(flowerbed, flowerbed+5);
//    int flowerbed[] = {0,0,0,0,1,0,0,0,1};
//    vector<int> f(flowerbed, flowerbed+9);
    
    Solution s;
    cout << s.canPlaceFlowers(f, 3) << endl;
    
    return 0;
}
