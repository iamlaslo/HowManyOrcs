//
//  ChartView.swift
//  HowManyOrcs
//
//  Created by Laslo on 11.06.2022.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    // MARK: - Variables
    
    var stats: [Stat]
    
    // MARK: - Body
    
    var body: some View {
        Chart(self.parsedStatsForChart()) {
            BarMark(
                x: .value("Name", $0.name),
                y: .value("Value", $0.amount)
            )
        }
        .padding()
    }
    
    // MARK: - Private
    
    private func parsedStatsForChart() -> [ChartStat] {
        var result: [ChartStat] = []
        
        var stats = stats.dropFirst()
        stats.removeAll(where: {
            $0.name == "AFV"
        })
        
        stats.forEach {
            result.append(ChartStat(name: $0.name, amount: $0.amount, type: .amount))
            result.append(ChartStat(name: $0.name, amount: $0.increase, type: .increase))
        }
        
        return result
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(stats: [
            Stat(name: "First", amount: 11, increase: 5),
            Stat(name: "Second", amount: 15, increase: 8)
        ])
    }
}
