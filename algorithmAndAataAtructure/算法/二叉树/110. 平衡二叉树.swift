//
//  110. 平衡二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/balanced-binary-tree/

import Foundation

func isBalanced(_ root: TreeNode<Int>?) -> Bool {
    if let root = root {
        let rootBalance = abs(depth(root.left) - depth(root.right)) <= 1
        return rootBalance && isBalanced(root.left) && isBalanced(root.right)
    } else {
        return true
    }
}

/// 递归求子树的高度
func depth(_ root: TreeNode<Int>?) -> Int {
    if let root = root {
        let leftHeight = depth(root.left)
        let rightHeight = depth(root.right)
        
        return max(leftHeight, rightHeight) + 1
    } else {
        return 0
    }
}
