//
//  ViewController.swift
//  Sudoku
//
//  Created by Антон Казеннов on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var matrix = createMap()
        var boxSize = 2
        matrix[0][0] = 2
        matrix[0][1] = 3
        matrix[1][0] = 1
        matrix[1][1] = 3

      //  matrix[0][0] = 5



        for i in 0...3{
            print(matrix[i][0...3])
            //    print(matrix[i])
        }

        print(checkBox(Coord: (0, 1), map: matrix, boxSize: 2))
        
    }
}

