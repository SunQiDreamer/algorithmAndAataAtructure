//
//  UnionFind_QF.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class UnionFind_QF: UnionFind {
     
    init(_ capacity: Int) {
        parents = Array(repeating: 0, count: capacity)
        
        for i in 0..<parents.count {
            parents[i] = i
        }
    }
    
    var parents: [Int] = []
    
    /*
     * 父节点就是根节点
     */
    func find(_ v: Int) -> Int {
        parents[v]
    }
    
    /*
     * 将v1所在集合的所有元素，都嫁接到v2的父节点上
     */
    func union(_ v1: Int, v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        if p1 == p2 {
            return
        }
        
        // 合并，将所有根节点为p1的更改为p2
        for i in 0..<parents.count {
            if parents[i] == p1 {
                parents[i] = p2
            }
        }
    }
    
}
