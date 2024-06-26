//
//  HomeCoordinator.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import Foundation
import SwiftUI

class HomeCoordinator: ObservableObject {
    
    // MARK: Publishers
    
    @Published var tab: HomeScreen = .recipes
    
    @ViewBuilder
    func build(_ screen: HomeScreen) -> some View {
        switch screen {
        case .recipes:
            RecipeListView(viewModel: RecipeListViewModel())
        case .settings:
            Text("Settings")
        }
    }
}
