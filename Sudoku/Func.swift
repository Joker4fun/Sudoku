//
//  Func.swift
//  Sudoku
//
//  Created by Антон Казеннов on 02.08.2022.
//

import Foundation



func createMap (boxsize: Int) -> [[Int]] {
    var matrix = [[Int]]()
    let max = (boxsize * boxsize) - 1
    for i in 0...max {
        matrix.append( [] )
        for _ in 0...max {
            matrix[i].append(0)
        }
     
    }

//    while index < max + 1 {
//        var num = Int.random(in: 1...9)
//        if checkRow(Coord: (0, index), map: matrix) {
//            matrix[0][index] = num
//        }
//        index += 1
//    }
   
    
    func createGame (boxsize: Int) -> Bool {
        //printMat(boxsize: boxsize, map: matrix)
        var newMap = matrix
        let max = boxsize * boxsize
        var num: Int
        for _ in 1...max {
            //num = i
            num = Int.random(in: 1...max)

            let pos = checkZero(boxsize: boxsize, map: matrix)

            if pos == nil {
                return true
            }
            newMap[pos!.x][pos!.y] = num
            let numIsVal = isValidate(map: newMap, coord: (pos!.x, pos!.y), boxsize: boxsize)
            if numIsVal {
                let oldPos = pos
                matrix[oldPos!.x][oldPos!.y] = num
                if createGame(boxsize: boxsize) {
                    return true
                }
                matrix[oldPos!.x][oldPos!.y] = 0
            }
        }
      
        return false
        
    }
    
    
    
    createGame(boxsize: boxsize)
    return matrix
}

func checkZero (boxsize: Int, map: [[Int]]) -> (x: Int, y: Int)? {
    var row = 0
    var colomn = 0
    let max = boxsize * boxsize
    while row < max {
        colomn = 0
        while colomn < max {
            if map[row][colomn] == 0 {
                let x = row
                let y = colomn
                //print(x,y)
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


func isValidate (map: [[Int]], coord: (Int, Int), boxsize: Int) -> Bool {
    if checkRow(Coord: (coord.0, coord.1), map: map) {
        if checkCol(Coord: (coord.0, coord.1), map: map) {
            if checkBox(Coord: (coord.0, coord.1), map: map, boxSize: boxsize) {
                return true
            }
        }
    }
    return false
}



func printMat (boxsize: Int, map: [[Int]]) {
    let a = (boxsize * boxsize) - 1
    for i in 0...a{
        print(map[i][0...a])
    }
}
