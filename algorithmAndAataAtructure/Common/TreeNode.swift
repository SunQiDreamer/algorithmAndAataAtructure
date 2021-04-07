//
//  TreeNode.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/27.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var val: T
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    
    var isLeaf: Bool {
        left == nil && right == nil
    }
    
    var hasTwoChildren: Bool {
        left != nil && right != nil
    }
    
    var isLeftChild: Bool {
        parent != nil && self === parent?.left
    }
    
    var isRightChild: Bool {
        parent != nil && self === parent?.right
    }
    
    convenience init(_ val: T) {
        self.init(val, parent: nil)
    }
    
    init(_ val: T, parent: TreeNode<T>?) {
        self.val = val
        self.parent = parent
        self.left = nil
        self.right = nil
    }
    
    
}
