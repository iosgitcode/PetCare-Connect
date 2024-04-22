//
//  NetworkManager.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 22/04/24.
//


import Foundation

class NetworkManager {
    static func fetchData<T: Codable>(url: URL, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

