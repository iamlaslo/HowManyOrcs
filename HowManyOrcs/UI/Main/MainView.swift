//
//  ContentView.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color("background-main")
            
            VStack {
                HeaderView()
                
                ListView(stats: self.viewModel.stats)
            }
        }
        .onAppear() {
            self.viewModel.getStats()
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
