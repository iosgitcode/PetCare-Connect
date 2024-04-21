//
//  PetsModel.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import Foundation

struct PetsModel: Codable {
    let pets: [Pets]?
}

struct Pets: Codable {
    let imageUrl: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case title
    }
}
