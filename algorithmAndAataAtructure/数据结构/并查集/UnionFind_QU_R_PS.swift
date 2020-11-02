//
//  UnionFind_QU_R_P.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 路径分裂
// 使路径上的每个节点都指向其祖父节点
class UnionFind_QU_R_PS: UnionFind_QU_R {
    
    override func find(_ v: Int) -> Int {
        var newV = v
        
        while newV != parents[newV] {
            let p = parents[newV]
            parents[newV] = parents[parents[newV]]
            newV = p
        }
        return newV
    }
    
}
