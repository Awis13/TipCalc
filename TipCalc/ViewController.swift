//
//  ViewController.swift
//  TipCalc
//
//  Created by Nikolay Postnikov on 01.07.2020.
//  Copyright © 2020 Nikolay Postnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peopleNumber: UILabel!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var fivteenPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var fivePercent: UIButton!
    
    var result = 0.0
    var tip = 0.10
    var numberOfPerson = 5
    var percent = 10
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fivePercent.isSelected = false
        tenPercent.isSelected = false
        fivteenPercent.isSelected = false
        
        
    }
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        fivePercent.isSelected = false
        tenPercent.isSelected = false
        fivteenPercent.isSelected = false
        
        
        if let percentString = Int((sender.titleLabel?.text)!.dropLast()) {
            percent = percentString
            sender.isSelected = true
            tip = Double(percent) / 100
            print(tip)
        } else {
            totalLabel.text = "Please select percent"
        }
        
        
        
        
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let peopleString = String(format: "%.f", slider.value)
        numberOfPerson = Int(peopleString)!
        print(numberOfPerson)
        peopleNumber.text = peopleString
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let totalString = Int(totalField.text!) {
            total = totalString
            print(total)
        } else {
            totalLabel.text = "Please enter total price!"
        }
        
        
        result = Double(total) * (1 + tip) / Double(numberOfPerson)
        
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCalculate" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.resultToPrint = result
            print(result)
        }
    }
    
}

