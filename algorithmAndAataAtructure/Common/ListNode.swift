//
//  ListNode.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/25.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// 找到中间节点（快慢指针）
func findMiddleNode(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }

    var fast = head
    var slow = head
    
    while fast?.next != nil && fast?.next?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}


/// 翻转链表
/// - Parameter node: 原链表头结点
/// - Returns: 翻转后的头结点
@discardableResult
func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    var tmpHead = head
    var newHead: ListNode?
    
    while tmpHead != nil {
        let tmp = tmpHead?.next
        tmpHead?.next = newHead
        newHead = tmpHead
        tmpHead = tmp
    }
    return newHead
}
