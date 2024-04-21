//
//  Helper.swift
//  
//
//  Created by Dasharath Naik on 21/04/24.
//

import Foundation

class Helper {
    static func getDummyData<T: Codable>(json: LocalJson, type: T.Type) -> T? {
        if let filePath = Bundle.main.url(forResource: json.rawValue, withExtension: "json"), let jsonData = try? Data(contentsOf:  filePath) {
            
            do {
                let json = try JSONDecoder().decode(T.self, from: jsonData)
                return json
            } catch {
                debugPrint("Json Parsing Error :- ", error.localizedDescription)
                return nil
            }
        } else {
            return nil
        }
    }
    
   static func isWithinOfficeHours() -> Bool {
        let calendar = Calendar.current
        let now = Date()
        
        let currentHour = calendar.component(.hour, from: now)
        
        let officeStartHour = 9
        let officeEndHour = 18
        
        return currentHour >= officeStartHour && currentHour < officeEndHour
    }
}
