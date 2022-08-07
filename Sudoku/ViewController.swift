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
        
      let matrix = createMap()

        for i in 0...8{
            print(matrix[i][0...8])
            //    print(matrix[i])
        }

        
        
    }
}

