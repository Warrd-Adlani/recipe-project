//
//  HomeCoordinatorView.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import SwiftUI
import Combine

struct HomeCoordinatorView: View {
    @ObservedObject var coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        TabView(selection: $coordinator.tab) {
            coordinator.build(.recipes)
                .tabItem { Label(
                    title: { Text("Recipes") },
                    icon: { Image(systemName: "fork.knife") }
                ) }
                .tag(HomeScreen.recipes)
            
            coordinator.build(.settings)
                .tabItem { Label(
                    title: { Text("Settings") },
                    icon: { Image(systemName: "gearshape.2") }
                ) }
                .tag(HomeScreen.settings)
        }
        .tint(.mint)
    }
}


#Preview {
    HomeCoordinatorView(coordinator: HomeCoordinator())
}
