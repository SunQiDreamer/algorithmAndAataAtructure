//
//  ListGraph.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/2.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class ListGraph<U: Hashable, T: Hashable>: Graph {
    
    typealias V = U
    typealias E = T
    
    var weightManager: WeightManager<T>
        
    var vertices: [V: Vertex<V, E>] = [:]
    var edges: Set<Edge<V, E>> = []
    
    init(_ weightManager: WeightManager<T>) {
        self.weightManager = weightManager
    }
    
    func edgesSize() -> Int {
        return edges.count
    }
    
    func verticesSize() -> Int {
        return vertices.count
    }
    
    func addVertices(_ v: U) {
        let contain = vertices.contains { (key, value) -> Bool in
            return key == v
        }
        
        if !contain {
            vertices[v] = Vertex(v)
        }
    }
    
    func addEdges(_ from: U, to: U) {
        addEdges(from, to: to, weight: nil)
    }
    
    func addEdges(_ from: U, to: U, weight: T?) {
        var fromVertex = vertices[from]
        if fromVertex == nil {
            fromVertex = Vertex(from)
            vertices[from] = fromVertex
        }
        
        var toVertex = vertices[to]
        if toVertex == nil {
            toVertex = Vertex(to)
            vertices[from] = toVertex
        }
        
//        let edge = Edge(fromVertex, to: toVertex)
//        edge.weight = weight
//        if fromVertex?.outEdges.remove(edge) {
//
//        }
    }
    
    //    删除顶点
    func removeVertex(_ v: U) {
        guard let vertex = vertices.removeValue(forKey: v) else {
            return
        }
        
        for edge in vertex.outEdges {
            edge.to.inEdges.remove(edge)
            vertex.outEdges.remove(edge)
            edges.remove(edge)
        }
        
        for edge in vertex.inEdges {
            edge.to.outEdges.remove(edge)
            vertex.inEdges.remove(edge)
            edges.remove(edge)
        }
    }
    
    //    删除边
    func removeEdge(_ from: U, to: U) {
        guard let fromVertex = vertices[from] else {
            return
        }
        
        guard let toVertex = vertices[to] else {
            return
        }
        
        let edge = Edge(fromVertex, to: toVertex)
        if (fromVertex.outEdges.remove(edge) != nil) {
            toVertex.inEdges.remove(edge)
            edges.remove(edge)
        }
    }
    
    // 广度优先搜索
    func bfs(_ begin: U, visitor: VertexVisitor<U>) {
        guard let beginVertex = vertices[begin] else {
            return
        }
        
        var visitedVertices = Set<Vertex<U, T>>()
        var queue: [Vertex<U, T>] = []
        queue.append(beginVertex)
        visitedVertices.insert(beginVertex)
        
        while !queue.isEmpty {
            let vertex = queue.removeFirst()
            
            for edge in vertex.outEdges {
                if visitedVertices.contains(edge.to) {
                    continue
                }
                queue.append(edge.to)
                visitedVertices.insert(edge.to)
            }
        }
    }
    
    // 深度优先搜索
    func dfs(_ begin: U, visitor: VertexVisitor<U>) {
        
    }
    
    var mst: Set<EdgeInfo<U, T>>
    
    var topoligicalSort: Array<U>
    
    func shortestPath(_ begin: U) -> [U : PathInfo<U, T>] {
        
    }
    
    func shortestPath() -> [U : [U : PathInfo<U, T>]] {
        
    }
}
