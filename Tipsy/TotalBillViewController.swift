//
//  TotalBillViewController.swift
//  Tipsy
//
//  Created by Alisa Pushnova on 10/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class TotalBillViewController: UIViewController {
    
    var splitBetween = ""
    var information = ""
    @IBOutlet weak var splitBetweenLabel: UILabel!
    
    @IBOutlet weak var informationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitBetweenLabel.text = splitBetween
        informationLabel.text = information
    }

    @IBAction func recalculateButtonDidClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
