//
//  20. 有效的括号.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/14.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/valid-parentheses/

/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 */

import Foundation

class 有效的括号 {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        
        let lefts = ["(", "[", "{"]
        let rights = [")", "]", "}"]
        
        let stack = Stack<Character>()
        let strings = Array(s)
        
        for c in strings {
            let s = String(c)
            if lefts.contains(s) {
                stack.push(c)
                continue
            }
            
            if rights.contains(s) {
                if stack.isEmpty() {
                    return false
                }
                
                let leftC = stack.pop()
                let leftS = String(leftC)
                if leftS == "[" && s == "]" ||
                    leftS == "(" && s == ")" ||
                    leftS == "{" && s == "}" {
                    continue
                } else {
                    return false
                }
            }
        }
        
        if !stack.isEmpty() {
            return false
        }
        
        return true
    }
}

