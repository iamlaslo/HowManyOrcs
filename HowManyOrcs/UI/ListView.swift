//
//  ListView.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

struct ListView: View {
    
    internal let stats: [Stat]
    
    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: Const.isPad ? 240 : 120))]
    }
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: self.columns, spacing: Const.isPad ? 100 : 30) {
                    ForEach(self.stats) {
                        StatView(name: $0.name, amount: $0.amount, increase: $0.increase)
                    }
                }
                .padding()
                .padding(.top, Const.isPad ? 60 : 20)
            }
            .background(Color("background-main"))
            
            if self.stats.isEmpty {
                ProgressView()
                    .scaleEffect(2)
            }
        }
    }
    
    private func checkDevice() {
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(stats: [Stat(name: "Example", amount: 123, increase: 123)])
    }
}
