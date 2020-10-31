//
//  112. 路径总和.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/path-sum/

import Foundation

func hasPathSum(_ root: TreeNode<Int>?, _ sum: Int) -> Bool {
    if let root = root {
        return hasPathSum1(root, sum)
    } else {
       return false
    }
}

private func hasPathSum1(_ root: TreeNode<Int>, _ sum: Int) -> Bool {
    let min = sum - root.val
    if min == 0 && root.left == nil && root.right == nil {
        return true
    }
    
    var leftHasPathSum = false
    if let left = root.left {
        leftHasPathSum = hasPathSum(left, min)
    }
    
    var rightHasPathSum = false
    if let right = root.right {
        rightHasPathSum = hasPathSum(right, min)
    }
    return leftHasPathSum || rightHasPathSum
}
