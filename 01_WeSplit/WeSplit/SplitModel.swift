//
//  SplitModel.swift
//  WeSplit
//
//  Created by Balázs Képli on 3/10/24.
//

import Foundation

struct SplitModel {
    
    var checkAmount = 0.0
    var numberOfPeople = 0
    var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        return (checkAmount + tipValue) / peopleCount
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        return (checkAmount + tipValue)
    }
}
