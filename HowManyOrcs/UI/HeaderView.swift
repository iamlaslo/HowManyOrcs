//
//  HeaderView.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image("orc-face")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .shadow(color: .red, radius: 70)
            
            Text("How many\n orcs died")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, -80)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
        .background(Color("header-main"))
        .cornerRadius(60, corners: [.bottomLeft, .bottomRight])
        .padding(.bottom, -10)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
