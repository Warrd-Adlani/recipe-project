//
//  HomeScreens.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import Foundation

// MARK: Screens
enum HomeScreen: String, Identifiable {
    case recipes
    case settings
    
    var id: String {
        return self.rawValue
    }
}

enum HomeSheets: String, Identifiable {
    case annoyingPopup
    
    var id: String {
        return self.rawValue
    }
}
