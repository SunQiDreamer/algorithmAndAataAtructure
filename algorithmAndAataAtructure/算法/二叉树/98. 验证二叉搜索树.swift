//
//  98. 验证二叉搜索树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/14.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/validate-binary-search-tree/

/*
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。

 */

import Foundation

// 搜索二叉树中序遍历结果是有序的
func isValidBST(_ root: TreeNode<Int>?) -> Bool {
    let sorts = inorder(root)
    
    var lastIndex = 0
    for i in 1..<sorts.count {
        if sorts[lastIndex] >= sorts[i] {
            return false
        }
        lastIndex = i
    }
    return true
}
