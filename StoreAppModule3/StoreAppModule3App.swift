//
//  StoreAppModule3App.swift
//  StoreAppModule3
//
//  Created by Salome Lapiashvili on 19.12.23.
//

import SwiftUI


@main
struct StoreAppModule3App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                let mainViewModel = MainViewModel()

                ContentView(viewModel: mainViewModel)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                CategoriesView()
                    .tabItem {
                        Label("Categories", systemImage: "list.bullet")
                    }

                // Add more tabs as needed
            }
        }
    }
}


