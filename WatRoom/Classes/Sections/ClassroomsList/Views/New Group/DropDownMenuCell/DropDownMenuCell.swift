//
//  DropDownMenuCell.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

class DropDownMenuCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var separator: UIView!
    
    var displayText: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
