                                                        //
                                                        //  146. LRU缓存机制.swift
                                                        //  algorithmAndAataAtructure
                                                        //
                                                        //  Created by 孙琦 on 2020/9/15.
                                                        //  Copyright © 2020 孙琦. All rights reserved.
                                                        //  https://leetcode-cn.com/problems/lru-cache/

                                                        import Foundation

                                                        // 哈希表+双向链表
                                                        class LRUCache {
                                                            private var map: [Int: Node1<Int>] = [:]
                                                            var capacity = 0
                                                            var first: Node1<Int>?
    var last: Node1<Int>?

    init(_ capacity: Int) {
        self.capacity = capacity
        first = Node1<Int>()
        last = Node1<Int>()
        
        first?.next = last
        last?.prev = first
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            removeNode(node)
            addAfterFirst(node)
            
            return node.value ?? -1
            
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            // 以前存在这个节点，更新
            node.value = value
            removeNode(node)
            addAfterFirst(node)
        } else {
            // 以前没有，新创建
            if map.count == capacity {
                //  淘汰最近最少使用的node
                if let lastKey = last?.prev?.key, let index = map.index(forKey: lastKey) {
                    let removeN = map.remove(at: index)
                    removeNode(removeN.value)
                }
            }
            let node = Node1(key, value: value)
            map[key] = node
            addAfterFirst(node)
        }
    }
    
    /// 删除链表中的节点
    private func removeNode(_ node: Node1<Int>) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    // 最近使用的节点，添加到链表的first的next
    private func addAfterFirst(_ node: Node1<Int>) {
        // node与first.next
        node.next = first?.next
        first?.next?.prev = node
        
        // node与first
        first?.next = node
        node.prev = first
    }
}

class Node1<Element> {
    var key: Element?
    var value: Element?
    var prev: Node1?
    var next: Node1?
    
    init(_ key: Element, value: Element) {
        self.key = key
        self.value = value
    }
    
    init() {
        
    }
}
