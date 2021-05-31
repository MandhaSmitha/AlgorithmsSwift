//
//  ContentView.swift
//  MyFirstSwiftUIApp
//
//  Created by Mandha Smitha S on 10/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
