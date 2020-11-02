//
//  UnionFind_QU.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class UnionFind_QU: UnionFind {
    var parents: [Int] = []
    
    init(_ capacity: Int) {
        parents = Array(repeating: 0, count: capacity)
        
        for i in 0..<parents.count {
            parents[i] = i
        }
    }
    
    /**
     * 通过parent链条不断地向上找，直到找到根节点
     */
    func find(_ v: Int) -> Int {
        var NewV = v
        while NewV != parents[NewV] {
            NewV = parents[NewV]
        }
        return NewV
    }
    
    /**
     * 将v1的根节点嫁接到v2的根节点上
     */
    func union(_ v1: Int, v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        
        if p1 == p2 {
            return
        }
        
        parents[p1] = p2
    }
    
}
