//
//  257. 二叉树的所有路径.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/22.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-paths/

import Foundation

var array: [String] = []
func binaryTreePaths(_ root: TreeNode<Int>?) -> [String] {
    let string = ""
    binaryTreePaths(root, string: string)
    return array
}

func binaryTreePaths(_ root: TreeNode<Int>?, string: String) {
    
    if let root = root {
        let s =  string + "\(root.val)"
        if root.left == nil && root.right == nil {
            // 叶子节点
            array.append(s)
        } else {
            let s =  s + "->"
            binaryTreePaths(root.left, string: s)
            binaryTreePaths(root.right, string: s)
        }
    }
}
