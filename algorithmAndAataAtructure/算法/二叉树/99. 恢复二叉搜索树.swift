//
//  99. 恢复二叉搜索树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/12.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/recover-binary-search-tree/

// 二叉搜索树中序遍历是有序数列，递归的遍历方式时间复杂度是O(n)，空间复杂度是O(h)
// morris遍历可以实现时间复杂度O(n),空间复杂度是O(1)
// 树中有两个节点被错误的交换了

import Foundation

var prev: TreeNode<Int>? = nil // 记录遍历的前一个节点，用于找逆序对
var first: TreeNode<Int>? = nil // 第一个逆序对中数值较大的节点
var second: TreeNode<Int>? = nil // 第二个逆序对中数值较小的节点

func recoverTree(_ root: TreeNode<Int>?) {
    findWrongNodes(root)
    
    // 交换
    if let first = first, let second = second {
        (first.val, second.val) = (second.val, first.val)
    }
}

func findWrongNodes(_ root: TreeNode<Int>?) {
    if root == nil {
        return
    }
    findWrongNodes(root?.left)
    
    if let prev = prev, let node = root, prev.val > node.val {
        second = node
        
        if first != nil {
            return
        } else {
            first = prev
        }
    }
    prev = root
    findWrongNodes(root?.right)
}
