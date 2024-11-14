//
//  MockRecipeService.swift
//  RecipesTests
//
//  Created by Eugene Berezin on 11/13/24.
//

import XCTest
@testable import Recipes

class MockRecipeService: RecipeService {
    var mockData: [Recipe] = []
    var shouldReturnError = false
    var error: NetworkError = .emptyData

    func fetchRecipes(from urlString: String) async throws -> [Recipe] {
        if shouldReturnError {
            throw error
        }
        return mockData
    }
}

