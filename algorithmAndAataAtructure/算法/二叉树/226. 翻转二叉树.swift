//
//  226. 翻转二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/invert-binary-tree/

import Foundation

// 前序遍历后序遍历都可以
@discardableResult
func invertTree(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
    if let root = root {
        
        (root.left, root.right) = (root.right, root.left)
        invertTree(root.left)
        invertTree(root.right)
    }
    return root
}
