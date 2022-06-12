//
//  Stat.swift
//  HowManyOrcs
//
//  Created by Laslo on 12.06.2022.
//

import Foundation

struct Stat: Identifiable {
    
    let id = UUID()
    let name: String
    let amount: Int
    let increase: Int
}
