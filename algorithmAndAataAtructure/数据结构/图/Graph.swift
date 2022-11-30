//
//  Graph.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/2.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

 class WeightManager<E> {
    
    func compare(_ w1: E, w2: E) -> Int {
        0
    }
    
    func add(_ w1: E, w2: E) -> E {
        return w1
    }
    
//    func zero() -> E {
//        
//    }
}

class VertexVisitor<V> {
    func visit(_ v: V) -> Bool {
        return false
    }
}

class EdgeInfo<V: Hashable, E: Hashable>: Hashable {
    static func == (lhs: EdgeInfo<V, E>, rhs: EdgeInfo<V, E>) -> Bool {
        return (lhs.from == rhs.from) && (lhs.to == rhs.to) && (lhs.weight == rhs.weight)
    }
    
    var hashValue: Int {
        return from.hashValue & to.hashValue & weight.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    private var from: V
    private var to: V
    private var weight: E?
    
    init(_ from: V, to: V, weight: E?) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
}

class PathInfo<V: Hashable, E: Hashable> {
    private var weight: E
    private var edgeInfos = Array<EdgeInfo<V, E>>()
    
    
    init(_ weight: E) {
        self.weight = weight
    }
}

protocol Graph {
    associatedtype V: Hashable
    associatedtype E: Hashable
        
    var weightManager: WeightManager<E> { get set }
    func edgesSize() -> Int
    
    func verticesSize() -> Int
    
    /// 添加顶点
    /// - Parameter v: 顶点
    func addVertices(_ v: V)
    
    /// 添加边
    func addEdges(_ from: V, to: V)
    func addEdges(_ from: V, to: V, weight: E?)
    
    func removeVertex(_ v: V)
    func removeEdge(_ from: V, to: V)
    
    func bfs(_ begin: V, visitor: VertexVisitor<V>) // 广度优先搜索
    func dfs(_ begin: V, visitor: VertexVisitor<V>) // 深度优先搜索
    
    func mst() -> Set<EdgeInfo<V, E>> // 最小生成树
    
    func topoligicalSort() -> Array<V> // 拓扑算法
        
    func shortestPath(_ begin: V) -> [V: PathInfo<V, E>]
    
    func shortestPath() -> [V: [V: PathInfo<V, E>]]
    
}

extension Graph {
    func edgesSize() -> Int {
        0
    }
    
    func verticesSize() -> Int {
        0
    }
    
    /// 添加顶点
    /// - Parameter v: 顶点
    func addVertices(_ v: V) {}
    
    /// 添加边
    func addEdges(_ from: V, to: V) {}
    func addEdges(_ from: V, to: V, weight: E?) {}
    
    func removeVertex(_ v: V) {}
    func removeEdge(_ from: V, to: V) {}
    
    func bfs(_ begin: V, visitor: VertexVisitor<V>) {}
    func dfs(_ begin: V, visitor: VertexVisitor<V>) {}
    
    func mst() -> Set<EdgeInfo<V, E>> {
        Set()
    }
    
    func topoligicalSort() -> Array<V> { Array() }
        
    func shortestPath(_ begin: V) -> [V: PathInfo<V, E>] { [:] }
    
    func shortestPath() -> [V: [V: PathInfo<V, E>]] { [:] }
}
