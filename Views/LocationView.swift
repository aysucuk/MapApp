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
            
            VStack{
                header
                .padding()
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

extension LocationView {
   
    private var header: some View {
        VStack {
            
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .topLeading) {
                        Image(systemName: "arrow.down.circle")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? -90 : 0))
                    }
            }
            
            if vm.showLocationsList{
                LocationsListView()
            }
           
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
    
}
