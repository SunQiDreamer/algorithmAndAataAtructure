//
//  107. 二叉树的层次遍历 II.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/

import Foundation

func levelOrderBottom(_ root: TreeNode<Int>?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    
    var queue: [TreeNode<Int>] = [root]
    var array: [[Int]] = [[root.val]]
    
    while !queue.isEmpty {
        var size = queue.count
        var innerArray: [Int] = []
        while size > 0 {
            let node = queue.first
            queue.removeFirst()
            
            if let left = node?.left {
                queue.append(left)
                innerArray.append(left.val)
            }
            
            if let right = node?.right {
                queue.append(right)
                innerArray.append(right.val)
            }
            size -= 1
        }
        if innerArray.count > 0 {
            array.append(innerArray)
        }
    }
    return array.reversed()
}
