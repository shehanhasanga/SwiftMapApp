//
//  LocationPreview.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import SwiftUI

struct LocationPreview: View {
    @EnvironmentObject var locationViewModel : LocationViewModel
    let location:Location
    var body: some View {
        VStack{
            HStack(alignment:.bottom){
                VStack(alignment:.leading, spacing: 10){
                    imageSection
                    titleSection
                   
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal, 20)
               
                VStack(alignment:.leading, spacing: 10){
                    
                    learnMore
                    nextbtn
                 
                }
                .padding(.horizontal, 20)
            }.background(RoundedRectangle(cornerRadius: 10)
                            .fill(.thickMaterial )
                                        .offset(y:50)
                        
                        )
               
          
           
            
        }
        .padding()
        .padding(.vertical, 40)
        
        
        
    }
}

extension LocationPreview {
    var imageSection : some View{
        ZStack{
            if let image = location.imageNames.first{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding( 5)
        .background(.white)
        .cornerRadius(10)
    }
    var titleSection : some View{
        VStack(alignment:.leading){
            Text(location.name)
                .font(.headline)
                .fontWeight(.black)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    var learnMore : some View{
        Button{
            
        }label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    var nextbtn : some View{
        Button{
            locationViewModel.nextBtnClick()
        }label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}

struct LocationPreview_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreview(location: LocationsDataService.locations.first!)
    }
}
