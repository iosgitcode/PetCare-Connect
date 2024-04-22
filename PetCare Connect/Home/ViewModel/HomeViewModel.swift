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
    
    func getPetsData(completion: @escaping () -> Void) {
      
        let petsURL = APIEndpoint.pets
        NetworkManager.fetchData(url: petsURL ?? URL(fileURLWithPath: ""), type: PetsModel.self) { result in
            switch result {
            case .success(let data):
                self.petsData = data.pets ?? [Pets]()
                completion()
            case .failure(let error):
                print("Error fetching pets data: \(error)")
            }
        }
    }

    
    func getConfigData(completion: @escaping (()->Void)) {
        
        let configUrl = APIEndpoint.config
        NetworkManager.fetchData(url: configUrl ?? URL(fileURLWithPath: ""), type: ConfigModel.self) { result in
            switch result {
            case .success(let data):
                self.configData = data
                completion()
            case .failure(let error):
                print("Error fetching pets data: \(error)")
            }
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
