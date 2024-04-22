//
//  PetsTVCell.swift
//  PetCare Connect
//
//  Created by Dasharath Naik on 22/04/24.
//

import UIKit

class PetsTVCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var petImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: Pets) {
        self.name.text = model.title
    }
    
    func configure(with imageUrl: String) {
        petImage.load(urlString: imageUrl)
           // configure other cell properties if needed
       }
}
