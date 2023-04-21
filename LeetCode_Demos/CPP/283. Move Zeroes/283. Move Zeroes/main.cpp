//
//  main.cpp
//  283. Move Zeroes
//
//  Created by ada_PC007 on 2017/11/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int pnIdx = 0;
        int size = (int)nums.size();
        
        for (int i = 0; i < size; ++i) {
            if (nums[i] != 0) {
                if (i != pnIdx) {
                    swap(nums[i], nums[pnIdx]);
                }
                pnIdx++;
            }
        }
    }
};

class Solution1 {
public:
    void moveZeroes(vector<int>& nums) {
        int i = 0, z = 0;
        
        for (; nums[z] != 0 ; ++z);
        for (i = z + 1; nums[i] == 0; ++i);
        
        while (i < nums.size() && z < nums.size()) {
            swap(nums[i], nums[z]);
            
            for (; nums[z] != 0 ; ++z);
            for (; nums[i] == 0; ++i);
        }
    }
};

int main(int argc, const char * argv[]) {
    
    int nums[] = {0,1,0,3,12};
    vector<int> s(nums, nums+5);
//    int nums[] = {2,1};
//    vector<int> s(nums, nums+2);
    
    Solution1 slt;
    slt.moveZeroes(s);
    
    copy(s.begin(), s.end(), ostream_iterator<int>(cout, " "));
    cout << endl;
    
    return 0;
}
