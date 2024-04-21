//
//  HeaderCell.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 21/04/24.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var borderedView: UIView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupUI() {
        self.setupBorderedView()
    }
    
    private func setupBorderedView() {
        self.borderedView.layer.borderWidth = 2
        self.borderedView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
