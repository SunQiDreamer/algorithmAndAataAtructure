//
//  94. 二叉树的中序遍历.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/2.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-inorder-traversal/

import Foundation

func inorderTraversal(_ root: TreeNode<Int>?) -> [Int] {
    var sorts = [Int]()
    inorderTraversal(root, array: &sorts)
    return sorts
}

func inorderTraversal(_ root: TreeNode<Int>?, array: inout [Int]){
    if root == nil {
        return
    }
    inorderTraversal(root?.left, array: &array)
    
    if let val = root?.val {
        array.append(val)
    }
    inorderTraversal(root?.right, array: &array)
}


func inorderTraversal1(_ root: TreeNode<Int>?) -> [Int] {
    if root == nil {
        return []
    }
    var node = root
    var array = [Int]()
    let stack = Stack<TreeNode<Int>>()
    while true {
        if node != nil {
            if let node = node {
                stack.push(node)
            }
            node = node?.left
        } else if stack.isEmpty() {
            return array
        } else {
            node = stack.pop()
            if let val = node?.val {
                array.append(val)
            }
            node = node?.right
        }
    }
    return array
}
