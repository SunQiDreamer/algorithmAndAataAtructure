//
//  23. 合并K个升序链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/merge-k-sorted-lists/

import Foundation

// 1.暴力法
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var nodes: [ListNode] = []
    for head in lists {
        var cur = head
        while cur != nil {
            if let cur = cur {
                nodes.append(cur)
            }
            cur = cur?.next
        }
    }
    
    let nNodes = nodes.sorted { (node1, node2) -> Bool in
        node1.val < node2.val
    }
    
    let nHead = nNodes.first
    var cur = nHead
    for n in nNodes.dropFirst() {
        cur?.next = n
        cur = cur?.next
    }
    return nHead
}

// 依次合并链表
func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
    var nHead: ListNode? = nil
    for head in lists {
        nHead = mergeTwoLists(nHead, head)
    }
    return nHead
}

// 分治思想（二分法）
func mergeKLists3(_ lists: [ListNode?]) -> ListNode? {
    return merge(lists, l: 0, r: lists.count - 1)
}

private func merge(_ lists: [ListNode?], l: Int, r: Int) -> ListNode? {
    if l == r {
        return lists[l]
    }
    if l > r {
        return nil
    }
    
    let mid = (l + r) >> 1
    return mergeTwoLists(merge(lists, l: l, r: mid), merge(lists, l: mid, r: r))
}
