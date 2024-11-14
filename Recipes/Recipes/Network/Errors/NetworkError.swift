//
//  NetworkError.swift
//  Recipes
//
//  Created by Eugene Berezin on 11/13/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case noData
    case emptyData

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .requestFailed(let error):
            return "Network request failed: \(error.localizedDescription)"
        case .invalidResponse:
            return "The server response was invalid."
        case .decodingFailed(let error):
            return "Failed to decode the data: \(error.localizedDescription)"
        case .noData:
            return "No data was received from the server."
        case .emptyData:
            return "No recipes available at the moment."
        }
    }
}
