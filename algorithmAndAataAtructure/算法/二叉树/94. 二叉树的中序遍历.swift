//
//  94. 二叉树的中序遍历.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/2.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/binary-tree-inorder-traversal/

import Foundation

// MARK: - preorder
func preorder(_ root: TreeNode<Int>?) -> [Int] {
    var sorts = [Int]()
    preorder(root, array: &sorts)
    return sorts
}

// 递归
func preorder(_ root: TreeNode<Int>?, array: inout [Int]){
    if root == nil {
        return
    }
    
    if let val = root?.val {
        array.append(val)
    }
    preorder(root?.left, array: &array)
    preorder(root?.right, array: &array)
}

// 迭代
func preorder1(_ root: TreeNode<Int>?) -> [Int] {
    guard let root = root else {
        return []
    }
    var array: [Int] = []
    let stack = Stack<TreeNode<Int>>()
    stack.push(root)
    while !stack.isEmpty() {
        let node = stack.pop()
        array.append(node.val)
        
        if let right = node.right {
            stack.push(right)
        }
        
        if let left = node.left {
            stack.push(left)
        }
    }
    return array
}

// MARK: - inorder
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

func inorder(_ root: TreeNode<Int>?) -> [Int] {
    if root == nil {
        return []
    }
    
    var array: [Int] = []
    let stack = Stack<TreeNode<Int>>()
    var node = root
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

// MARK: - postorder
func postorder(_ root: TreeNode<Int>?) -> [Int] {
    var sorts = [Int]()
    postorder(root, array: &sorts)
    return sorts
}

func postorder(_ root: TreeNode<Int>?, array: inout [Int]){
    if root == nil {
        return
    }
    postorder(root?.left, array: &array)
    postorder(root?.right, array: &array)
    
    if let val = root?.val {
        array.append(val)
    }
}

func postorder1(_ root: TreeNode<Int>?) -> [Int] {
    if root == nil {
        return []
    }
    var prev: TreeNode<Int>? = nil
    
    var array: [Int] = []
    let stack = Stack<TreeNode<Int>>()
    if let node = root {
        stack.push(node)
    }
    
    while !stack.isEmpty() {
        let top = stack.top()
        if top?.isLeaf ?? false || (prev != nil && prev?.parent === top) {
            
            prev = stack.pop()
            
            if let val = prev?.val {
                array.append(val)
            }
            
        } else {
            if let right = top?.right {
                stack.push(right)
            }
            
            if let left = top?.left {
                stack.push(left)
            }
        }
    }
    return array
}
