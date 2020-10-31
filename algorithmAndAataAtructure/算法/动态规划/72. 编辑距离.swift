//
//  72. 编辑距离.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/11.
//  Copyright © 2020 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/edit-distance/

import Foundation

func minDistance(_ word1: String, _ word2: String) -> Int {
    if word1.isEmpty || word2.isEmpty {
        return word1.count + word2.count
    }
    
    let words1 = Array(word1)
    let words2 = Array(word2)
    
    var dp = Array(repeating: Array(repeating: 0, count: words2.count + 1), count: words1.count + 1)
    
    for i in 1...word1.count {
        dp[i][0] = i
    }
    
    for j in 1...word2.count {
        dp[0][j] = j
    }
    
    for i in 1...words1.count {
        for j in 1...words2.count {
            let top = dp[i - 1][j] + 1
            let left = dp[i][j - 1] + 1
            var topLeft = dp[i - 1][j - 1]
            
            let char1 = words1[i - 1]
            let char2 = words2[j - 1]
            
            if char1 != char2 {
                topLeft += 1
            }
            dp[i][j] = min(min(top, left), topLeft)
        }
    }
    return dp[word1.count][word2.count]
}
