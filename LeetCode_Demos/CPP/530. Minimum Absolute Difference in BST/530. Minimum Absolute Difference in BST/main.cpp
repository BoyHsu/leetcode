//
//  main.cpp
//  530. Minimum Absolute Difference in BST
//
//  Created by ada_PC007 on 2017/11/20.
//  Copyright © 2017年 ada56. All rights reserved.
//

#include <iostream>
#include <stack>
using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    int getMinimumDifference(TreeNode* root) {
        int res = INT_MAX, last = 0;
        stack<TreeNode *> s;
        TreeNode *x = root;
        while (true) {
            while (x) {
                s.push(x);
                x = x->left;
            }
            if (s.empty()) {
                break;
            }
            x = s.top();s.pop();
            if (last) {
                res = min(res, x->val-last);
                last = x->val;
            }
            x = x->right;
        }
        return res;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
