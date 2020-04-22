//
//  NetworkManager.swift
//  CovidTracker
//
//  Created by John Kouris on 4/22/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://covidtracking.com/api/states"
    
    private init() {}
    
    func getStateResults(completed: @escaping (Result<[State], CTError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let states = try decoder.decode([State].self, from: data)
                let filteredStates = states.filter { $0.state != "PR" && $0.state != "AS" && $0.state != "GU" && $0.state != "MP" && $0.state != "VI"}
                completed(.success(filteredStates))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
