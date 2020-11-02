//
//  UnionFind.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/31.
//  Copyright © 2020 孙琦. All rights reserved.
//  并查集

import Foundation

// 并查集也叫做不想交集合
// 1.查找（find）： 查找元素所在集合
// 2.合并（Union）： 将两个元素所在的集合合并为一个集合

/* 两种实现思路
 1.quick find  查找 O(1), 合并 O(n)
 1.quick union  查找 O(logn), 合并 O(logn。可以优化到O(a(n)), a(n) < 5  常用
 */

// 使用路径压缩、分裂或减半 + 基于rank或者size的优化，可以确保每个操作的均摊时间复杂度为O(a(n)), a(n)<5
protocol UnionFind {
    var parents: [Int] { set get}
    
    /// 查找v所处的集合（根节点）
    func find(_ v: Int) -> Int
    
    /// 合并v1, v2所在的集合
    func union(_ v1: Int, v2: Int)
    
    /// 检查v1, v2是否属于同一集合
    func isSame(_ v1: Int, v2: Int) -> Bool
}

extension UnionFind {
    func isSame(_ v1: Int, v2: Int) -> Bool {
        find(v1) == find(v2)
    }
}
