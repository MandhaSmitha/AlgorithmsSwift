//
//  MyFirstSwiftUIAppApp.swift
//  MyFirstSwiftUIApp
//
//  Created by Mandha Smitha S on 10/01/2021.
//

import SwiftUI

@main
struct MyFirstSwiftUIAppApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
