//
//  main.cpp
//  532. K-diff Pairs in an Array
//
//  Created by ada_PC007 on 2017/9/19.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;

class Solution {
public:
    int findPairs(vector<int>& nums, int k) {
        unordered_map<int, int> map;
        int res = 0;
        for (auto num : nums) {
            map[num] = 1;
            res += map[num+k];
        }
        return res;
    }
};

int main(int argc, const char * argv[]) {
    const int count = 7;
    
    int nums[count] = {1,3,6,2,6,3,5};
    
    
    
    return 0;
}
