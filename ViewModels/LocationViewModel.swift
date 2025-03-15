//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 15.03.25.
//

import Foundation
import MapKit

class LocationViewModel: ObservableObject {
    
    //all loaded location
    @Published var locations: [Location]
    
    //current location on map
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
    }
    
}
