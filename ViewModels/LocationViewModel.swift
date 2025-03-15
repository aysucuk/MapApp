//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Aysu Sadıxova on 15.03.25.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
