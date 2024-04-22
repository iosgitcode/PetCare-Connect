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
    
extension UIViewController {
    func pushToViewController(withIdentifier identifier: String, urlToLoad: String) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: identifier) as? PetsDetailVC else {
            return
        }
        nextVC.urlToLoad = urlToLoad
        navigationController?.pushViewController(nextVC, animated: true)
    }
}


extension UIViewController {

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
