//
//  MapAppApp.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 09.03.25.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
