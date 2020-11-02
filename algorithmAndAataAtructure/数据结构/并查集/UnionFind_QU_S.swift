//
//  UnionFind_QU_S.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// Union的过程中，可能会出现树不平衡的情况，甚至退化成链表
// 基于size的优化，元素少的树嫁接到元素多的树

class UnionFind_QU_S: UnionFind_QU {
    private var sizes: [Int]
    
    override init(_ capacity: Int) {
        sizes = Array(repeating: 0, count: capacity)
        for i in 0..<sizes.count {
            sizes[i] = 1
        }
        
        super.init(capacity)
    }
    
    override func union(_ v1: Int, v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        
        if p1 == p2 {
            return
        }
        
        if sizes[p1] < sizes[p2] {
            parents[p1] = p2
            sizes[p2] = sizes[p2] + sizes[p1]
        } else {
            parents[p2] = p1
            sizes[p1] = sizes[p2] + sizes[p1]
        }
    }
    
}
