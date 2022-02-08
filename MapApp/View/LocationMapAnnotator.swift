//
//  LocationMapAnnotator.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import SwiftUI

struct LocationMapAnnotator: View {
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.red)
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(.red)
                .offset(y:-4)
                .padding(.bottom, 40)
            
        }
        
    }
}

struct LocationMapAnnotator_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotator()
    }
}
