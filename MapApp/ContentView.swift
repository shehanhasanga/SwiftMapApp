//
//  ContentView.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationViewModel : LocationViewModel
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationViewModel.mapRegion)
        }
        .ignoresSafeArea()
//        List{
//            ForEach(locationViewModel.locations){ location in
//                Text(location.name)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocationViewModel())
    }
}
