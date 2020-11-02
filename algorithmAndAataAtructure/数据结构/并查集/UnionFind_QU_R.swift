//
//  UnionFind_QU_R.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// Union的过程中，可能会出现树不平衡的情况，甚至退化成链表
// 基于rabk的优化，矮的树嫁接到高的树

class UnionFind_QU_R: UnionFind_QU {
    private var ranks: [Int]
    
    override init(_ capacity: Int) {
        ranks = Array(repeating: 0, count: capacity)
        for i in 0..<ranks.count {
            ranks[i] = 1
        }
        
        super.init(capacity)
    }
    
    override func union(_ v1: Int, v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        
        if p1 == p2 {
            return
        }
        
        if ranks[p1] < ranks[p2] {
            parents[p1] = p2
        } else if ranks[p1] > ranks[p2] {
            parents[p2] = p1
        } else {
            parents[p1] = p2
            ranks[p2] = ranks[p2] + 1
        }
    }
}
