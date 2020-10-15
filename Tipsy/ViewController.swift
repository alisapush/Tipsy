//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalBillTextField: UITextField!
    
    @IBOutlet weak var zeroPrecentTipButton: UIButton!
    @IBOutlet weak var tenPrecentTipButton: UIButton!
    @IBOutlet weak var twentyPrecentTipButton: UIButton!
    
    @IBOutlet weak var SplitLabel: UILabel!
    
    @IBOutlet weak var SplitStepper: UIStepper!
    
    @IBOutlet weak var CalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stepperChanged(_ sender: Any) {
        SplitLabel.text = String(format: "%.0f", SplitStepper.value)
    }
    
    @IBAction func tipButtonDidClick (selectedButton: UIButton) {
        totalBillTextField.endEditing(true)
        selectedButton.isSelected = true
        
        switch (selectedButton) {
        case zeroPrecentTipButton:
            tenPrecentTipButton.isSelected = false
            twentyPrecentTipButton.isSelected = false
            
        case tenPrecentTipButton:
            zeroPrecentTipButton.isSelected = false
            twentyPrecentTipButton.isSelected = false
            
        case twentyPrecentTipButton:
            zeroPrecentTipButton.isSelected = false
            tenPrecentTipButton.isSelected = false
        
        default:
            print("if you see -- error 1")
            fatalError()
        }
    }
    
    func selectedPrecent() -> Float {
        if (zeroPrecentTipButton.isSelected == true) {
            return 0
        } else if (tenPrecentTipButton.isSelected == true) {
            return 10
        } else if (twentyPrecentTipButton.isSelected == true) {
            return 20
        } else {
            return 0
        }
    }
    
    @IBAction func onClickButtonCalculate(_ sender: Any) {
        
        if let totalBill = Float(totalBillTextField.text!) {
            let summa = (totalBill * (selectedPrecent() / 100 + 1) ) / Float(SplitLabel.text!)!
            print("summa = ", summa)
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: "TotalBillViewController") as! TotalBillViewController
            
            vc.splitBetween = String(format: "%.2f", summa)
            
            vc.information = "Split between \(SplitLabel.text!) people, with \(Int(selectedPrecent()))% tip"
            
            self.present(vc, animated: true, completion: nil)
            

        } else {
            print("error 2")
        }
        
        
        
        
        
        
        
    }

}
