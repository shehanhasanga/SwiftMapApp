//
//  LocationViewModel.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import Foundation

class LocationViewModel : ObservableObject {
    @Published var locations : [Location]
    
    init(){
        self.locations = LocationsDataService.locations
    }
}
