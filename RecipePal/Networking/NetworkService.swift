//
//  NetworkService.swift
//  RecipePal
//
//  Created by Warrd Adlani on 19/06/2024.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case failedToDecodeJSON
    case unknownError
    case error(String)
}

typealias NetworkCompletion = (Result<[Recipe], NetworkError>) -> Void

class NetworkService {
    
    static var shared = NetworkService()
    
    private let baseURL = "https://dummyjson.com/recipes"
    
    private init(){}
        
    private (set) var recipesSubject = PassthroughSubject<[Recipe], Never>()
    
    func fetchRecipes(with limit: Int = 10, and completion: @escaping NetworkCompletion) {
        guard
            let url = URL(string: baseURL + "?limit=\(limit)")
        else {
            completion(.failure(.invalidURL))
            return
        }
        
        print(url.absoluteString)
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if
                let error = error {
                completion(.failure(.error(error.localizedDescription)))
            }
            
            guard
                let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode)
            else {
                completion(.failure(.unknownError))
                return
            }
            
            guard
                let data = data
            else {
                completion(.failure(.unknownError))
                return
            }
            
            printLog(data)
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(RecipeResponse.self, from: data)
                completion(.success(response.recipes))
            } catch {
                completion(.failure(.error(error.localizedDescription)))
            }
        }
        
        dataTask.resume()
    }
}
