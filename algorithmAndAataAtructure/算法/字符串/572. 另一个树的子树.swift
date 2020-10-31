//
//  572. 另一个树的子树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/8.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/subtree-of-another-tree/

import Foundation

func isSubtree(_ s: TreeNode<Int>?, _ t: TreeNode<Int>?) -> Bool {
    if let s = s, let t = t {
        return postSerialize(s).contains(postSerialize(t))
    } else {
        return false
    }
}

func postSerialize(_ root: TreeNode<Int>) -> String {
    var string = "!"
    postSerialize(root, string: &string)
    return string
}

func postSerialize(_ node: TreeNode<Int>, string: inout String) {
    string = string + "\(node.val)!"
    
    if let left = node.left {
        postSerialize(left, string: &string)
    } else {
        string = string + "#!"
    }
    
    if let right = node.right {
        postSerialize(right, string: &string)
    } else {
        string = string + "#!"
    }
}
