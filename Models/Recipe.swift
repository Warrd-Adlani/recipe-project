//
//  Recipe.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: String
    let ingredients: [String]
    let prepTimeMinutes: Int
    let cookTimeMinutes: Int
    let servings: Int
    let difficulty: String
    let cuisine: String
    
    var url: URL? {
        return URL(string: image)
    }
}

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
    let total: Int
    let limit: Int
}

extension Recipe {
    static let mockRecipe = Recipe(id: Int.random(in: 0...1000),
                               name: "mock recipe",
                               image: "https://cdn.dummyjson.com/recipe-images/3.webp",
                               ingredients: ["1", "2"],
                               prepTimeMinutes: 10,
                               cookTimeMinutes: 124,
                               servings: 4,
                               difficulty: "easy",
                               cuisine: "Italian")
}

extension RecipeResponse {
    static var mockRecipes: [Recipe] = {
        var recipes: [Recipe] = []
        
        for i in 0...25 {
            let recipe = Recipe(id: i,
                                name: "A long name for a fancy delicious dish",
                                image: "https://cdn.dummyjson.com/recipe-images/3.webp",
                                ingredients: ["1", "2"],
                                prepTimeMinutes: 10,
                                cookTimeMinutes: 124,
                                servings: 4,
                                difficulty: "easy",
                                cuisine: "Italian")
            recipes.append(recipe)
        }
        
        return recipes
    }()
}
