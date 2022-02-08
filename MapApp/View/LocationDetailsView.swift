//
//  LocationDetailsView.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @Environment(\.dismiss) var dismiss
    let location: Location
    let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    var body: some View {
        ScrollView{
            VStack{
                TabView{
                    ForEach(location.imageNames, id: \.self) {
                        image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped()
                    }
                }
                .frame(height:500)
                .tabViewStyle(PageTabViewStyle())
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                
                titlesection
                Divider()
                descriptionsection
                Divider()
                mapLayer
            }
           
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backbtn, alignment: .topLeading)
       
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationsDataService.locations.first!)
    }
}

extension LocationDetailsView{
    var titlesection : some View{
        VStack(alignment:.leading, spacing: 16){
           VStack(alignment:.leading){
               Text(location.name)
                   .font(.largeTitle)
                   .fontWeight(.semibold)
               Text(location.cityName)
                   .font(.subheadline)
           }
       }
       .frame(maxWidth:.infinity, alignment: .leading)
       .padding(.horizontal, 10)
    }
    
    var descriptionsection : some View{
        VStack(alignment:.leading, spacing: 16){
           VStack(alignment:.leading){
               Text(location.description)
                   .font(.subheadline)
                   .fontWeight(.semibold)
             
           }
            
            if let url = URL(string: location.link) {
                Link("Read more in Wiki", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
       }
       
        
    }
    
    var mapLayer : some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: span)), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotator()
                    .shadow(radius: 10)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    var backbtn : some View{
        Button{
            dismiss()
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding()
                .foregroundColor(.black)
                .background(.thickMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()
        }
    }
}
