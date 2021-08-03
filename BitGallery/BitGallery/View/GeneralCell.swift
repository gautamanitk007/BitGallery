//
//  GeneralCell.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import UIKit

class GeneralCell: UITableViewCell {
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblUUID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(_ vm:RepositoryViewModel){
        self.lblFullName.text = vm.fullName
        self.lblUUID.text = vm.uuId
        
    }
}

