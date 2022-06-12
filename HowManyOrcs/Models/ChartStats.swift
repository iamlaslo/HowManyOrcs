//
//  ChartStats.swift
//  HowManyOrcs
//
//  Created by Laslo on 12.06.2022.
//

import Foundation

enum ChartStatType: String {
    
    case amount = "Amount"
    case increase = "Increase"
}

struct ChartStat: Identifiable {
    
    let id = UUID()
    let name: String
    let amount: Int
    let type: ChartStatType
}
