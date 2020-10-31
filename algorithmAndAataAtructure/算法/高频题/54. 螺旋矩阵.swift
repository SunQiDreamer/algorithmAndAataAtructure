//
//  54. 螺旋矩阵.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/15.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var res: [Int] = []
    
    if matrix.count == 0 {
        return res
    }
    
    var top = 0
    var bottom = matrix.count - 1
    var left = 0
    var right = matrix.first?.count ?? 0 - 1
    
    while top <= bottom, left <= right {
        for i in left...right {
            res.append(matrix[top][i])
        }
        top += 1
        
        for i in top...bottom {
            res.append(matrix[i][right])
        }
        right -= 1
        
        if (top > bottom || left > right) {
            break
        }
        
        for i in (left...right).reversed() {
            res.append(matrix[bottom][i])
        }
        bottom -= 1
        
        for i in (top...bottom).reversed() {
            res.append(matrix[i][left])
        }
        left += 1
    }
    
    return res
    
}
