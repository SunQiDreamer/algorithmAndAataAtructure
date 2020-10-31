//
//  108. 将有序数组转换为二叉搜索树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/21.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode<Int>? {
    return sortedArrayToBST(nums, left: 0, right: nums.count - 1)
}

func sortedArrayToBST(_ nums: [Int], left: Int, right: Int) -> TreeNode<Int>? {
    if left > right {
        return nil
    }
    
    let mid = (left + right + 1) / 2
    let node = TreeNode<Int>(nums[mid])
    node.left = sortedArrayToBST(nums, left: left, right: mid - 1)
    node.right = sortedArrayToBST(nums, left: mid + 1, right: right)
    
    return node
}
