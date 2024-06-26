//
//  ContentView.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = HomeCoordinator()
    
    var body: some View {
        HomeCoordinatorView(coordinator: coordinator)
    }
}

#Preview {
    ContentView()
}
