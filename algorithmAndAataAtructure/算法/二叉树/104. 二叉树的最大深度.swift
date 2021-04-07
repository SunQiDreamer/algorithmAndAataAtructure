//
//  104. 二叉树的最大深度.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/

import Foundation

// 递归
func maxDepth(_ root: TreeNode<Int>?) -> Int {
    if let root = root {
        let leftHeight = maxDepth(root.left)
        let rightHeight = maxDepth(root.right)
        
        return max(leftHeight, rightHeight) + 1
    } else {
        return 0
    }
}

// 层序遍历
func maxDepth1(_ root: TreeNode<Int>?) -> Int {
    guard let root = root else {
        return 0
    }
    
    var queue: [TreeNode<Int>] = [root]
    
    var deepCount = 0
    while !queue.isEmpty {
        
        var size = queue.count
        while size > 0 {
            let node = queue.first
            queue.remove(at: 0)
            if let left = node?.left {
                queue.append(left)
            }
            
            if let right = node?.right {
                queue.append(right)
            }
            size -= 1
        }
        deepCount += 1

    }
    
    return deepCount
}
