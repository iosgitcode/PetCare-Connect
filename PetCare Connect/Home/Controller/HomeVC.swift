//  HomeVC.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var callButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    private func setupUI() {
        self.setupButtons()
    }
    
    private func setupButtons() {
        self.setupChatButton()
        self.setupCallButton()
    }
    
    private func setupChatButton() {
        self.chatButton.layer.cornerRadius = 10
    }
    
    private func setupCallButton() {
        self.callButton.layer.cornerRadius = 10
    }
    
}
