//
//  LocationsListView.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var viewModel : LocationViewModel
    var body: some View {
        List{
            ForEach(viewModel.locations) {
                location in
                Button{
                    viewModel.gotonextLocation(location: location)
                }label: {
                    rowView(location: location)
                        .padding(.vertical, 4)
                }
               
                
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationsListView{
    func rowView(location: Location) -> some View {
        HStack{
            Image(location.imageNames.first!)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment:.leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }
            .frame(maxWidth:.infinity, alignment:.leading)
        }
    }
}
