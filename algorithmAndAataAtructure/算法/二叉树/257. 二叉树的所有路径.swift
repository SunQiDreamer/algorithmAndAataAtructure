//
//  257. 二叉树的所有路径.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/22.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-paths/

import Foundation

func binaryTreePaths(_ root: TreeNode<Int>?) -> [String] {
    var array: [String] = []
    let string = ""
    binaryTreePaths(root, string: string, array: &array)
    return array
}

func binaryTreePaths(_ root: TreeNode<Int>?, string: String, array: inout [String]) {
    
    if let root = root {
        let s =  string + "\(root.val)"
        if root.isLeaf {
            // 叶子节点
            array.append(s)
        } else {
            let s =  s + "->"
            binaryTreePaths(root.left, string: s, array: &array)
            binaryTreePaths(root.right, string: s, array: &array)
        }
    }
}
