//
//  NetworkManager.swift
//  HowManyOrcs
//
//  Created by Laslo on 5.6.2022.
//

import Foundation

enum OrcsErrors: Error {
    
    case invalidURL
    case defaultError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let basicURL = "https://russianwarship.rip/api/v1/"
    private let statsURL = basicURL + "statistics/latest"
    
    internal func getStats(completion: @escaping (Result<OrcsResponse, OrcsErrors>) -> Void) {
        guard let url = URL(string: self.statsURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.defaultError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.defaultError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(OrcsResponse.self, from: data)
                completion(.success(decoderResponse))
            } catch {
                completion(.failure(.defaultError))
            }
        }
        
        task.resume()
    }
}
