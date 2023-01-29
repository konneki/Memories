//
//  ContentView.swift
//  Memories
//
//  Created by Daniel Konnek on 29.01.2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var image = UIImage()
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 4)
                    .frame(width: 300, height: 300)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(8)
            
            Button("Take picture") {
                // Invoke Image Picker to take a pic and save a pin on the map with current user's location
            }
            Button("Start Tracking Location") {
                self.locationFetcher.start()
            }

            Button("Read Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    print("Your location is \(location)")
                } else {
                    print("Your location is unknown")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
