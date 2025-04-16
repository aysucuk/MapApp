//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 15.04.25.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(radius: 50)
                
                VStack(alignment: .leading, spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationViewModel())
}

extension LocationDetailView {
    
    private var imageSection: some View {
        
        TabView{
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: location.link) {
                Link(destination: url) {
                    Text("Read more on Wikipedia")
                        .font(.headline)
                        .tint(.blue)
                }
            }
        }
    }
    
    private var mapLayer : some View {
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01))),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    private var backButton : some View {
        Button(action: {
            vm.sheetLocation = nil
        }) {
            Image(systemName: "xmark")
                .foregroundColor(.primary)
                .font(.headline)
                .padding(16)
                .background(.ultraThinMaterial)
                .shadow(radius: 4)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
        }
    }
}
