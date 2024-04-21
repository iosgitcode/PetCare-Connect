//
//  HomeViewModel.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import Foundation

class HomeViewModel {
    var petsData: [Pets] = []
    var configData: ConfigModel = ConfigModel()
    
    func getPetsData(completion: @escaping (()->Void)) {
        if let data = Helper.getDummyData(json: .Pets, type: PetsModel.self) {
            self.petsData = data.pets ?? [Pets]()
            completion()
        }else {
            
            print("File not found")
        }
    }
    
    func getConfigData(completion: @escaping (()->Void)) {
        if let data = Helper.getDummyData(json: .Config, type: ConfigModel.self) {
            self.configData = data
            completion()
        }
    }
}

struct ConfigModel: Codable {
    var settings: SettingsModel? = nil
}

struct SettingsModel: Codable {
    let isChatEnabled: Bool?
    let isCallEnabled: Bool?
    let workHours: String?
}
