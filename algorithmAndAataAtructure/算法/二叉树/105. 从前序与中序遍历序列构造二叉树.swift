//
//  105. 从前序与中序遍历序列构造二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/15.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

/*
 根据一棵树的前序遍历与中序遍历构造二叉树。
 */

import Foundation

// 前序遍历中第一个元素为根节点，该值在中序遍历中的位置index，中序遍历中index前面的元素为二叉树的左子树，index后面的元素为右子树；在前序遍历中找出左子树元素和右子树元素
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode<Int>? {
    if preorder.count <= 0 {
        return nil
    }
    
    // middleNodeIndex是前序遍历中的第一个元素在中序遍历数组的index
    if let first = preorder.first, let middleNodeIndex = inorder.firstIndex(of: first) {
        let root = TreeNode(first)
        if middleNodeIndex >= inorder.count {
            return nil
        }
        
        let leftNodeInorder = Array(inorder[..<middleNodeIndex])
        let rightNodeInorder = Array(inorder[middleNodeIndex + 1..<inorder.endIndex])
        
        let leftNodePreorder = Array(preorder[1..<leftNodeInorder.count+1])
        let rightNodePreorder = Array(preorder[leftNodeInorder.count+1..<preorder.endIndex])
        
        root.left = buildTree(leftNodePreorder, leftNodeInorder)
        root.right = buildTree(rightNodePreorder, rightNodeInorder)
        return root
    } else {
        return nil
    }
}
