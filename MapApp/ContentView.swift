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
            Map(coordinateRegion: $locationViewModel.mapRegion) .ignoresSafeArea()
            VStack(){
                header
                .padding()
                
                
                Spacer()
                
                ZStack{
                    ForEach(locationViewModel.locations){ location in
                        if location == locationViewModel.location {
                            LocationPreview(location: location)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                       
                    }
                }
                    
            }
          
        }
       
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

extension ContentView {
    var header: some View{
        VStack{
            Button{
                locationViewModel.toggleLocationList()
            }label: {
                Text(locationViewModel.location.name + "," + locationViewModel.location.cityName)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(height:50)
                    .frame(maxWidth:.infinity)
                    .animation(.none, value: locationViewModel.location)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: locationViewModel.showListView ? 180 : 0))
                    }
            }
            .accentColor(.black)
            
              
            if locationViewModel.showListView {
                LocationsListView()
            }
           
        }
       
        .background(.thickMaterial)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.7), radius: 10, x: 0, y: 0)
    }
}
