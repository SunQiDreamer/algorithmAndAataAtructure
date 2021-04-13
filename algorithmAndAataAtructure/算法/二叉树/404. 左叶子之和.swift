//
//  404. 左叶子之和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/22.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/sum-of-left-leaves/

import Foundation

// 递归
func sumOfLeftLeaves(_ root: TreeNode<Int>?) -> Int {
    var sum = 0
    if let root = root {
        sum = sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
        
        if let left = root.left, left.isLeaf {
            sum += left.val
        }
    }
    return sum
}
