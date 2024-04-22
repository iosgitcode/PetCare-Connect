//
//  Extensions.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String?) {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
