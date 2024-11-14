//
//  NetworkManager.swift
//  Recipes
//
//  Created by Eugene Berezin on 11/13/24.
//

import Foundation

protocol RecipeService {
    func fetchRecipes(from urlString: String) async throws -> [Recipe]
}

class NetworkManager: RecipeService {
   
    func fetchRecipes(from urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode([String: [Recipe]].self, from: data)
                if let recipes = response["recipes"], !recipes.isEmpty {
                    return recipes
                } else {
                    throw NetworkError.emptyData
                }
            } catch {
                throw NetworkError.decodingFailed(error)
            }
            
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
