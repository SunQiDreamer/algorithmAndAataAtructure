//
//  111. 二叉树的最小深度.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/

import Foundation

func minDepth(_ root: TreeNode<Int>?) -> Int {
    if root == nil {
        return 0
    }
    
    if root?.left == nil && root?.right == nil {
        return 1
    }
    
    var min_depth = Int.max
    if let left = root?.left {
        min_depth = min(minDepth(left), min_depth)
    }
    
    if let right = root?.right {
        min_depth = min(minDepth(right), min_depth)
    }
    return min_depth + 1
}

