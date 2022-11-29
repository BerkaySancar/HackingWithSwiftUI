//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Berkay Sancar on 29.11.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    
    var id = UUID()
    let name: String
    let type: String
    let amount: Double 
}
