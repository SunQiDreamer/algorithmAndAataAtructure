//
//  530. 二叉搜索树的最小绝对差.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/23.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst/

import Foundation

var minAbs = Int32.max
var last = Int32.max
func getMinimumDifference(_ root: TreeNode<Int>?) -> Int {
    if root == nil {
        return Int(minAbs)
    }
    
    _ = getMinimumDifference(root?.left)
    
    let cur = root?.val ?? 0
    minAbs = min(abs(Int32(cur) - last), minAbs)
    last = Int32(cur)
    
    _ = getMinimumDifference(root?.right)
    
    return Int(minAbs)
}


