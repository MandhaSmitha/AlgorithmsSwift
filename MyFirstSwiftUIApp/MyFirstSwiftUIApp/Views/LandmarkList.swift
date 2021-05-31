//
//  LandmarkList.swift
//  MyFirstSwiftUIApp
//
//  Created by Mandha Smitha S on 22/01/2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavouritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { (landmark) -> Bool in
            (!showFavouritesOnly || landmark.isFavorite)
        }
    }
        
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavouritesOnly, label: {
                    Text("Favourites Only")
                })
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(ModelData())
        }
    }
}
