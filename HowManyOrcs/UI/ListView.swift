//
//  ListView.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

struct ListView: View {
    
    internal let stats: [Stat]
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 30) {
                    ForEach(self.stats) {
                        StatView(name: $0.name, amount: $0.amount, increase: $0.increase)
                    }
                }
                .padding()
            }
            .background(Color("background-main"))
            
            if self.stats.isEmpty {
                ProgressView()
                //                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                //                    .shadow(color: .white, radius: 1)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(stats: [Stat(name: "Example", amount: 123, increase: 123)])
    }
}
