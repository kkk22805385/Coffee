//
//  TypeCell.swift
//  Coffee
//
//  Created by aa on 2021/1/5.
//

import UIKit

class TypeCell: UITableViewCell {

    @IBOutlet var labelName: UILabel!
    @IBOutlet var imgBg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
