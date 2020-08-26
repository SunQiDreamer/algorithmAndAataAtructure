//
//  234. 回文链表.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {
    
    // 找到中间节点
    let middleNode = findMiddleNode(head)
    // 翻转右边的链表
    var rH = reverseList(middleNode?.next)
    var lH = head
    let rOldH = rH // 用于最后再将右边翻转回来
    
    // 两个节点从两个方向遍历链表，依次对比节点
    var result = true
    while rH != nil {
        if rH?.val != lH?.val {
            result = false
            break
        }
        rH = rH?.next
        lH = lH?.next
    }
    
    reverseList(rOldH)
    return result
}
 
