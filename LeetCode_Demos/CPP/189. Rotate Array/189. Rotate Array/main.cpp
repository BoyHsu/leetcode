//
//  main.cpp
//  189. Rotate Array
//
//  Created by ada_PC007 on 2017/9/19.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int count = (int)nums.size();
        k = k % count;
        vector<int> temp(&nums[count-k], &nums[count]);
        for (int i = count-1; i >= k; i--) {
            nums[i] = nums[i-k];
        }
        for (int i = 0; i < k; i++) {
            nums[i] = temp[i];
        }
    }
};

class Solution1 {
public:
    void rotate(vector<int>& nums, int k) {
        int steps = k % nums.size();
        reverse(nums.end() - steps, nums.end());
        reverse(nums.begin(), nums.end() - steps);
        reverse(nums.begin(), nums.end());
    }
};

int main(int argc, const char * argv[]) {
    const int count = 7;
    int nums[count] = {1,2,3,4,5,6,7};
    vector<int> v(nums, nums+count);
    Solution s;
    s.rotate(v, 3);
    
    cout << "nums == " << &v << endl;
    
    return 0;
}
