//
//  Func.swift
//  Sudoku
//
//  Created by Антон Казеннов on 02.08.2022.
//

import Foundation

func createMap () -> [[Int]] {
    var matrix = [[Int]]()
        for i in 0...3 {
            matrix.append( [] )
            for _ in 0...3 {
                matrix[i].append(0)
            }
        }
        return matrix
}

func checkZero (map: [[Int]]) -> (x: Int, y: Int)? {
    var row = 0
    var colomn = 0
    
    while row < 8 {
        while colomn < 8{
            if map[row][colomn] == 0 {
                let x = row
                let y = colomn
                return (x,y)
            }
            colomn += 1
        }
        row += 1
    }
    return nil
}

func checkRow(Coord: (Int, Int), map: [[Int]]) -> Bool {
    let row = Coord.0
    let currentPosition = Coord.1
    var colomn = Coord.1 - 1

    while colomn != -1 {
        if currentPosition == 0 {
            return true
        }
        if map[row][currentPosition] == map[row][colomn] {
            return false
        }
        colomn -= 1
    }
    return true
}

func checkCol(Coord: (Int, Int), map: [[Int]]) -> Bool {
    var row = Coord.0 - 1
    let currentPosition = Coord.0
    let colomn = Coord.1

    while row != -1 {
        if currentPosition == 0 {
            return true
        }
        if map[currentPosition][colomn] == map[row][colomn] {
            return false
        }
        row -= 1
    }
    return true
}


func checkBox(Coord: (Int, Int), map: [[Int]], boxSize: Int) -> Bool {
    let xS = (Coord.0 / boxSize) * boxSize // 0
    let yS = (Coord.1 / boxSize) * boxSize // 0
    let xE = xS + boxSize // 2
    let yE = yS + boxSize //2
    var i = xS //0
    var iC = yS //0
    
    while i < xE { // 0 < 2
        iC = yS
        while iC < yE { // 0 < 2
            if map[Coord.0][Coord.1] == map[i][iC] && (Coord.0 != i || Coord.1 != iC) {
                return false
            }
            iC += 1
        }
        i += 1
    }
    return true
}
