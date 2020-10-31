//
//  236. 二叉树的最近公共祖先.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/11.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/

import Foundation

/**
  * 去以root为根节点的二叉树中查找p、q的最近公共祖先
  * ① 如果p、q同时存在于这棵二叉树中，就能成功返回它们的最近公共祖先
  * ② 如果p、q都不存在于这棵二叉树中，返回null
  * ③ 如果只有p存在于这棵二叉树中，返回p
  * ④ 如果只有q存在于这棵二叉树中，返回q
  */
func lowestCommonAncestor(_ root: TreeNode<Int>?, _ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> TreeNode<Int>? {
    if root == nil || p === root || q === root  {
        return root
    }
    
    let left = lowestCommonAncestor(root?.left, p, q) // 左子树查找公共祖先
    let right = lowestCommonAncestor(root?.right, p, q) // 右子树查找公共祖先
    
    // 左右子树都没有找到公共节点，说明root是公共祖先
    if left != nil && right != nil {
        return root
    }
    // 找到公共祖先
    return left != nil ? left : right
    
}
