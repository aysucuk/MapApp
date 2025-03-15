//
//  LocationView.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 15.03.25.
//

import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
        
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
