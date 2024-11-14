//
//  RecipesListView.swift
//  Recipes
//
//  Created by Eugene Berezin on 11/13/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject private var viewModel = RecipesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                RecipeRowView(recipe: recipe)
            }
            .refreshable {
                await viewModel.fetchRecipes()
            }
            .navigationTitle("Recipes")
            .onAppear {
                Task {
                    await viewModel.fetchRecipes()
                }
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "An unknown error occurred."),
                    dismissButton: .default(Text("OK")) {
                        viewModel.errorMessage = nil // Clear the error after showing the alert
                    }
                )
            }
        }
    }
}
