//
//  TreeNode.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/27.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

//class TreeNode<Element> {
//    var val: Element
//    var left: TreeNode?
//    var right: TreeNode?
//    init(_ val: Element) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}


class TreeNode<T> {
    var val: T
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: T) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
