//
//  100. 相同的树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/same-tree/

import Foundation

func isSameTree(_ p: TreeNode<Int>?, _ q: TreeNode<Int>) -> Bool {
    
    var string1 = ""
    stringByTree(p, string: &string1)
    
    var string2 = ""
    stringByTree(q, string: &string2)
    
    return string1 == string2
}

private func stringByTree(_ root: TreeNode<Int>?, string: inout String) {
    if let root = root {
        stringByTree(root.left, string: &string)
        stringByTree(root.right, string: &string)
        string.append("\(root.val)")
    } else {
        string.append("#")
    }
}
