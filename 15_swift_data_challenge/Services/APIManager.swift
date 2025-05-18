//
//  APIManager.swift
//  15_swift_data_challenge
//
//  Created by Balázs Képli on 18/5/25.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode([User].self, from: data)
    }
    
    enum APIError: Error {
        case invalidURL
        case decodingError
        case networkError
    }
}
