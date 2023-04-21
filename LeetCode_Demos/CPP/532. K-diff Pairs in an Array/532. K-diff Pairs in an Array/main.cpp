//
//  main.cpp
//  532. K-diff Pairs in an Array
//
//  Created by ada_PC007 on 2017/11/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <map>
#include <vector>
using namespace std;

class Solution {
public:
    int findPairs(vector<int>& nums, int k) {
        map<int, int> m;
        int count = 0;
        
        for (int i = 0; i < nums.size(); ++i) m[nums[i]]+=1;
        
        if (k == 0) {
            for (map<int, int>::iterator iter = m.begin(); iter != m.end(); ++iter) {
                if (iter->second > 1) {
                    ++count;
                }
            }
            
        } else {
            for (map<int, int>::iterator iter = m.begin(); iter != m.end(); ++iter) {
                if (m.count(iter->first + k)) {
                    ++count;
                }
            }
        }
        
        return count;
    }
};

int main(int argc, const char * argv[]) {

    int nums[] = {3, 1, 4, 1, 5, 1};
    vector<int> n(nums, nums+6);
    
    Solution s;
    cout << s.findPairs(n, 2) << endl;
    
    return 0;
}
