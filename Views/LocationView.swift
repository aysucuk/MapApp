//
//  LocationView.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 15.03.25.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        
        ZStack{
             Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
