//
//  101. 对称二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

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
