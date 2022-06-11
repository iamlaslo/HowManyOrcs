//
//  HowManyOrcsApp.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import SwiftUI

public struct Const {
    
    static let isPad = UIDevice.current.userInterfaceIdiom == .pad
}

@main
struct HowManyOrcsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
