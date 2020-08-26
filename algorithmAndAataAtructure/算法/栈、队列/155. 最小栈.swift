//
//  155. 最小栈.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/8/26.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class MinStack {

    private let stack1 = Stack<Int>() // 正常栈
    private let stack2 = Stack<Int>() // 最小栈
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if stack2.isEmpty() {
            stack2.push(x)
        } else {
            if let top = stack2.top() {
                stack2.push(min(x, top))
            }
        }
        stack1.push(x)
    }
    
    func pop() {
        stack1.pop()
        stack2.pop()
    }
    
    func top() -> Int {
        stack1.top() ?? 0
    }
    
    func getMin() -> Int {
        stack2.top() ?? 0
    }
}

class MinStack1 {

    var head: Node<Int>?
    /** initialize your data structure here. */
    init() {
        head = Node(0, min: Int.max, next: nil)
    }
    
    func push(_ x: Int) {
        head = Node(x, min: min(x, head?.min ?? Int.max), next: head)
    }
    
    func pop() {
        head = head?.next
    }
    
    func top() -> Int {
        return head?.value ?? 0
    }
    
    func getMin() -> Int {
        return head?.min ?? 0
    }
}

class Node<Element> {
    var value: Element?
    
    var min: Element?
    
    var next: Node?
    
    init(_ value: Element, min: Element, next: Node?) {
        self.value = value
        self.min = min
        self.next = next
    }
}
