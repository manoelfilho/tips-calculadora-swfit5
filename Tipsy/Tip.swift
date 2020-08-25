//
//  Tip.swift
//  Tipsy
//
//  Created by Manoel Filho on 25/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Tip {
    
    let value: Float
    let numberOfPersons: Int
    let percentage: Int
    
    func getValueByPerson() -> Float {
        let valueByPerson = (value / Float(numberOfPersons))
        let valueOfPercentual = (Float(percentage) / 100.0) * valueByPerson
        return valueByPerson + valueOfPercentual
    }
    
}
