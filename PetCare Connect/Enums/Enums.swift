//
//  Enum.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import Foundation

enum LocalJson: String {
    case Pets = "pets"
    case Config = "config"
}

enum NetworkError: Error {
    case noData
    case invalidResponse
    case invalidStatusCode(Int)
}

enum APIEndpoint {
    static let baseURL = "https://iosgitcode.github.io/json-data"
    
    static var pets: URL? {
        if let url = URL(string: "\(baseURL)/pets.json") {
            return url
        } else {
            return nil
        }
    }
    
    static var config: URL? {
        if let url = URL(string: "\(baseURL)/config.json") {
            return url
        } else {
            return nil
        }
    }
   
}
