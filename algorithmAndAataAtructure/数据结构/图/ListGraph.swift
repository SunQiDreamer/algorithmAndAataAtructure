//
//  ListGraph.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/2.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

//class ListGraph<U: Hashable, T: Hashable>: Graph {
//    
//    typealias V = U
//    typealias E = T
//    
//    var weightManager: WeightManager<T>
//    
//    var vertices: [V: Vertex<V, E>] = [:]
//    var edges: Set<Edge<V, E>> = []
//    
//    init(_ weightManager: WeightManager<T>) {
//        self.weightManager = weightManager
//    }
//    
//    func edgesSize() -> Int {
//        return edges.count
//    }
//    
//    func verticesSize() -> Int {
//        return vertices.count
//    }
//    
//    func addVertices(_ v: U) {
//        let contain = vertices.contains { (key, value) -> Bool in
//            return key == v
//        }
//        if !contain {
//            vertices[v] = Vertex(v)
//        }
//    }
//    
//    func addEdges(_ from: U, to: U) {
//        addEdges(from, to: to, weight: nil)
//    }
//    
//    func addEdges(_ from: U, to: U, weight: T?) {
//        var fromVertex = vertices[from]
//        
//        if fromVertex == nil {
//            fromVertex = Vertex(from)
//            vertices[from] = fromVertex
//        }
//        
//        var toVertex = vertices[to]
//        if toVertex == nil {
//            toVertex = Vertex(to)
//            vertices[to] = toVertex
//        }
//        
//        let edge = Edge(fromVertex!, to: toVertex!, weight: weight)
//        if ((fromVertex?.outEdges.remove(edge)) != nil) {
//            toVertex?.inEdges.remove(edge)
//            edges.remove(edge)
//        }
//        
//        fromVertex?.outEdges.insert(edge)
//        toVertex?.inEdges.insert(edge)
//        edges.insert(edge)
//    }
//    
//    //    删除顶点
//    func removeVertex(_ v: U) {
//        guard let vertex = vertices.removeValue(forKey: v) else {
//            return
//        }
//        
//        for edge in vertex.outEdges {
//            edge.to.inEdges.remove(edge)
//            vertex.outEdges.remove(edge)
//            edges.remove(edge)
//        }
//        
//        for edge in vertex.inEdges {
//            edge.to.outEdges.remove(edge)
//            vertex.inEdges.remove(edge)
//            edges.remove(edge)
//        }
//    }
//    
//    //    删除边
//    func removeEdge(_ from: U, to: U) {
//        guard let fromVertex = vertices[from] else {
//            return
//        }
//        
//        guard let toVertex = vertices[to] else {
//            return
//        }
//        
//        let edge = Edge(fromVertex, to: toVertex, weight: nil)
//        if (fromVertex.outEdges.remove(edge) != nil) {
//            toVertex.inEdges.remove(edge)
//            edges.remove(edge)
//        }
//    }
//    
//    // 广度优先搜索
//    func bfs(_ begin: U, visitor: VertexVisitor<U>) {
//        guard let beginVertex = vertices[begin] else {
//            return
//        }
//        
//        var visitedVertices = Set<Vertex<U, T>>()
//        var queue: [Vertex<U, T>] = []
//        queue.append(beginVertex)
//        visitedVertices.insert(beginVertex)
//        
//        while !queue.isEmpty {
//            let vertex = queue.removeFirst()
//            
//            for edge in vertex.outEdges {
//                if visitedVertices.contains(edge.to) {
//                    continue
//                }
//                queue.append(edge.to)
//                visitedVertices.insert(edge.to)
//            }
//        }
//        
//        // 深度优先搜索 （相当于二叉树前序遍历）
//        func dfs(_ begin: U, visitor: VertexVisitor<U>) {
//            
//        }
//        
//        // 深度优先搜索 递归
//        func dfs2(_ begin: U) {
//            guard let beginVertex = vertices[begin] else {
//                return
//            }
//            
//            var set = Set<Vertex<U, T>>()
//            dfs2(beginVertex, visitedVertices: &set)
//        }
//        
//        func dfs2(_ vertex: Vertex<U, T>, visitedVertices: inout Set<Vertex<U, T>>) {
//            visitedVertices.insert(vertex)
//            
//            for edge in vertex.outEdges {
//                if visitedVertices.contains(edge.to) {
//                    continue
//                }
//                dfs2(edge.to, visitedVertices: &visitedVertices)
//            }
//        }
//        
//        // 最小生成树 （Minimum Spanning Tree）
//        func mst() -> Set<EdgeInfo<U, T>> {
//            prim()
//        }
//        
//        // Prim 普利姆算法
//        func prim() -> Set<EdgeInfo<U, T>> {
//            
//        }
//        
//        // Kruskal 克鲁斯克尔算法
//        func kruskal() -> Set<EdgeInfo<U, T>> {
//            
//        }
//        
//        // 拓扑排序 （卡恩算法）
//        func topoligicalSort() -> Array<V> {
//            
//        }
//        
//        // 最短路径
//        // 单源最短路径算法
//        // 1.Dijkstra 迪杰斯特拉算法
//        // 2.Bellman-Ford 贝尔曼-福特算法
//        // 多源最短路径算法
//        // Floyd 弗洛伊德算法 
//        func shortestPath(_ begin: U) -> [U : PathInfo<U, T>] {
//            
//        }
//        
//        func shortestPath() -> [U : [U : PathInfo<U, T>]] {
//            
//        }
//        
//    }
//}
