//
//  RecipeListView.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject private var viewModel: RecipeListViewModel
    
    init(viewModel: RecipeListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    RecipeListCollectionView(
                        columns: viewModel.columns,
                        recipes: viewModel.recipes
                    )
                }
            }
            .padding(.horizontal, 10)
            .navigationTitle("Recipes")
        }
        .searchable(text: $viewModel.searchString)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    RecipeListView(viewModel: RecipeListViewModel())
}
