//
//  ClueTableViewCell.swift
//  StopThiefDataTest
//
//  Created by Stephen Kennedy on 2020-07-21.
//  Copyright © 2020 Stephen Kennedy. All rights reserved.
//

import UIKit

class ClueTableViewCell: UITableViewCell {

    @IBOutlet var locationNumber : UILabel!
    @IBOutlet var locationType : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
