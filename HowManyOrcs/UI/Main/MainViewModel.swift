//
//  MainViewModel.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published internal var stats: [Stat] = []
    
    internal func getStats() {
        NetworkManager.shared.getStats() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.stats = self?.parseStats(response.data) ?? []
                case .failure:
                    return
                }
            }
        }
    }
    
    private func parseStats(_ data: OrcsData) -> [Stat] {
        let parsed = [Stat(name: "Orcs",
                           amount: data.stats.personnel_units,
                           increase: data.increase.personnel_units),
                      Stat(name: "Tanks",
                           amount: data.stats.tanks,
                           increase: data.increase.tanks),
                      Stat(name: "AFV",
                           amount: data.stats.armoured_fighting_vehicles,
                           increase: data.increase.armoured_fighting_vehicles),
                      Stat(name: "Artillery",
                           amount: data.stats.artillery_systems,
                           increase: data.increase.artillery_systems),
                      Stat(name: "MLRS",
                           amount: data.stats.mlrs,
                           increase: data.increase.mlrs),
                      Stat(name: "Planes",
                           amount: data.stats.planes,
                           increase: data.increase.planes),
                      Stat(name: "Helicopters",
                           amount: data.stats.helicopters,
                           increase: data.increase.helicopters),
                      Stat(name: "Warships",
                           amount: data.stats.warships_cutters,
                           increase: data.increase.warships_cutters),
                      Stat(name: "Missiles",
                           amount: data.stats.cruise_missiles,
                           increase: data.increase.cruise_missiles)]
        
        return parsed
    }
}
