//
//  堆排序.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/10/29.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class HeapSort: Sort {
    typealias T = Int
    var array: [Int] = []
    
    private var heapSize: Int = 0
    
    func sort() -> [Int] {
        
        heapSize = array.count
        for var i in (0...heapSize >> 1 - 1).reversed() {
            siftDown(&i)
        }
        
        while heapSize > 1 {
            heapSize = heapSize - 1
            array.swapAt(0, heapSize)
//            siftDown(0)
        }
        
        // TODO:
        return array
    }
    
    
    private func siftDown(_ index: inout Int) {
        let element = array[index]
        
        let half = heapSize >> 1
        while index < half {
            
            var childIndex = (index << 1) + 1
            var child = array[childIndex]
            
            let rightIndex = childIndex + 1
            
            if rightIndex < heapSize && array[rightIndex] > child {
                childIndex = rightIndex
                child = array[childIndex]
            }
            
            if element < child {
                break
            }
            array[index] = child
            index = childIndex
        }
        array[index] = element
    }
    
}
 
