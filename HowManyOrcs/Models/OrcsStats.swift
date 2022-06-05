//
//  OrcsStats.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import Foundation

struct Stat: Identifiable {
    
    let id = UUID()
    let name: String
    let amount: Int
    let increase: Int
}

struct OrcsStats: Decodable {
    
    let personnel_units: Int
    let tanks: Int
    let armoured_fighting_vehicles: Int
    let artillery_systems: Int
    let mlrs: Int
    let aa_warfare_systems: Int
    let planes: Int
    let helicopters: Int
    let vehicles_fuel_tanks: Int
    let warships_cutters: Int
    let cruise_missiles: Int
    let uav_systems: Int
    let special_military_equip: Int
    let atgm_srbm_systems: Int
}

struct OrcsData: Decodable {
    
    let day: Int
    let stats: OrcsStats
    let increase: OrcsStats
}

struct OrcsResponse: Decodable {
    
    let data: OrcsData
}
