//
//  Edge.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/11/2.
//  Copyright © 2020 孙琦. All rights reserved.
//  图的边

import Foundation

class Edge<V: Hashable, E: Hashable>: Hashable {
    var from: Vertex<V, E>
    var to: Vertex<V, E>
    var weight: E?
    
    init(_ from: Vertex<V, E>, to: Vertex<V, E>, weight: E?) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    func info() -> EdgeInfo<V, E> {
        EdgeInfo(from.value, to: to.value, weight: weight)
    }
    
    static func == (lhs: Edge<V, E>, rhs: Edge<V, E>) -> Bool {
        (lhs.from == rhs.from) && (lhs.to == rhs.from)
    }
    
    var hashValue: Int {
        return from.hashValue * 31 + to.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}
