//
//  252.会议室.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/15.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

func canAttendMettings(_ intervals: [[Int]]) -> Bool {
    if intervals.count == 0 {
        return true
    }
    
    let array = intervals.sorted { (prev, next) -> Bool in
        prev.first ?? 0 < next.first ?? 0
    }
    
    var resule = true
    for i in 0..<array.count - 1 {
        let prev = array[i]
        let next = array[i + 1]
        
        if prev.last ?? 0 > next.first ?? 0 {
            resule = false
            break
        }
    }
    return resule
}
