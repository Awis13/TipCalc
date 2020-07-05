//
//  ResultsViewController.swift
//  TipCalc
//
//  Created by Nikolay Postnikov on 01.07.2020.
//  Copyright © 2020 Nikolay Postnikov. All rights reserved.
//

import Foundation
import UIKit


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var resultToPrint: Double = 0.0

    
    override func viewDidLoad() {
        if resultToPrint > 0.0 {
            resultLabel.text = String(resultToPrint)
            
        } else {
            resultLabel.text = "Please enter any value"
        }
        
    }
    @IBAction func recalcPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
}
