//
//  UnionFind_QU_R_PC.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 路劲压缩
// 基于rank的优化，仍然会在Union时导致树越来越高，使find越来越慢
// 在find时使路径上的所有节点都指向根节点，从而降低树的高度
// 路劲压缩使路径上的所有节点都指向根节点，实现成本高

class UnionFind_QU_R_PC: UnionFind_QU_R {
    
    override func find(_ v: Int) -> Int {
        if parents[v] != v {
            parents[v] = find(parents[v])
        }
        return parents[v]
    }
    
}
