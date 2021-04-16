//
//  102. 二叉树的层序遍历.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

/*
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 */

import Foundation

// 迭代
func levelOrder(_ root: TreeNode<Int>?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    var result: [[Int]] = []
    var queue: [TreeNode<Int>] = []
    queue.append(root)
    while !queue.isEmpty {
        var size = queue.count
        var array: [Int] = []
        while size > 0 {
            if let node = queue.first {
                array.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            queue.remove(at: 0)
            size -= 1
        }
        result.append(array)
    }
    return result
}

