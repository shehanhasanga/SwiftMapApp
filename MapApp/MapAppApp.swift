//
//  MapAppApp.swift
//  MapApp
//
//  Created by shehan karunarathna on 2022-02-08.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject var locationsvm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationsvm)
        }
    }
}
