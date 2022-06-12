//
//  ContentView.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Variables
    
    @StateObject private var viewModel = MainViewModel()
    
    @State private var showChart = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color("background-main")
            
            VStack {
                self.headerView
                
                ListView(stats: self.viewModel.stats)
            }
        }
        .onAppear() {
            self.viewModel.getStats()
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Views
    
    private var headerView: some View {
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
            
            HStack() {
                Spacer()
                
                Button() {
                    self.showChart.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .tint(.white)
                        .imageScale(.large)
                }
                .sheet(isPresented: self.$showChart) {
                    ChartView(stats: self.viewModel.stats)
                }
            }
            .padding(.trailing, 30)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
        .background(Color("header-main"))
        .cornerRadius(60, corners: [.bottomLeft, .bottomRight])
        .padding(.bottom, -10)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
