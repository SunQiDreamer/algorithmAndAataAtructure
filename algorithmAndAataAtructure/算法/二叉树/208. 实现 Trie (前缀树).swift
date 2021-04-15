//
//  208. 实现 Trie (前缀树).swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/14.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/implement-trie-prefix-tree/

/*
 Trie（发音类似 "try"）或者说 前缀树 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。这一数据结构有相当多的应用情景，例如自动补完和拼写检查。

 请你实现 Trie 类：

 Trie() 初始化前缀树对象。
 void insert(String word) 向前缀树中插入字符串 word 。
 boolean search(String word) 如果字符串 word 在前缀树中，返回 true（即，在检索之前已经插入）；否则，返回 false 。
 boolean startsWith(String prefix) 如果之前已经插入的字符串 word 的前缀之一为 prefix ，返回 true ；否则，返回 false 。
 */

import Foundation

class Trie {
    /** Initialize your data structure here. */
    
    var size: Int = 0
    var root: Node?
    var isEmpty: Bool {
        return size == 0
    }
    
    init() {

    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        guard !word.isEmpty else {
            return
        }
        if root == nil {
            root = Node(nil)
        }
        var node = root
        let len = word.count
        for i in 0..<len {
            let c = word[word.index(word.startIndex, offsetBy: i)]
            var childNode = node?.children[c]
            if childNode == nil {
                childNode = Node(node)
                childNode?.character = c
                node?.children[c] = childNode
            }
            node = childNode
        }
        
        if node?.word ?? false {
            node?.value = word
        }
        
        node?.word = true
        node?.value = word
        size += 1
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        if let node = node(word) {
            return node.word
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        node(prefix) != nil
    }
    
    func clear() {
        size = 0
        root = nil
    }
    
    func get(_ key: String) -> String {
        if let node = node(key), node.word, let value = node.value {
            return value
        }
        return ""
    }
    
    private func node(_ key: String) -> Node? {
        if key.isEmpty {
            return nil
        }
        
        var node = root
        let len = key.count
        for i in 0..<len {
            if node == nil || node?.children == nil || node?.children.isEmpty ?? false {
                return nil
            }
            let c = key[key.index(key.startIndex, offsetBy: i)]
            node = node?.children[c]
            
        }
        return node
    }

    class Node {
        var parent: Node? = nil
        var children: [Character: Node] = [:]
        var character: Character?
        var value: String?
        var word: Bool = false // 是否是单词的结尾（是否为一个完整的单词）
        
        init(_ parent: Node?) {
            self.parent = parent
        }
    }
    
}
