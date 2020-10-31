//
//  237. 删除链表中的节点.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/16.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/delete-node-in-a-linked-list/

import Foundation

func deleteNode(_ node: ListNode?) {
    if let val = node?.next?.val {
        node?.val = val
    }
    node?.next = node?.next?.next
}
