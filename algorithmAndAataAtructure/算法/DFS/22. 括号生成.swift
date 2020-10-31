//
//  22. 括号生成.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2020/9/12.
//  Copyright © 2020 孙琦. All rights reserved.
//

import Foundation

class bb {
    
    var leftRemain = 0
    var rightRemain = 0
    var innerNum = 0
    var list: [String] = []
    var strings: [String] = []
    
    func generateParenthesis(_ n: Int) -> [String] {
        if n < 0 {
            return []
        }
        
        innerNum = n
        leftRemain = n
        rightRemain = n
        
        strings = Array(repeating: "", count: innerNum * 2)
        
        dfs(0)
        
        return list
    }
    
    func dfs(_ index: Int) {
        
        if index == strings.count {
            let string = strings.joined()
            list.append(string)
            return
        }
        
        // 什么情况可以选择左括号？左括号的数量 > 0
        if leftRemain > 0 {
            leftRemain -= 1
            strings[index] = "("
            dfs(index + 1)
            leftRemain += 1 // 恢复左括号
        }
        
        // 当左括号、右括号的数量一样时，只能选择左括号
        // 什么情况可以选择右括号？(右括号的数量 > 0) && (右括号的数量 != 左括号的数量)
        if rightRemain > 0 && leftRemain != rightRemain {
            rightRemain -= 1
            strings[index] = ")"
            dfs(index + 1)
            rightRemain += 1 // 恢复右括号
        }
    }
}
