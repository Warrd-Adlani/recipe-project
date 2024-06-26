//
//  RecipeListCollectionView.swift
//  RecipePal
//
//  Created by Warrd Adlani on 22/06/2024.
//

import SwiftUI

struct RecipeListCollectionView: View {
    let columns: [GridItem]
    let recipes: [Recipe]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(recipes) { recipe in
                    RecipeListViewCell(recipe: recipe)
                        .padding(5)
                }
            }
        }
    }
}
#Preview {
    RecipeListCollectionView(columns: [GridItem(.flexible()), GridItem(.flexible())], recipes: RecipeResponse.mockRecipes)
}
