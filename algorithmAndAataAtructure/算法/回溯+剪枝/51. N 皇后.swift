//
//  51. N 皇后.swift
//  algorithmAndAataAtructure
//
//  Created by 孙琦 on 2021/4/16.
//  Copyright © 2021 孙琦. All rights reserved.
//  https://leetcode-cn.com/problems/n-queens/

/*
 n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

 给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

 每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
 */

import Foundation

func solveNQueens(_ n: Int) -> [[String]] {
    var solutions: [[String]] = []
    var queens = Array(repeating: -1, count: n)
    var columns = Set<Int>() // 列数组
    var diagonals1 = Set<Int>() //对角线数组 左上角到右下角 该对角线上 row - i 都一样
    var diagonals2 = Set<Int>() // 对角线数组 左下角到右上角 该对角线上 row + i 都一样
    solveNQueens(&solutions, queens: &queens, n: n, row: 0, columns: &columns, diagonals1: &diagonals1, diagonals2: &diagonals2)
    return solutions
}

func solveNQueens(_ solutions: inout [[String]], queens: inout [Int], n: Int, row: Int, columns: inout Set<Int>, diagonals1: inout Set<Int>, diagonals2: inout Set<Int>) {
    if row == n {
        let board = generateBoard(queens, n: n)
        solutions.append(board)
    } else {
        for i in 0..<n {
            // 同一列是否包含了
            if columns.contains(i) {
                continue
            }
            
            let diagonal1 = row - i
            // 同一\对角线是否包含了
            if diagonals1.contains(diagonal1) {
                continue
            }
            let diagonal2 = row + i
            // 同一/对角线是否包含了
            if diagonals2.contains(diagonal2) {
                continue
            }
            queens[row] = i
            columns.insert(i)
            diagonals1.insert(diagonal1)
            diagonals2.insert(diagonal2)
            
            solveNQueens(&solutions, queens: &queens, n: n, row: row + 1, columns: &columns, diagonals1: &diagonals1, diagonals2: &diagonals2)
            queens[row] = -1
            columns.remove(i)
            diagonals1.remove(diagonal1)
            diagonals2.remove(diagonal2)
        }
    }
}

// 生成最终显示的数组
func generateBoard(_ queens: [Int], n: Int) -> [String] {
    var board: [String] = []
    for i in 0..<n {
        var row = Array(repeating: ".", count: n)
        row[queens[i]] = "Q"
        board.append(row.joined())
    }
    return board
}
