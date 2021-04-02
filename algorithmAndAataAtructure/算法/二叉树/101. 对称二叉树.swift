//
//  101. 对称二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/symmetric-tree/

import Foundation

// 判断前序遍历和后序遍历结果是否一致
func isSymmetric(_ root: TreeNode<Int>?) -> Bool {
    var string1 = ""
    leftStringByTree(root, string: &string1)
    
    var string2 = ""
    rightStringByTree(root, string: &string2)
    
    return string1 == string2
}

private func leftStringByTree(_ root: TreeNode<Int>?, string: inout String) {
    if let root = root {
        leftStringByTree(root.left, string: &string)
        
        leftStringByTree(root.right, string: &string)
        string.append("\(root.val)")
    } else {
        string.append("#")
    }
}

private func rightStringByTree(_ root: TreeNode<Int>?, string: inout String) {
    if let root = root {
        rightStringByTree(root.right, string: &string)
        
        rightStringByTree(root.left, string: &string)
        string.append("\(root.val)")
    } else {
        string.append("#")
    }
}

// 与100题解法几乎一致
func isSymmetric1(_ root: TreeNode<Int>?) -> Bool {
    return isSymmetric1(root, root)
}
// 递归
func isSymmetric1(_ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> Bool {
    
    if p == nil && q == nil {
        return true
    }
    if p == nil || q == nil {
       return false
    }
    
    let leftIsSame = isSymmetric1(p?.left, q?.right)
    let rightIsSame = isSymmetric1(p?.right, q?.left)

    let pSame = (p?.val == q?.val)

    return leftIsSame && rightIsSame && pSame
}
