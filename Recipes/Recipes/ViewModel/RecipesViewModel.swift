//
//  RecipesViewModel.swift
//  Recipes
//
//  Created by Eugene Berezin on 11/13/24.
//

import Foundation

@MainActor
class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String?
    
    private let recipeService: RecipeService
    
    init(recipeService: RecipeService = NetworkManager()) {
        self.recipeService = recipeService
    }
    
    func fetchRecipes() async {
        let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        do {
            self.recipes = try await recipeService.fetchRecipes(from: urlString)
            self.errorMessage = nil // Clear any previous errors if fetch is successful
        } catch let error as NetworkError {
            self.errorMessage = error.localizedDescription
            self.recipes = []
        } catch {
            self.errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
            self.recipes = []
        }
    }
}
