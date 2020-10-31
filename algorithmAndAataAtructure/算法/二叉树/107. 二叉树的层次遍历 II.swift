//
//  107. 二叉树的层次遍历 II.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/

import Foundation

func levelOrderBottom(_ root: TreeNode<Int>?) -> [[Int]] {
    if root == nil {
        return []
    }
   
    var result: [[Int]] = [[root!.val]]
    var queue: [TreeNode<Int>] = [root!]
    while !queue.isEmpty {
        var size = queue.count
        
        var array: [Int] = []
        while size > 0 {
            let node = queue.first
            queue.remove(at: 0)
            
            if let left = node?.left {
                queue.append(left)
                array.append(left.val)
            }
            if let right = node?.right {
                queue.append(right)
                array.append(right.val)
            }
            
            size -= 1
        }

        if array.count > 0 {
            result.append(array)
        }
    }
    
    result.reverse()
    return result
}
