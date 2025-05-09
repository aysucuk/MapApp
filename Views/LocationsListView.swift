//
//  LocationsListView.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 15.03.25.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List {

            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                    .padding(.vertical, 8)
                    .listRowBackground(Color.clear)
            }            
        }
        .listStyle(PlainListStyle())
        .frame(height: 450)
        
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}

extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
            Text(location.name)
                    .font(.headline)
            Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
