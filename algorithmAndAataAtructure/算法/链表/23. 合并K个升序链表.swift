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
