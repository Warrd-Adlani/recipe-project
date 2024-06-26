//
//  RecipeListViewCell.swift
//  RecipePal
//
//  Created by Warrd Adlani on 22/06/2024.
//

import SwiftUI


struct RecipeListViewCell: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            AsyncImage(url: recipe.url) { image in
                VStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                        .background(.mint)
                }
            } placeholder: {
                VStack {
                    ProgressView()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 150)
                .background(.gray.opacity(0.2))
            }
               
            HStack {
                VStack(alignment: .leading) {
                    Text(recipe.name.capitalized)
                        .lineLimit(2)
                        .font(.headline)
                    Group {
                        Text("Servings: \(recipe.servings)")
                        Text("Prep time: \(recipe.prepTimeMinutes) min")
                    }
                    .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.horizontal, 10)
            Spacer()
        }
        .background(.white)
        .frame(height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
    }
}


#Preview {
    RecipeListViewCell(recipe: RecipeResponse.mockRecipes.first!)
}
