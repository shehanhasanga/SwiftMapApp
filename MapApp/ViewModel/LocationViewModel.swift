//
//  LocationViewModel.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import Foundation
import MapKit

class LocationViewModel : ObservableObject {
    @Published var locations : [Location]
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var location : Location {
        didSet{
            updateMapregion()
        }
    }
    
    
    let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        self.locations = LocationsDataService.locations
        self.location = LocationsDataService.locations.first!

        updateMapregion()
    }
    
    private func updateMapregion(){
        self.mapRegion = MKCoordinateRegion(center: self.location.coordinates, span: span)
    }
  
}
