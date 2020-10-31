//
//  654. 最大二叉树.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/27.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/maximum-binary-tree/

import Foundation

func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode<Int>? {
    return findRoot(nums, l: 0, r: nums.count)
}

func findRoot(_ nums: [Int], l: Int, r: Int) -> TreeNode<Int>? {
    if l == r {
        return nil
    }
    
    var maxId = l
    for index in l + 1..<r {
        if nums[index] > nums[maxId] {
            maxId = index
        }
    }
    
    let root = TreeNode(nums[maxId])
    root.left = findRoot(nums, l: l, r: maxId)
    root.right = findRoot(nums, l: maxId + 1, r: r)
    
    return root
}


// 返回一个数组，数组里放的是每个节点父节点的索引，root返回-1
// 利用一个单调递减的栈，加入每一个值得索引前，此时的栈顶元素为这个值得左边第一个比他大的值得左右的索引
// 如果添加下一个值比当前栈顶的索引对应的值大，则即将入栈的索引为栈顶索引元素的右边的第一个比他大的值得索引
// 元素组会对应两个数组，左边第一个比他大的索引的数组,右边第一个比他大的索引的数组

func parentIndexes(_ nums: [Int]) -> [Int] {
    if nums.count == 0 {
        return []
    }
    
    var lis: [Int] = [] // 左边第一个比他大的数组
    var ris: [Int] = [] // 右边第一个比他大的数组
    let stack = Stack<Int>()
    for _ in 0..<nums.count {
        lis.append(-1)
        ris.append(-1)
    }
    
    for index in 0..<nums.count {
        
        while !stack.isEmpty() && nums[index] > nums[stack.top() ?? 0] { // 即将入栈的索引的值比栈顶索引的值大，则该索引为栈顶索引的右边第一个比他大的值得索引
            let i = stack.pop()
            ris[i] = index
        }
        
        if !stack.isEmpty() { // 栈顶索引是即将入栈的索引左边第一个比他大的值的索引
            lis[index] = stack.top() ?? -1
        }
        
        // 入栈
        stack.push(index)
    }
    
    var pis: [Int] = [] // 最终返回的每个节点的父节点的索引数组
    for index in 0..<nums.count {
        let li = lis[index]
        let ri = ris[index]
        
        if li == -1 && ri == -1 { // 根节点
            pis[index] = -1
        }
        
        if li == -1 { // 填入右边的第一个比他大的值为父节点
            pis[index] = ri
        }
        if ri == -1 { // 填入左边的第一个比他大的值为父节点
            pis[index] = li
        }
        
        // 填入左边和右边第一个比他大的值其中的最小值，为父节点索引
        pis[index] = min(li, ri)
        
    }
    
    return pis
}
