//
//  TableViewCell.swift
//  appmember
//
//  Created by blackMBP on 1/4/60.
//  Copyright © พ.ศ. 2560 sukishiMAC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var txtPromotion: UILabel!
    
    @IBOutlet weak var uimg: UIImageView!
    @IBOutlet weak var imgPromotion: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
