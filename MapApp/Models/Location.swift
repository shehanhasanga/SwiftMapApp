//
//  Location.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import Foundation
import MapKit

struct Location: Identifiable{
    let name :String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description :String
    let imageNames :[String]
    let link : String
    
    var id : String {
        return name + cityName
    }
}
