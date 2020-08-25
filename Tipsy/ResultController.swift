//
//  ResultController.swift
//  Tipsy
//
//  Created by Manoel Filho on 25/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    var tip: Tip? = nil

    @IBOutlet weak var valuePerPersonLabel: UILabel!
    
    @IBOutlet weak var resultLabelFooter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finalValue = tip?.getValueByPerson()
        valuePerPersonLabel.text = String(format: "%.2f", finalValue ?? "0.0")
        resultLabelFooter.text = "Dividido para \(tip?.numberOfPersons ?? 0) pessoas com taxa de \(tip?.percentage ?? 0)%"
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
