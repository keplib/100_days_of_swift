//
//  SplitVM.swift
//  WeSplit
//
//  Created by Balázs Képli on 3/10/24.
//

import Foundation

class SplitVM: ObservableObject {
    
    @Published private var model = SplitModel()
    
    var checkAmount: Double{
        get {
            return model.checkAmount
        }
        
        set {
            model.checkAmount = newValue
        }
    }
    
    var numberOfPeople: Int {
        get {
            return model.numberOfPeople
        }
        
        set {
            model.numberOfPeople = newValue
        }
    }
    
    var tipPercentage: Int {
        get {
            return model.tipPercentage
        }
        
        set {
            model.tipPercentage = newValue
        }
    }
    
    var tipPercentages: Array<Int> {
        return model.tipPercentages
    }
    
    var totalPerPerson: Double {
        return model.totalPerPerson
    }
    
    var totalAmount: Double {
        return model.totalAmount
    }
}
