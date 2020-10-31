//
//  333.最大BST子树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/12.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// MARK: - 自底向上  后序遍历
func largestBSTSubtree(_ root: TreeNode<Int>) -> Int {
    return getInfo(root)?.size ?? 0
}

func getInfo(_ root: TreeNode<Int>?) -> Info? {
    guard let root = root else {
        return nil
    }

    let li = getInfo(root.left) // 左子树的最大BST信息
    let ri = getInfo(root.right) // 右子树的最大BST信息
    
    var leftSize = -1
    var rightSize = -1
    var max = 0
    var min = 0
    
    if let li = li {
        if li.max < root.val {
            leftSize = li.size
            min = li.min
        }
    } else {
        leftSize = 0
    }
    
    if let ri = ri {
        if ri.min > root.val {
            rightSize = ri.size
            max = ri.max
        }
    } else {
        rightSize = 0
    }
     
    if leftSize >= 0 && rightSize >= 0 { // 以root为节点的是二叉树搜索树
        return Info(root, size: leftSize + rightSize + 1, max: max, min: min)
    }
    
    if let li = li, let ri = ri {
        return li.size > ri.size ? li : ri
    }

    return li != nil ? li : ri
}

class Info {
    var root: TreeNode<Int>
    var size: Int
    var max: Int
    var min: Int
    
    init(_ root: TreeNode<Int>, size: Int, max: Int, min: Int) {
        self.root = root
        self.size = size  // 节点总数
        self.max = max
        self.min = min
    }
}

// MARK: - 自顶向下 前序遍历
func largestBSTSubtree1(_ root: TreeNode<Int>) -> Int {
    
    if isBST(root) {
        return getCount(root)
    }
    
    var l = 0
    var r = 0
    if let left = root.left {
        l = largestBSTSubtree1(left)
    }
    if let right = root.right {
        r = largestBSTSubtree1(right)
    }
    return max(l, r)
}

func isBST(_ root: TreeNode<Int>) -> Bool {
    isBST(root, min: Int.min, max: Int.max)
}

func isBST(_ root: TreeNode<Int>, min: Int, max: Int) -> Bool {
    
    var l = false
    var r = false
    
    if let left = root.left {
        l = isBST(left, min: min, max: root.val)
    }
    
    if let right = root.right {
        r = isBST(right, min: root.val, max: max)
    }
    
    return l && r && min < root.val && max > root.val
}

func getCount(_ root: TreeNode<Int>?) -> Int {
    guard let root = root else {
        return 0
    }
    return 1 + getCount(root.left) + getCount(root.right)
}
