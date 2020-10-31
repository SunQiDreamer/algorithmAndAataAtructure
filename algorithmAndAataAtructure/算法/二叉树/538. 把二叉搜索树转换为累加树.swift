//
//  538. 把二叉搜索树转换为累加树.swift 
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/convert-bst-to-greater-tree/

import Foundation

var sum = 0
func convertBST(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
    if root != nil {
        _ = convertBST(root?.right)
        sum += root?.val ?? 0
        root?.val = sum
        _ = convertBST(root?.left)
    }
    return root
}
