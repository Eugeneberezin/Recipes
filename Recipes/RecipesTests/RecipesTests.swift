//
//  RecipesTests.swift
//  RecipesTests
//
//  Created by Eugene Berezin on 11/13/24.
//

import XCTest
@testable import Recipes

@MainActor
final class RecipesViewModelTests: XCTestCase {
    var viewModel: RecipesViewModel!
    var mockService: MockRecipeService!
    
     override func setUp() {
        super.setUp()
        mockService = MockRecipeService()
        viewModel = RecipesViewModel(recipeService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchRecipesSuccess() async {
        // Arrange
        let sampleRecipe = Recipe(
            id: "1",
            name: "Test Recipe",
            cuisine: "Italian",
            photoUrlLarge: nil,
            photoUrlSmall: nil,
            sourceUrl: nil,
            youtubeUrl: nil
        )
        mockService.mockData = [sampleRecipe]
        
        // Act
        await viewModel.fetchRecipes()
        
        // Assert
        XCTAssertEqual(viewModel.recipes.count, 1)
        XCTAssertEqual(viewModel.recipes.first?.name, "Test Recipe")
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testFetchRecipesEmptyData() async {
        // Arrange
        mockService.mockData = [] // No recipes returned
        
        // Act
        await viewModel.fetchRecipes()
        
        // Assert
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertNil(viewModel.errorMessage) // Expecting no error, just an empty result
    }
    
    func testFetchRecipesNetworkError() async {
        // Arrange
        mockService.shouldReturnError = true
        mockService.error = .requestFailed(NSError(domain: "", code: -1, userInfo: nil))
        
        // Act
        await viewModel.fetchRecipes()
        
        // Assert
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertEqual(viewModel.errorMessage, "Network request failed: The operation couldn’t be completed. ( error -1.)")
    }
    
    func testFetchRecipesDecodingError() async {
        // Arrange
        mockService.shouldReturnError = true
        mockService.error = .decodingFailed(NSError(domain: "", code: -1, userInfo: nil))
        
        // Act
        await viewModel.fetchRecipes()
        
        // Assert
        XCTAssertTrue(viewModel.recipes.isEmpty)
        XCTAssertEqual(viewModel.errorMessage, "Failed to decode the data: The operation couldn’t be completed. ( error -1.)")
    }
    
    
    
}
