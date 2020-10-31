//
//  543. 二叉树的直径.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/23.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

var maxDiameter = 0
func diameterOfBinaryTree(_ root: TreeNode<Int>?) -> Int {
    _ = depth1(root)
    return maxDiameter
}

func depth1(_ root: TreeNode<Int>?) -> Int {
    guard root != nil else{
        return 0
    }
    let left = depth1(root?.left)
    let right = depth1(root?.right)
    maxDiameter = max(left + right, maxDiameter)
    return max(left, right) + 1
}
