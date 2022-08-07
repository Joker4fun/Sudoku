//
//  Func.swift
//  Sudoku
//
//  Created by Антон Казеннов on 02.08.2022.
//

import Foundation

func createMap () -> [[Int]] {
    var matrix = [[Int]]()
        for i in 0...8 {
            matrix.append( [] )
            for _ in 0...8 {
                matrix[i].append(0)
            }
        }
        return matrix
}

func checkZero (map: [[Int]]) -> (x: Int, y: Int)? {
    var row = 0
    var cell = 0
    
    while row < 8 {
        while cell < 8{
            if map[row][cell] == 0 {
                let x = row
                let y = cell
                return (x,y)
            }
            cell += 1
        }
        row += 1
    }
    return nil
}

