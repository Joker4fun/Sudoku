//
//  Func.swift
//  Sudoku
//
//  Created by Антон Казеннов on 02.08.2022.
//

import Foundation

// create matrix
var matrix = [[Int]]()
for i in 0...8 {
    matrix.append( [] )
    for _ in 0...8 {
        matrix[i].append( Int.random(in: 1...9) )
    }
}
//ckeck uniq numbers in row
func checkAndDelete (num: Int , Arr: [Int]) -> [Int]{
    var mass = Arr
    var i = 0
    while i < mass.count + 1 {
//        print("Count \(mass.count) and mass[i] = \(mass[i]) and num \(num )")
        if mass[i] == num {
            mass.remove(at: i)
            return mass
        }
        
        i += 1
    }
    return mass
}
let myArray = [1,2,3,4,5,6,7,8,9]
var i = 0, j = 0
while i != 8 {
    var checkNumbers = myArray
    j = 0
    
    while j != 8 {
        if checkNumbers.contains(matrix[i][j]) {
            checkNumbers = checkAndDelete(num: matrix[i][j], Arr: checkNumbers)
        }else {
            matrix[i][j] = checkNumbers.randomElement()!
        }
        print(checkNumbers)
        
        j += 1
    }
    i += 1
}



for i in 0...8{
    print(matrix[i][0...8])
    //    print(matrix[i])
}

