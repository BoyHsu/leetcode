//
//  main.cpp
//  560. Subarray Sum Equals K
//
//  Created by ada_PC007 on 2017/9/18.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;

class Solution {
public:
    int subarraySum(vector<int> &nums, int k) {
        if (nums.size() < k)
            return 0;
        int res = 0;
        
        for (int i = 0; i < nums.size(); i++) {
            int sum = 0;
            for (int j = i; j < nums.size(); j++) {
                sum += nums[j];
                if (sum == k)
                    res ++;
            }
        }
        
        return res;
    }
};

class Solution1 {
public:
    int subarraySum(vector<int>& nums, int k) {
        unordered_map<int,int> hash;
        int sum = 0 , cnt = 0;
        for( auto num : nums ){
            ++hash[sum];
            sum += num;
            if( hash.count( sum - k ) )
                cnt += hash[sum-k];
        }
        return cnt;
    }
};


//[100,1,2,3,4]
//6
int main(int argc, const char * argv[]) {
    
    Solution1 s;
    int arr[6] = {100,1,2,3,4,2};
    vector<int> v(arr, arr+6 );
    cout << "result == " << s.subarraySum(v, 6) << endl;
    
    return 0;
}
