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
        var boxSize = 3
        let matrix = createMap(boxsize: boxSize)
        printMat(boxsize: boxSize, map: matrix)
      
        
    }
}

 
