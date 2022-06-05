//
//  StatView.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

struct StatView: View {
    
    let name: String
    let amount: Int
    let increase: Int
    
    var body: some View {
        VStack {
            VStack {
                Text("\(self.amount)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.7)
                
                Text(self.increase > 0 ? "+\(self.increase)" : "")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .frame(height: 50)
            .padding(.top)
            
            Text(self.name)
                .font(.callout)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding(.bottom, 10)
        }
        .frame(width: 120, height: 120)
        .background(Color("cell-main"))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            StatView(name: "helicopters", amount: 300, increase: 0)
            StatView(name: "helicopters", amount: 300, increase: 1)
        }
    }
}
