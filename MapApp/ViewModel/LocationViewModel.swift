//
//  LocationViewModel.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel : ObservableObject {
    @Published var locations : [Location]
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    @Published var showListView:Bool = false
    @Published var sheetLocation : Location? = nil
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
    
     func toggleLocationList(){
        withAnimation(.easeInOut) {
            showListView.toggle()
        }
       
    }
    
    func gotonextLocation(location: Location) {
        withAnimation(.easeInOut) {
            self.location = location
            self.showListView = false
        }
      
    }
    
    func nextBtnClick(){
        guard let currentIndex = locations.firstIndex(where: {$0.id == location.id}) else {
            return
        }
        
        let nextLocationIndex = currentIndex + 1
        
        guard locations.indices.contains(nextLocationIndex) else {
            guard let firstLocation = locations.first else {
                return
            }
            gotonextLocation(location: firstLocation)
            
            return
        }
        
        let nextLocation  = locations[nextLocationIndex]
        gotonextLocation(location: nextLocation)
        
    }
  
}
