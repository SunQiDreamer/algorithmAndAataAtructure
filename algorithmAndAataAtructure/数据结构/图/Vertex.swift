//
//  Vertex.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/2.
//  Copyright © 2020 孙琦. All rights reserved.
//  图的顶点

import Foundation

class Vertex<V: Hashable, E: Hashable>: Hashable {
    
    var value: V
    var inEdges = Set<Edge<V, E>>()
    var outEdges = Set<Edge<V, E>>()
    
    init(_ value: V) {
        self.value = value
    }
    
    static func == (lhs: Vertex<V, E>, rhs: Vertex<V, E>) -> Bool {
        lhs.value == rhs.value
    }
    
    var hashValue: Int {
        value.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}
