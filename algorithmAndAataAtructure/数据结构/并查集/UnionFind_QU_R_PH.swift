//
//  UnionFind_QU_R_PH.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

// 路径减半
// 使路径上每隔一个节点都指向其祖父节点
class UnionFind_QU_R_PH: UnionFind_QU_R {
    
    override func find(_ v: Int) -> Int {
        var newV = v
        
        while newV != parents[newV] {
            parents[newV] = parents[parents[newV]]
            newV = parents[newV]
        }
        return newV
    }
    
}
