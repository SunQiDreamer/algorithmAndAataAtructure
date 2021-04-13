//
//  617. 合并二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/23.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/merge-two-binary-trees/

import Foundation

func mergeTrees(_ t1: TreeNode<Int>?, _ t2: TreeNode<Int>?) -> TreeNode<Int>? {
    if t1 == nil {
        return t2
    }
    if t2 == nil {
        return t1
    }
    
    let node = TreeNode<Int>(0)
    node.left = mergeTrees(t1?.left, t2?.left)
    node.right = mergeTrees(t1?.right, t2?.right)
    
    if let val1 = t1?.val, let val2 = t2?.val {
        node.val = val1 + val2
    }
    return node
}
