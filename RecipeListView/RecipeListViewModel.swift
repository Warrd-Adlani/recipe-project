//
//  RecipeListViewModel.swift
//  RecipePal
//
//  Created by Warrd Adlani on 22/06/2024.
//

import Foundation
import SwiftUI

final class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var searchString: String = "" {
        didSet {
           didSearch(with: searchString)
        }
    }
    
    private var recipesResponse: [Recipe] = [] {
        didSet {
            recipes = recipesResponse
        }
    }
    private var networkService = NetworkService.shared
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    func onAppear() {
        getRecipes()
    }
    
    private func didSearch(with string: String) {
        print(string)
        print(string.count)
        print("called")
        if string.isEmpty {
            recipes = recipesResponse
        } else {
            recipes = recipesResponse.filter({ $0.name.contains(searchString) })
        }
    }
    
    private func getRecipes() {
        networkService.fetchRecipes { [weak self] result in
            switch result {
            case .success(let recipes):
                self?.recipesResponse = recipes
            case .failure(let error):
                print(error)
            }
        }
    }
}
